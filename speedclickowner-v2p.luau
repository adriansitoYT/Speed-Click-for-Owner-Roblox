print("[Speed Click for Owner v2] Cargando...")
task.wait(0.5)

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local player = Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui", 10)

local esMovil = UIS.TouchEnabled and not UIS.KeyboardEnabled

local ORO         = Color3.fromRGB(255, 195, 60)
local ORO_CLARO   = Color3.fromRGB(255, 225, 130)
local ORO_OSCURO  = Color3.fromRGB(180, 130, 30)
local AZUL_CIELO  = Color3.fromRGB(100, 200, 255)
local NEGRO       = Color3.fromRGB(14, 14, 18)
local NEGRO_2     = Color3.fromRGB(22, 22, 28)
local NEGRO_3     = Color3.fromRGB(30, 30, 38)
local TEXTO       = Color3.fromRGB(240, 235, 220)
local TEXTO_GRIS  = Color3.fromRGB(160, 155, 140)
local ROJO        = Color3.fromRGB(200, 55, 55)
local VERDE       = Color3.fromRGB(46, 160, 67)
local VERDE_CLARO = Color3.fromRGB(120, 220, 140)
local AMBAR       = Color3.fromRGB(240, 180, 120)

local TWEEN_HOVER   = TweenInfo.new(0.12, Enum.EasingStyle.Quad)
local TWEEN_COLOR   = TweenInfo.new(0.2, Enum.EasingStyle.Quad)
local TWEEN_SLIDE   = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local TWEEN_ENTRADA = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local TWEEN_SALIDA  = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

local running = false
local clickRemotes = {}
local flyActive = false
local flyBV, flyBG, flyConn
local TORRE = Vector3.new(230, 279, -204)
local yaDetectado = false
local clicksAcumulados = 0
local tiempoEncendido = 0
local tiempoInicioEncendido = nil
local conexiones = {}
local gradTweens = {}
local shineToken = 0
local clickConn = nil
local startToken = 0
local PRESUPUESTO_FRAME = 0.006
local numRemotesFijo = 0

local controlModule = nil
task.spawn(function()
    local ok, result = pcall(function()
        local ps = player:WaitForChild("PlayerScripts", 10)
        if not ps then return nil end
        local pm = require(ps:WaitForChild("PlayerModule", 10))
        if not pm then return nil end
        return pm:GetControls()
    end)
    if ok then controlModule = result end
end)

local function calcularEscala()
    local viewport = workspace.CurrentCamera.ViewportSize
    local escala = math.clamp(math.min(viewport.X / 1280, viewport.Y / 720), 0.6, 1.2)
    if esMovil then
        escala = math.min(escala, 0.8)
    end
    return escala
end

local escalaBase = calcularEscala()

local function tw(obj, info, props)
    local t = TweenService:Create(obj, info, props)
    t:Play()
    return t
end

local function conectar(signal, fn)
    local c = signal:Connect(fn)
    table.insert(conexiones, c)
    return c
end

local function girar(grad, duracion, desde)
    grad.Rotation = desde
    local t = TweenService:Create(grad, TweenInfo.new(duracion, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {Rotation = desde + 360})
    t:Play()
    table.insert(gradTweens, t)
end

local function pausarGradientes(pausa)
    for _, t in ipairs(gradTweens) do
        if pausa then t:Pause() else t:Play() end
    end
end

local gui = Instance.new("ScreenGui")
gui.Name = "SpeedClickOwnerV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = pg

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 300, 0, 478)
main.Position = UDim2.new(0.5, -150, 0.5, -239)
main.BackgroundColor3 = NEGRO
main.BorderSizePixel = 0
main.Active = true
main.ZIndex = 2
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)

local mainEscala = Instance.new("UIScale")
mainEscala.Scale = escalaBase
mainEscala.Parent = main

local mainGrad = Instance.new("UIGradient")
mainGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, NEGRO_2),
    ColorSequenceKeypoint.new(1, NEGRO)
})
mainGrad.Rotation = 90
mainGrad.Parent = main

local borde = Instance.new("UIStroke", main)
borde.Color = ORO
borde.Thickness = 1.5
borde.Transparency = 0.35

local bordeGrad = Instance.new("UIGradient")
bordeGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ORO_CLARO),
    ColorSequenceKeypoint.new(0.5, ORO),
    ColorSequenceKeypoint.new(1, ORO_OSCURO)
})
bordeGrad.Rotation = 45
bordeGrad.Parent = borde

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 64)
titleBar.BackgroundColor3 = NEGRO_3
titleBar.ZIndex = 3
titleBar.Parent = main
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 16)

local lineaOro = Instance.new("Frame")
lineaOro.Size = UDim2.new(1, -20, 0, 1)
lineaOro.Position = UDim2.new(0, 10, 1, -1)
lineaOro.BackgroundColor3 = ORO
lineaOro.BorderSizePixel = 0
lineaOro.ZIndex = 4
lineaOro.Parent = titleBar

local lineaGrad = Instance.new("UIGradient")
lineaGrad.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 0),
    NumberSequenceKeypoint.new(1, 1)
})
lineaGrad.Parent = lineaOro

local icono = Instance.new("Frame")
icono.Size = UDim2.new(0, 34, 0, 34)
icono.Position = UDim2.new(0, 11, 0, 15)
icono.BackgroundColor3 = ORO
icono.ZIndex = 4
icono.Parent = titleBar
Instance.new("UICorner", icono).CornerRadius = UDim.new(1, 0)

local iconoGrad = Instance.new("UIGradient")
iconoGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ORO_CLARO),
    ColorSequenceKeypoint.new(1, ORO_OSCURO)
})
iconoGrad.Rotation = 45
iconoGrad.Parent = icono

local iconoTexto = Instance.new("TextLabel")
iconoTexto.Size = UDim2.new(1, 0, 1, 0)
iconoTexto.BackgroundTransparency = 1
iconoTexto.Text = "SC"
iconoTexto.TextColor3 = NEGRO
iconoTexto.Font = Enum.Font.GothamBlack
iconoTexto.TextSize = 16
iconoTexto.ZIndex = 5
iconoTexto.Parent = icono

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -110, 0, 20)
title.Position = UDim2.new(0, 52, 0, 8)
title.BackgroundTransparency = 1
title.Text = "SPEED CLICK FOR OWNER"
title.TextColor3 = ORO
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextStrokeTransparency = 0.65
title.TextStrokeColor3 = NEGRO
title.ZIndex = 4
title.Parent = titleBar

local titleGrad = Instance.new("UIGradient")
titleGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ORO_CLARO),
    ColorSequenceKeypoint.new(0.5, ORO),
    ColorSequenceKeypoint.new(1, ORO_OSCURO)
})
titleGrad.Parent = title

local subFrame = Instance.new("Frame")
subFrame.Size = UDim2.new(1, -116, 0, 18)
subFrame.Position = UDim2.new(0, 52, 0, 32)
subFrame.BackgroundTransparency = 1
subFrame.ZIndex = 4
subFrame.Parent = titleBar

local subLayout = Instance.new("UIListLayout")
subLayout.FillDirection = Enum.FillDirection.Horizontal
subLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
subLayout.VerticalAlignment = Enum.VerticalAlignment.Center
subLayout.SortOrder = Enum.SortOrder.LayoutOrder
subLayout.Padding = UDim.new(0, 6)
subLayout.Parent = subFrame

local function crearSub(texto, color, orden)
    local l = Instance.new("TextLabel")
    l.AutomaticSize = Enum.AutomaticSize.X
    l.Size = UDim2.new(0, 0, 1, 0)
    l.BackgroundTransparency = 1
    l.Text = texto
    l.TextColor3 = color
    l.Font = Enum.Font.GothamBold
    l.TextSize = 11
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.TextWrapped = false
    l.LayoutOrder = orden
    l.ZIndex = 4
    l.Parent = subFrame
    return l
end

local subV2 = crearSub(esMovil and "v2" or "v2 PREMIUM", ORO, 1)

local subV2Grad = Instance.new("UIGradient")
subV2Grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ORO_CLARO),
    ColorSequenceKeypoint.new(0.5, ORO),
    ColorSequenceKeypoint.new(1, ORO_OSCURO)
})
subV2Grad.Parent = subV2

crearSub("·", TEXTO_GRIS, 2)
crearSub("by adrianfis", AZUL_CIELO, 3)
crearSub("·", TEXTO_GRIS, 4)
crearSub(esMovil and "Mobile" or "PC", VERDE_CLARO, 5)

girar(titleGrad, 3, 0)
girar(subV2Grad, 3, 0)
girar(bordeGrad, 6, 45)

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 28, 0, 28)
minBtn.Position = UDim2.new(1, -64, 0, 18)
minBtn.BackgroundColor3 = NEGRO_2
minBtn.Text = "−"
minBtn.TextColor3 = ORO
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 20
minBtn.ZIndex = 4
minBtn.Parent = titleBar
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 8)
local minBorde = Instance.new("UIStroke", minBtn)
minBorde.Color = ORO
minBorde.Thickness = 1
minBorde.Transparency = 0.5

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -32, 0, 18)
closeBtn.BackgroundColor3 = ROJO
closeBtn.Text = "X"
closeBtn.TextColor3 = TEXTO
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.ZIndex = 4
closeBtn.Parent = titleBar
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

local circleWrapper = Instance.new("Frame")
circleWrapper.Size = UDim2.new(0, 64, 0, 64)
circleWrapper.Position = UDim2.new(0.5, -32, 0.5, -32)
circleWrapper.BackgroundTransparency = 1
circleWrapper.Visible = false
circleWrapper.ZIndex = 10
circleWrapper.Parent = gui

local circle = Instance.new("TextButton")
circle.Size = UDim2.new(1, 0, 1, 0)
circle.BackgroundColor3 = ORO
circle.Text = ""
circle.AutoButtonColor = false
circle.Active = true
circle.ZIndex = 11
circle.Parent = circleWrapper
Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

local circleGrad = Instance.new("UIGradient")
circleGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ORO_CLARO),
    ColorSequenceKeypoint.new(0.5, ORO),
    ColorSequenceKeypoint.new(1, ORO_OSCURO)
})
circleGrad.Rotation = 45
circleGrad.Parent = circle

local circleBordeExt = Instance.new("UIStroke", circle)
circleBordeExt.Color = ORO_CLARO
circleBordeExt.Thickness = 3
circleBordeExt.Transparency = 0.2

local circleBordeInt = Instance.new("UIStroke", circle)
circleBordeInt.Color = NEGRO
circleBordeInt.Thickness = 1
circleBordeInt.Transparency = 0.6

local circleTexto = Instance.new("TextLabel")
circleTexto.Size = UDim2.new(1, 0, 1, 0)
circleTexto.BackgroundTransparency = 1
circleTexto.Text = "SC"
circleTexto.TextColor3 = NEGRO
circleTexto.Font = Enum.Font.GothamBlack
circleTexto.TextSize = 22
circleTexto.ZIndex = 12
circleTexto.Parent = circle

local circleTextoGrad = Instance.new("UIGradient")
circleTextoGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 40, 10)),
    ColorSequenceKeypoint.new(1, NEGRO)
})
circleTextoGrad.Rotation = 90
circleTextoGrad.Parent = circleTexto

local circleEscala = Instance.new("UIScale")
circleEscala.Parent = circleWrapper
circleEscala.Scale = 0

local glowCirculo = TweenService:Create(
    circleBordeExt,
    TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    {Transparency = 0.6}
)

local navBar = Instance.new("Frame")
navBar.Size = UDim2.new(1, -28, 0, 40)
navBar.Position = UDim2.new(0, 14, 0, 72)
navBar.BackgroundColor3 = NEGRO
navBar.BorderSizePixel = 0
navBar.ZIndex = 5
navBar.Parent = main
Instance.new("UICorner", navBar).CornerRadius = UDim.new(0, 12)

local navBorde = Instance.new("UIStroke", navBar)
navBorde.Color = ORO
navBorde.Thickness = 1.5
navBorde.Transparency = 0.4

local prevBtn = Instance.new("TextButton")
prevBtn.Size = UDim2.new(0, 30, 1, -10)
prevBtn.Position = UDim2.new(0, 5, 0, 5)
prevBtn.BackgroundColor3 = ORO
prevBtn.Text = "←"
prevBtn.TextColor3 = NEGRO
prevBtn.Font = Enum.Font.GothamBold
prevBtn.TextSize = 16
prevBtn.ZIndex = 6
prevBtn.Parent = navBar
Instance.new("UICorner", prevBtn).CornerRadius = UDim.new(0, 8)

local nextBtn = Instance.new("TextButton")
nextBtn.Size = UDim2.new(0, 30, 1, -10)
nextBtn.Position = UDim2.new(1, -35, 0, 5)
nextBtn.BackgroundColor3 = ORO
nextBtn.Text = "→"
nextBtn.TextColor3 = NEGRO
nextBtn.Font = Enum.Font.GothamBold
nextBtn.TextSize = 16
nextBtn.ZIndex = 6
nextBtn.Parent = navBar
Instance.new("UICorner", nextBtn).CornerRadius = UDim.new(0, 8)

local pageIndicator = Instance.new("TextLabel")
pageIndicator.Size = UDim2.new(1, -80, 1, 0)
pageIndicator.Position = UDim2.new(0, 40, 0, 0)
pageIndicator.BackgroundTransparency = 1
pageIndicator.Text = "PÁGINA 1 / 2"
pageIndicator.TextColor3 = ORO
pageIndicator.Font = Enum.Font.GothamBold
pageIndicator.TextSize = 12
pageIndicator.ZIndex = 6
pageIndicator.Parent = navBar

local pageContainer = Instance.new("Frame")
pageContainer.Size = UDim2.new(1, 0, 1, -128)
pageContainer.Position = UDim2.new(0, 0, 0, 120)
pageContainer.BackgroundTransparency = 1
pageContainer.ClipsDescendants = true
pageContainer.ZIndex = 3
pageContainer.Parent = main

local page1 = Instance.new("Frame")
page1.Size = UDim2.new(1, 0, 1, 0)
page1.BackgroundTransparency = 1
page1.ZIndex = 3
page1.Parent = pageContainer

local page2 = Instance.new("Frame")
page2.Size = UDim2.new(1, 0, 1, 0)
page2.BackgroundTransparency = 1
page2.Visible = false
page2.ZIndex = 3
page2.Parent = pageContainer

local paginaActual = 1

local statsPanel = Instance.new("Frame")
statsPanel.Size = UDim2.new(1, -28, 0, 56)
statsPanel.Position = UDim2.new(0, 14, 0, 6)
statsPanel.BackgroundColor3 = NEGRO_2
statsPanel.BorderSizePixel = 0
statsPanel.ZIndex = 3
statsPanel.Parent = page1
Instance.new("UICorner", statsPanel).CornerRadius = UDim.new(0, 10)

local statsBorde = Instance.new("UIStroke", statsPanel)
statsBorde.Color = ORO
statsBorde.Thickness = 1
statsBorde.Transparency = 0.6

local function crearStat(parent, xPos, ancho, tituloTexto)
    local cont = Instance.new("Frame")
    cont.Size = UDim2.new(ancho, -8, 1, -18)
    cont.Position = UDim2.new(xPos, 4, 0, 6)
    cont.BackgroundTransparency = 1
    cont.ZIndex = 4
    cont.Parent = parent

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 14)
    t.BackgroundTransparency = 1
    t.Text = tituloTexto
    t.TextColor3 = TEXTO_GRIS
    t.Font = Enum.Font.GothamBold
    t.TextSize = 11
    t.ZIndex = 5
    t.Parent = cont

    local v = Instance.new("TextLabel")
    v.Size = UDim2.new(1, 0, 0, 22)
    v.Position = UDim2.new(0, 0, 0, 14)
    v.BackgroundTransparency = 1
    v.Text = "—"
    v.TextColor3 = ORO
    v.Font = Enum.Font.GothamBold
    v.TextSize = 20
    v.ZIndex = 5
    v.Parent = cont

    return v
end

local statCPS = crearStat(statsPanel, 0, 0.5, "CPS")
local statTiempo = crearStat(statsPanel, 0.5, 0.5, "TIEMPO ENCENDIDO")

local cpsBarBg = Instance.new("Frame")
cpsBarBg.Size = UDim2.new(1, -16, 0, 6)
cpsBarBg.Position = UDim2.new(0, 8, 0, 46)
cpsBarBg.BackgroundColor3 = NEGRO_3
cpsBarBg.BorderSizePixel = 0
cpsBarBg.ZIndex = 4
cpsBarBg.Parent = statsPanel
Instance.new("UICorner", cpsBarBg).CornerRadius = UDim.new(1, 0)

local cpsBarFill = Instance.new("Frame")
cpsBarFill.Size = UDim2.new(0, 0, 1, 0)
cpsBarFill.BackgroundColor3 = ORO
cpsBarFill.BorderSizePixel = 0
cpsBarFill.ZIndex = 5
cpsBarFill.Parent = cpsBarBg
Instance.new("UICorner", cpsBarFill).CornerRadius = UDim.new(1, 0)

local funcionando = Instance.new("TextLabel")
funcionando.Size = UDim2.new(1, -28, 0, 26)
funcionando.Position = UDim2.new(0, 14, 0, 68)
funcionando.BackgroundColor3 = NEGRO_2
funcionando.BorderSizePixel = 0
funcionando.Text = "●  Apagado"
funcionando.TextColor3 = TEXTO_GRIS
funcionando.Font = Enum.Font.GothamBold
funcionando.TextSize = 14
funcionando.ZIndex = 3
funcionando.Parent = page1
Instance.new("UICorner", funcionando).CornerRadius = UDim.new(0, 8)

local estadoBorde = Instance.new("UIStroke", funcionando)
estadoBorde.Color = TEXTO_GRIS
estadoBorde.Thickness = 1
estadoBorde.Transparency = 0.6

local pulsoEstado = TweenService:Create(
    estadoBorde,
    TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    {Transparency = 0.1}
)

local speedBtn = Instance.new("TextButton")
speedBtn.Size = UDim2.new(1, -28, 0, 46)
speedBtn.Position = UDim2.new(0, 14, 0, 100)
speedBtn.BackgroundColor3 = Color3.new(1, 1, 1)
speedBtn.Text = ""
speedBtn.TextColor3 = NEGRO
speedBtn.Font = Enum.Font.GothamBold
speedBtn.TextSize = 18
speedBtn.ClipsDescendants = true
speedBtn.ZIndex = 3
speedBtn.Parent = page1
Instance.new("UICorner", speedBtn).CornerRadius = UDim.new(0, 12)

local speedGrad = Instance.new("UIGradient")
speedGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ORO_CLARO),
    ColorSequenceKeypoint.new(1, ORO)
})
speedGrad.Rotation = 90
speedGrad.Parent = speedBtn

local btnBorde = Instance.new("UIStroke", speedBtn)
btnBorde.Color = ORO_CLARO
btnBorde.Thickness = 1.5
btnBorde.Transparency = 0.4

local speedShine = Instance.new("Frame")
speedShine.Size = UDim2.new(0.35, 0, 1.4, 0)
speedShine.Position = UDim2.new(-0.5, 0, -0.2, 0)
speedShine.BackgroundColor3 = Color3.new(1, 1, 1)
speedShine.BackgroundTransparency = 0
speedShine.BorderSizePixel = 0
speedShine.Rotation = 20
speedShine.ZIndex = 4
speedShine.Parent = speedBtn

local shineGrad = Instance.new("UIGradient")
shineGrad.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 0.55),
    NumberSequenceKeypoint.new(1, 1)
})
shineGrad.Parent = speedShine

local speedText = Instance.new("TextLabel")
speedText.Size = UDim2.new(1, 0, 1, 0)
speedText.BackgroundTransparency = 1
speedText.Text = "▶  START"
speedText.TextColor3 = NEGRO
speedText.Font = Enum.Font.GothamBold
speedText.TextSize = 18
speedText.ZIndex = 5
speedText.Parent = speedBtn

local etiquetaTiempo = Instance.new("TextLabel")
etiquetaTiempo.Size = UDim2.new(1, -28, 0, 14)
etiquetaTiempo.Position = UDim2.new(0, 14, 0, 150)
etiquetaTiempo.BackgroundTransparency = 1
etiquetaTiempo.Text = "TIEMPO POR CLICK (segundos)"
etiquetaTiempo.TextColor3 = TEXTO_GRIS
etiquetaTiempo.Font = Enum.Font.GothamBold
etiquetaTiempo.TextSize = 11
etiquetaTiempo.TextXAlignment = Enum.TextXAlignment.Left
etiquetaTiempo.ZIndex = 3
etiquetaTiempo.Parent = page1

local waitBox = Instance.new("TextBox")
waitBox.Size = UDim2.new(1, -28, 0, 32)
waitBox.Position = UDim2.new(0, 14, 0, 168)
waitBox.BackgroundColor3 = NEGRO_2
waitBox.BorderSizePixel = 0
waitBox.Text = "0.005"
waitBox.PlaceholderText = "0.005"
waitBox.TextColor3 = ORO
waitBox.Font = Enum.Font.GothamBold
waitBox.TextSize = 16
waitBox.ZIndex = 3
waitBox.Parent = page1
Instance.new("UICorner", waitBox).CornerRadius = UDim.new(0, 10)

local boxBorde = Instance.new("UIStroke", waitBox)
boxBorde.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
boxBorde.Color = ORO
boxBorde.Thickness = 1
boxBorde.Transparency = 0.5

local flyBtn = Instance.new("TextButton")
flyBtn.Size = UDim2.new(1, -28, 0, 40)
flyBtn.Position = UDim2.new(0, 14, 0, 208)
flyBtn.BackgroundColor3 = NEGRO_3
flyBtn.Text = "✈  FLY: OFF"
flyBtn.TextColor3 = ORO
flyBtn.Font = Enum.Font.GothamBold
flyBtn.TextSize = 15
flyBtn.ZIndex = 3
flyBtn.Parent = page1
Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0, 12)

local flyBorde = Instance.new("UIStroke", flyBtn)
flyBorde.Color = ORO
flyBorde.Thickness = 1.5
flyBorde.Transparency = 0.4

local controles = Instance.new("TextLabel")
controles.Size = UDim2.new(1, -28, 0, 18)
controles.Position = UDim2.new(0, 14, 0, 252)
controles.BackgroundTransparency = 1
controles.Text = esMovil and "" or "WASD mover · Espacio subir · Ctrl bajar"
controles.TextColor3 = TEXTO_GRIS
controles.Font = Enum.Font.Gotham
controles.TextSize = 11
controles.TextXAlignment = Enum.TextXAlignment.Left
controles.TextWrapped = true
controles.ZIndex = 3
controles.Parent = page1

local tpBtn = Instance.new("TextButton")
tpBtn.Size = UDim2.new(1, -28, 0, 46)
tpBtn.Position = UDim2.new(0, 14, 0, 278)
tpBtn.BackgroundColor3 = NEGRO_3
tpBtn.Text = "⌂  IR A LA TORRE"
tpBtn.TextColor3 = ORO
tpBtn.Font = Enum.Font.GothamBold
tpBtn.TextSize = 15
tpBtn.ZIndex = 3
tpBtn.Parent = page1
Instance.new("UICorner", tpBtn).CornerRadius = UDim.new(0, 12)

local tpBorde = Instance.new("UIStroke", tpBtn)
tpBorde.Color = ORO
tpBorde.Thickness = 1.5
tpBorde.Transparency = 0.4

local antiafkLabel = Instance.new("TextLabel")
antiafkLabel.Size = UDim2.new(1, -28, 0, 16)
antiafkLabel.Position = UDim2.new(0, 14, 0, 330)
antiafkLabel.BackgroundTransparency = 1
antiafkLabel.Text = "AntiAFK: ACTIVO"
antiafkLabel.TextColor3 = VERDE_CLARO
antiafkLabel.Font = Enum.Font.GothamBold
antiafkLabel.TextSize = 11
antiafkLabel.TextXAlignment = Enum.TextXAlignment.Center
antiafkLabel.ZIndex = 3
antiafkLabel.Parent = page1

local page2Titulo = Instance.new("TextLabel")
page2Titulo.Size = UDim2.new(1, -28, 0, 24)
page2Titulo.Position = UDim2.new(0, 14, 0, 8)
page2Titulo.BackgroundTransparency = 1
page2Titulo.Text = "PRÓXIMAMENTE"
page2Titulo.TextColor3 = ORO
page2Titulo.Font = Enum.Font.GothamBold
page2Titulo.TextSize = 16
page2Titulo.TextXAlignment = Enum.TextXAlignment.Left
page2Titulo.ZIndex = 3
page2Titulo.Parent = page2

local page2Info = Instance.new("TextLabel")
page2Info.Size = UDim2.new(1, -28, 0, 240)
page2Info.Position = UDim2.new(0, 14, 0, 40)
page2Info.BackgroundColor3 = NEGRO_2
page2Info.BorderSizePixel = 0
page2Info.Text = ""
page2Info.TextColor3 = TEXTO_GRIS
page2Info.Font = Enum.Font.GothamBold
page2Info.TextSize = 12
page2Info.TextWrapped = true
page2Info.TextXAlignment = Enum.TextXAlignment.Left
page2Info.TextYAlignment = Enum.TextYAlignment.Top
page2Info.ZIndex = 3
page2Info.Parent = page2
Instance.new("UICorner", page2Info).CornerRadius = UDim.new(0, 10)

local page2Borde = Instance.new("UIStroke", page2Info)
page2Borde.Color = ORO
page2Borde.Thickness = 1
page2Borde.Transparency = 0.6

local function setupBoton(btn, sinBorde)
    local scale = Instance.new("UIScale")
    scale.Scale = 1
    scale.Parent = btn
    local stroke = (not sinBorde) and btn:FindFirstChildOfClass("UIStroke") or nil
    local baseT = stroke and stroke.Transparency or 0
    local hover = false
    local press = false

    local function aplicar()
        local s = press and 0.95 or (hover and 1.05 or 1)
        tw(scale, TWEEN_HOVER, {Scale = s})
        if stroke then
            tw(stroke, TWEEN_HOVER, {Transparency = hover and math.max(0, baseT - 0.25) or baseT})
        end
    end

    if not esMovil then
        btn.MouseEnter:Connect(function()
            hover = true
            aplicar()
        end)
        btn.MouseLeave:Connect(function()
            hover = false
            press = false
            aplicar()
        end)
    end

    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            press = true
            aplicar()
        end
    end)

    btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            press = false
            aplicar()
        end
    end)
end

setupBoton(speedBtn)
setupBoton(flyBtn)
setupBoton(tpBtn)
setupBoton(nextBtn)
setupBoton(prevBtn)
setupBoton(minBtn)
setupBoton(closeBtn)
setupBoton(circle, true)

local function actualizarNav()
    tw(prevBtn, TWEEN_COLOR, {BackgroundTransparency = paginaActual == 1 and 0.65 or 0})
    tw(nextBtn, TWEEN_COLOR, {BackgroundTransparency = paginaActual == 2 and 0.65 or 0})
end

actualizarNav()

local transicionando = false
local function irAPagina(n)
    if transicionando or n == paginaActual then return end
    transicionando = true
    paginaActual = n
    pageIndicator.Text = "PÁGINA " .. n .. " / 2"
    actualizarNav()
    local t
    if n == 1 then
        page1.Visible = true
        page2.Visible = true
        page1.Position = UDim2.new(-1, 0, 0, 0)
        page2.Position = UDim2.new(0, 0, 0, 0)
        t = tw(page1, TWEEN_SLIDE, {Position = UDim2.new(0, 0, 0, 0)})
        tw(page2, TWEEN_SLIDE, {Position = UDim2.new(1, 0, 0, 0)})
        t.Completed:Wait()
        page2.Visible = false
    else
        page1.Visible = true
        page2.Visible = true
        page1.Position = UDim2.new(0, 0, 0, 0)
        page2.Position = UDim2.new(1, 0, 0, 0)
        t = tw(page1, TWEEN_SLIDE, {Position = UDim2.new(-1, 0, 0, 0)})
        tw(page2, TWEEN_SLIDE, {Position = UDim2.new(0, 0, 0, 0)})
        t.Completed:Wait()
        page1.Visible = false
    end
    transicionando = false
end

nextBtn.MouseButton1Click:Connect(function()
    if paginaActual < 2 then irAPagina(paginaActual + 1) end
end)

prevBtn.MouseButton1Click:Connect(function()
    if paginaActual > 1 then irAPagina(paginaActual - 1) end
end)

local function detectar()
    if yaDetectado and #clickRemotes > 0 then return end
    clickRemotes = {}
    for _, obj in ipairs(RS:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            local n = obj.Name:lower()
            if n:find("click") or n:find("tap") or n:find("touch") or n:find("hit")
               or n:find("point") or n:find("income") or n:find("earn") or n:find("farm")
               or n:find("work") or n:find("gain") or n:find("reward") or n:find("power")
               or n:find("punch") or n:find("attack") or n:find("mine") or n:find("swing") then
                table.insert(clickRemotes, obj)
            end
        end
    end
    if #clickRemotes == 0 then
        for _, obj in ipairs(RS:GetDescendants()) do
            if obj:IsA("RemoteEvent") then
                table.insert(clickRemotes, obj)
            end
        end
    end
    yaDetectado = true
end

local function formatearTiempo(segs)
    segs = math.floor(segs)
    local h = math.floor(segs / 3600)
    local m = math.floor((segs % 3600) / 60)
    local s = segs % 60
    if h > 0 then
        return string.format("%dh %dm %ds", h, m, s)
    elseif m > 0 then
        return string.format("%dm %ds", m, s)
    else
        return string.format("%ds", s)
    end
end

local function iniciarShine()
    shineToken += 1
    local mi = shineToken
    task.spawn(function()
        while running and shineToken == mi and gui.Parent do
            if main.Visible then
                speedShine.Position = UDim2.new(-0.5, 0, -0.2, 0)
                tw(speedShine, TweenInfo.new(0.9, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(1.2, 0, -0.2, 0)})
                task.wait(2.4)
            else
                task.wait(0.5)
            end
        end
    end)
end

local function setRunning(on)
    running = on
    if on then
        speedText.Text = "■  STOP"
        tw(speedBtn, TWEEN_COLOR, {BackgroundColor3 = ROJO})
        speedGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 100, 100)),
            ColorSequenceKeypoint.new(1, ROJO)
        })
        tw(btnBorde, TWEEN_COLOR, {Color = Color3.fromRGB(240, 130, 130)})
        funcionando.Text = "●  Encendido"
        tw(funcionando, TWEEN_COLOR, {TextColor3 = VERDE_CLARO})
        estadoBorde.Color = VERDE_CLARO
        pulsoEstado:Play()
        iniciarShine()
        if not tiempoInicioEncendido then
            tiempoInicioEncendido = os.clock() - tiempoEncendido
        end
    else
        shineToken += 1
        pulsoEstado:Cancel()
        estadoBorde.Transparency = 0.6
        speedText.Text = "▶  START"
        tw(speedBtn, TWEEN_COLOR, {BackgroundColor3 = Color3.new(1, 1, 1)})
        speedGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, ORO_CLARO),
            ColorSequenceKeypoint.new(1, ORO)
        })
        tw(btnBorde, TWEEN_COLOR, {Color = ORO_CLARO})
        funcionando.Text = "●  Apagado"
        tw(funcionando, TWEEN_COLOR, {TextColor3 = TEXTO_GRIS})
        estadoBorde.Color = TEXTO_GRIS
        if tiempoInicioEncendido then
            tiempoEncendido = os.clock() - tiempoInicioEncendido
            tiempoInicioEncendido = nil
        end
    end
end

local function stopFly()
    flyActive = false
    if flyConn then flyConn:Disconnect() flyConn = nil end
    if flyBV then flyBV:Destroy() flyBV = nil end
    if flyBG then flyBG:Destroy() flyBG = nil end
    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end
    flyBtn.Text = "✈  FLY: OFF"
    tw(flyBtn, TWEEN_COLOR, {BackgroundColor3 = NEGRO_3, TextColor3 = ORO})
end

local function startFly()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end

    flyActive = true
    hum.PlatformStand = true

    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(40000, 40000, 40000)
    flyBV.Velocity = Vector3.zero
    flyBV.Parent = hrp

    flyBG = Instance.new("BodyGyro")
    flyBG.P = 9000
    flyBG.MaxTorque = Vector3.new(40000, 40000, 40000)
    flyBG.CFrame = hrp.CFrame
    flyBG.Parent = hrp

    flyBtn.Text = "✈  FLY: ON"
    tw(flyBtn, TWEEN_COLOR, {BackgroundColor3 = ORO, TextColor3 = NEGRO})

    local camera = workspace.CurrentCamera
    local speed = 80

    flyConn = RunService.RenderStepped:Connect(function()
        if not flyActive or not hrp or not hrp.Parent then
            stopFly()
            return
        end

        local dir = Vector3.zero

        -- ✅ Si controlModule está disponible, usar GetMoveVector (funciona en móvil y PC)
        if controlModule then
            local ok, moveVector = pcall(function()
                return controlModule:GetMoveVector()
            end)
            if ok and typeof(moveVector) == "Vector3" then
                -- GetMoveVector devuelve X (derecha/izquierda) y Z (adelante/atrás) en espacio de cámara
                dir = camera.CFrame.RightVector * moveVector.X + camera.CFrame.LookVector * (-moveVector.Z)
            end
        else
            -- Fallback para PC si controlModule aún no cargó
            if UIS:IsKeyDown(Enum.KeyCode.W) then dir = dir + camera.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then dir = dir - camera.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then dir = dir - camera.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then dir = dir + camera.CFrame.RightVector end
        end

        -- ✅ Movimiento vertical adicional (Espacio en PC, botón de salto en móvil)
        if UIS:IsKeyDown(Enum.KeyCode.Space) then
            dir = dir + Vector3.yAxis
        end

        if dir.Magnitude > 0 then dir = dir.Unit end
        flyBV.Velocity = dir * speed
        flyBG.CFrame = camera.CFrame
    end)
end

-- ✅ START: cambio visual inmediato, calibración en paralelo
speedBtn.MouseButton1Click:Connect(function()
    if running then
        startToken += 1
        setRunning(false)
        return
    end

    startToken += 1
    local myToken = startToken

    setRunning(true)

    funcionando.Text = "●  Calibrando..."
    tw(funcionando, TWEEN_COLOR, {TextColor3 = AMBAR})
    estadoBorde.Color = AMBAR

    task.spawn(function()
        detectar()
        yaDetectado = false
        detectar()
        task.wait(0.5)

        if myToken ~= startToken then return end
        if not gui.Parent then return end
        if not running then return end

        if #clickRemotes == 0 then
            setRunning(false)
            funcionando.Text = "●  Sin remotes"
            tw(funcionando, TWEEN_COLOR, {TextColor3 = AMBAR})
            estadoBorde.Color = AMBAR
            return
        end

        numRemotesFijo = #clickRemotes
        funcionando.Text = "●  Encendido"
        tw(funcionando, TWEEN_COLOR, {TextColor3 = VERDE_CLARO})
        estadoBorde.Color = VERDE_CLARO

        local numRemotes = numRemotesFijo
        local acumulado = 0
        local t = tonumber(waitBox.Text) or 0.005
        if t <= 0 then t = 0.005 end
        if t < 0.0001 then t = 0.0001 end

        if clickConn then clickConn:Disconnect() end
        clickConn = RunService.Heartbeat:Connect(function(dt)
            if not running or myToken ~= startToken then
                if clickConn then clickConn:Disconnect() clickConn = nil end
                return
            end
            acumulado += dt
            local limite = os.clock() + PRESUPUESTO_FRAME
            while acumulado >= t do
                acumulado -= t
                for j = 1, numRemotes do
                    local r = clickRemotes[j]
                    if r then
                        pcall(r.FireServer, r)
                        clicksAcumulados += 1
                    end
                end
                if os.clock() >= limite then
                    acumulado = 0
                    break
                end
            end
        end)
    end)
end)

flyBtn.MouseButton1Click:Connect(function()
    if flyActive then stopFly() else startFly() end
end)

tpBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(TORRE)
        end
    end
end)

waitBox.Focused:Connect(function()
    tw(boxBorde, TWEEN_HOVER, {Transparency = 0, Thickness = 2})
end)

waitBox.FocusLost:Connect(function()
    tw(boxBorde, TWEEN_HOVER, {Transparency = 0.5, Thickness = 1})
    local t = tonumber(waitBox.Text)
    if not t or t <= 0 then
        waitBox.Text = "0.005"
    end
    pcall(function()
        player:SetAttribute("SCO_v2_wait", tonumber(waitBox.Text) or 0.005)
    end)
end)

pcall(function()
    local saved = player:GetAttribute("SCO_v2_wait")
    if saved then waitBox.Text = tostring(saved) end
end)

task.spawn(function()
    task.wait(1)
    detectar()
end)

task.spawn(function()
    local enReposo = false
    while gui.Parent do
        task.wait(1)
        if running then
            enReposo = false
            local cpsActual = clicksAcumulados
            clicksAcumulados = 0
            if main.Visible then
                statCPS.Text = tostring(cpsActual)
                if tiempoInicioEncendido then
                    statTiempo.Text = formatearTiempo(os.clock() - tiempoInicioEncendido)
                end
                local fill = running and 1 or 0
                tw(cpsBarFill, TweenInfo.new(0.7, Enum.EasingStyle.Quad), {
                    Size = UDim2.new(fill, 0, 1, 0)
                })
            end
        elseif not enReposo then
            enReposo = true
            clicksAcumulados = 0
            statCPS.Text = "0"
            statTiempo.Text = tiempoEncendido > 0 and formatearTiempo(tiempoEncendido) or "0s"
            tw(cpsBarFill, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 0, 1, 0)
            })
        end
    end
end)

conectar(player.Idled, function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new(0, 0))
end)

conectar(player.CharacterAdded, function()
    if flyActive then stopFly() end
end)

local savedPos = main.Position
local primeraVez = true
local animando = false

local function minimizar()
    if animando then return end
    animando = true
    savedPos = main.Position
    local t = tw(mainEscala, TWEEN_SALIDA, {Scale = 0})
    t.Completed:Wait()
    main.Visible = false
    pausarGradientes(true)
    if primeraVez then
        circleWrapper.Position = UDim2.new(0.5, -32, 0.5, -32)
        primeraVez = false
    end
    circleWrapper.Visible = true
    circleEscala.Scale = 0
    tw(circleEscala, TWEEN_ENTRADA, {Scale = 1})
    glowCirculo:Play()
    animando = false
end

local function restaurar()
    if animando then return end
    animando = true
    glowCirculo:Cancel()
    circleBordeExt.Transparency = 0.2
    local t = tw(circleEscala, TWEEN_SALIDA, {Scale = 0})
    t.Completed:Wait()
    circleWrapper.Visible = false
    main.Position = savedPos
    mainEscala.Scale = escalaBase
    main.Visible = true
    pausarGradientes(false)
    tw(mainEscala, TWEEN_ENTRADA, {Scale = escalaBase})
    animando = false
end

minBtn.MouseButton1Click:Connect(minimizar)

local cDrag = false
local cStart = nil
local cPos = nil
local cMovido = false
local dragging = false
local dragStart = nil
local startPos = nil

circle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        cDrag = true
        cStart = input.Position
        cPos = circleWrapper.Position
        cMovido = false
    end
end)

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

conectar(UIS.InputChanged, function(input)
    if not (cDrag or dragging) then return end
    local tipo = input.UserInputType
    if tipo ~= Enum.UserInputType.MouseMovement and tipo ~= Enum.UserInputType.Touch then return end
    if cDrag then
        local delta = input.Position - cStart
        if math.abs(delta.X) > 8 or math.abs(delta.Y) > 8 then
            cMovido = true
            circleWrapper.Position = UDim2.new(cPos.X.Scale, cPos.X.Offset + delta.X, cPos.Y.Scale, cPos.Y.Offset + delta.Y)
        end
    end
    if dragging then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

conectar(UIS.InputEnded, function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local fueClick = cDrag and not cMovido
        cDrag = false
        dragging = false
        if fueClick then
            task.spawn(restaurar)
        end
    end
end)

-- ============================================================
-- DIÁLOGO DE CONFIRMACIÓN CON CUENTA REGRESIVA
-- ============================================================
local confirmando = false
local confirmTimer = nil
local confirmCountdownTask = nil
local confirmSession = 0

local confirmFrame = Instance.new("Frame")
confirmFrame.Size = UDim2.new(0, 200, 0, 120)
confirmFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
confirmFrame.AnchorPoint = Vector2.new(0.5, 0.5)
confirmFrame.BackgroundColor3 = NEGRO_2
confirmFrame.BorderSizePixel = 0
confirmFrame.ZIndex = 50
confirmFrame.Visible = false
confirmFrame.Parent = gui
Instance.new("UICorner", confirmFrame).CornerRadius = UDim.new(0, 12)

local confirmEscala = Instance.new("UIScale")
confirmEscala.Scale = 0.8
confirmEscala.Parent = confirmFrame

local confirmBorde = Instance.new("UIStroke", confirmFrame)
confirmBorde.Color = ORO
confirmBorde.Thickness = 1.5
confirmBorde.Transparency = 0.3

local confirmTexto = Instance.new("TextLabel")
confirmTexto.Size = UDim2.new(1, -20, 0, 24)
confirmTexto.Position = UDim2.new(0, 10, 0, 8)
confirmTexto.BackgroundTransparency = 1
confirmTexto.Text = "¿Seguro que quieres cerrar?"
confirmTexto.TextColor3 = TEXTO
confirmTexto.Font = Enum.Font.GothamBold
confirmTexto.TextSize = 12
confirmTexto.ZIndex = 51
confirmTexto.Parent = confirmFrame

local confirmTiempo = Instance.new("TextLabel")
confirmTiempo.Size = UDim2.new(1, -20, 0, 20)
confirmTiempo.Position = UDim2.new(0, 10, 0, 34)
confirmTiempo.BackgroundTransparency = 1
confirmTiempo.Text = "5s"
confirmTiempo.TextColor3 = AMBAR
confirmTiempo.Font = Enum.Font.GothamBold
confirmTiempo.TextSize = 14
confirmTiempo.ZIndex = 51
confirmTiempo.Parent = confirmFrame

local confirmSi = Instance.new("TextButton")
confirmSi.Size = UDim2.new(0.45, 0, 0, 34)
confirmSi.Position = UDim2.new(0.03, 0, 0, 68)
confirmSi.BackgroundColor3 = ROJO
confirmSi.Text = "SÍ"
confirmSi.TextColor3 = TEXTO
confirmSi.Font = Enum.Font.GothamBold
confirmSi.TextSize = 12
confirmSi.ZIndex = 51
confirmSi.Parent = confirmFrame
Instance.new("UICorner", confirmSi).CornerRadius = UDim.new(0, 8)

local confirmNo = Instance.new("TextButton")
confirmNo.Size = UDim2.new(0.45, 0, 0, 34)
confirmNo.Position = UDim2.new(0.52, 0, 0, 68)
confirmNo.BackgroundColor3 = VERDE
confirmNo.Text = "CANCELAR"
confirmNo.TextColor3 = TEXTO
confirmNo.Font = Enum.Font.GothamBold
confirmNo.TextSize = 12
confirmNo.ZIndex = 51
confirmNo.Parent = confirmFrame
Instance.new("UICorner", confirmNo).CornerRadius = UDim.new(0, 8)

local function cancelarCountdown()
    if confirmCountdownTask then
        local t = confirmCountdownTask
        confirmCountdownTask = nil
        pcall(task.cancel, t)
    end
end

local function cerrarConfirm()
    if not confirmando then return end
    confirmando = false
    confirmSession += 1
    cancelarCountdown()
    confirmTimer = nil
    local t = TweenService:Create(confirmEscala, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Scale = 0.8})
    t:Play()
    t.Completed:Wait()
    confirmFrame.Visible = false
    main.Visible = true
    closeBtn.Visible = true
end

closeBtn.MouseButton1Click:Connect(function()
    if confirmando then
        cerrarConfirm()
        return
    end
    confirmando = true
    confirmSession += 1
    local mySession = confirmSession
    main.Visible = false
    closeBtn.Visible = false
    confirmFrame.Visible = true
    confirmEscala.Scale = 0.8
    TweenService:Create(confirmEscala, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()

    local restante = 5
    confirmTiempo.Text = restante .. "s"
    confirmCountdownTask = task.spawn(function()
        while restante > 0 and confirmando and mySession == confirmSession do
            task.wait(1)
            restante -= 1
            if confirmando and mySession == confirmSession then
                confirmTiempo.Text = restante .. "s"
            end
        end
    end)

    confirmTimer = task.delay(5, function()
        if confirmando and mySession == confirmSession then
            cerrarConfirm()
        end
    end)
end)

confirmSi.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

confirmNo.MouseButton1Click:Connect(function()
    cerrarConfirm()
end)

gui.Destroying:Connect(function()
    running = false
    shineToken += 1
    startToken += 1
    if clickConn then
        clickConn:Disconnect()
        clickConn = nil
    end
    if confirmTimer then
        pcall(task.cancel, confirmTimer)
        confirmTimer = nil
    end
    cancelarCountdown()
    stopFly()
    for _, c in ipairs(conexiones) do
        c:Disconnect()
    end
    for _, t in ipairs(gradTweens) do
        t:Cancel()
    end
    glowCirculo:Cancel()
    pulsoEstado:Cancel()
end)

conectar(workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"), function()
    if not animando then
        escalaBase = calcularEscala()
        mainEscala.Scale = escalaBase
    end
end)

tw(mainEscala, TWEEN_ENTRADA, {Scale = escalaBase})

print("[Speed Click for Owner v2] Listo · " .. (esMovil and "Mobile" or "PC"))
