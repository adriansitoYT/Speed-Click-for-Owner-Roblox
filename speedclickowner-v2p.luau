-- FIRST HUB, DISCORD: https://discord.gg/4gwAeR9uUz

print("[Speed Click for Owner v2.2] Cargando...")
task.wait(0.5)

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local player = Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui", 10)

local viejoGui = pg:FindFirstChild("SpeedClickOwnerv2.2")
if viejoGui then viejoGui:Destroy() end

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
local MORADO      = Color3.fromRGB(160, 80, 200)
local CELESTE     = Color3.fromRGB(60, 140, 200)
local DISCORD_AZUL = Color3.fromRGB(88, 101, 242)
local DISCORD_CLARO = Color3.fromRGB(150, 160, 255)

local TWEEN_HOVER   = TweenInfo.new(0.12, Enum.EasingStyle.Quad)
local TWEEN_COLOR   = TweenInfo.new(0.2, Enum.EasingStyle.Quad)
local TWEEN_SLIDE   = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local TWEEN_ENTRADA = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local TWEEN_SALIDA  = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local TWEEN_TOGGLE  = TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local idiomaActual = "es"
if player.LocaleId:lower():sub(1, 2) == "en" then
    idiomaActual = "en"
end

local DISCORD_URL = "https://discord.gg/4gwAeR9uUz"

local JUEGOS = {
    {
        nombre = "+1 Flying Car Obby",
        siglas = "FC",
        link = "https://roscripts.io/s/1-flying-car-obby-first-hub-beta",
    },
}

local textos = {
    es = {
        titulo = "SPEED CLICK FOR OWNER",
        version = "v2.2 PREMIUM",
        autor = "by First Hub",
        pc = "PC",
        mobile = "Mobile",
        start = "▶  START",
        stop = "■  STOP",
        encendido = "●  Encendido",
        apagado = "●  Apagado",
        calibrando = "●  Calibrando...",
        sinRemotes = "●  Sin remotes",
        flyOff = "✈  FLY: OFF",
        flyOn = "✈  FLY: ON",
        irTorre = "⌂  IR A LA TORRE",
        tiempoClick = "TIEMPO POR CLICK (segundos)",
        controles = "WASD mover · Espacio subir · Ctrl bajar",
        antiAfk = "AntiAFK: ACTIVO",
        pagina = "PÁGINA %d / 2",
        cerrarTitulo = "¿Seguro que quieres cerrar?",
        si = "SÍ",
        cancelar = "CANCELAR",
        botonIdioma = "Idioma: Español",
        cargando = "Cargando...",
        tiempoEncendidoLabel = "TIEMPO ENCENDIDO",
        autoTPTitulo = "AUTO TP TORRE",
        autoTPEsperando = "●  Esperando",
        autoTPTp = "●  Teleportando...",
        autoTPReclamado = "●  ¡Reclamado!",
        autoTPNoReclamable = "●  No reclamable",
        autoTPNoTimer = "●  Sin timer",
        autoTPApagado = "●  TP OFF",
        autoTPSinVerificar = "●  Sin verificar",
        autoTPTimerLabel = "TIEMPO",
        discord = "💬  UNIRSE AL DISCORD",
        discordCopiado = "Discord copiado: discord.gg/4gwAeR9uUz",
        masJuegos = "¡Más Juegos!",
        nuevo = "NUEVO",
        volver = "Volver",
        juegosTitulo = "Más Juegos",
        play = "PLAY",
        sinKey = "NO KEY",
        modalTitulo = "Antes de jugar",
        modalMensaje = "Copia el link y pégalo en el navegador para ir a la página oficial de RoScript.",
        copiarLink = "Copiar Link",
        linkJuegoCopiado = "¡Link copiado! Pégalo en el navegador",
        copiaFalla = "No se pudo copiar, el link está en la consola",
    },
    en = {
        titulo = "SPEED CLICK FOR OWNER",
        version = "v2.2 PREMIUM",
        autor = "by First Hub",
        pc = "PC",
        mobile = "Mobile",
        start = "▶  START",
        stop = "■  STOP",
        encendido = "●  On",
        apagado = "●  Off",
        calibrando = "●  Calibrating...",
        sinRemotes = "●  No remotes",
        flyOff = "✈  FLY: OFF",
        flyOn = "✈  FLY: ON",
        irTorre = "⌂  GO TO TOWER",
        tiempoClick = "TIME PER CLICK (seconds)",
        controles = "WASD move · Space up · Ctrl down",
        antiAfk = "AntiAFK: ACTIVE",
        pagina = "PAGE %d / 2",
        cerrarTitulo = "Are you sure you want to close?",
        si = "YES",
        cancelar = "CANCEL",
        botonIdioma = "Language: English",
        cargando = "Loading...",
        tiempoEncendidoLabel = "TIME ON",
        autoTPTitulo = "AUTO TP TOWER",
        autoTPEsperando = "●  Waiting",
        autoTPTp = "●  Teleporting...",
        autoTPReclamado = "●  Claimed!",
        autoTPNoReclamable = "●  Not claimable",
        autoTPNoTimer = "●  No timer",
        autoTPApagado = "●  TP OFF",
        autoTPSinVerificar = "●  Unverified",
        autoTPTimerLabel = "TIME",
        discord = "💬  JOIN THE DISCORD",
        discordCopiado = "Discord copied: discord.gg/4gwAeR9uUz",
        masJuegos = "More Games!",
        nuevo = "NEW",
        volver = "Back",
        juegosTitulo = "More Games",
        play = "PLAY",
        sinKey = "NO KEY",
        modalTitulo = "Before you play",
        modalMensaje = "Copy the link and paste it in the browser to go to the official RoScript page.",
        copiarLink = "Copy Link",
        linkJuegoCopiado = "Link copied! Paste it in the browser",
        copiaFalla = "Could not copy, the link is in the console",
    },
}

local function t(clave)
    return textos[idiomaActual][clave] or clave
end

local ESTADO_CLAVE = {
    ["APAGADO"]       = "autoTPApagado",
    ["SIN VERIFICAR"] = "autoTPSinVerificar",
    ["RECLAMADO"]     = "autoTPReclamado",
    ["NO RECLAMABLE"] = "autoTPNoReclamable",
    ["ESPERANDO"]     = "autoTPEsperando",
    ["TELEPORTANDO"]  = "autoTPTp",
    ["SIN TIMER"]     = "autoTPNoTimer",
}

local running, flyActive = false, false
local clickRemotes = {}
local flyBV, flyBG, flyConn
local TORRE = Vector3.new(230.59, 279.10, -215.41)
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
local posGlobalMain = UDim2.new(0.5, -150, 0.5, -239)

local controlModule = nil
task.spawn(function()
    pcall(function()
        local ps = player:WaitForChild("PlayerScripts", 10)
        if not ps then return end
        local pm = require(ps:WaitForChild("PlayerModule", 10))
        if pm then controlModule = pm:GetControls() end
    end)
end)

local function calcularEscala()
    local viewport = workspace.CurrentCamera.ViewportSize
    local escala = math.clamp(math.min(viewport.X / 1280, viewport.Y / 720), 0.6, 1.2)
    if esMovil then escala = math.min(escala, 0.8) end
    return escala
end

local function tw(obj, info, props)
    local tween = TweenService:Create(obj, info, props)
    tween:Play()
    return tween
end

local function conectar(signal, fn)
    local c = signal:Connect(fn)
    table.insert(conexiones, c)
    return c
end

local function girar(grad, duracion, desde)
    grad.Rotation = desde
    local tween = TweenService:Create(grad, TweenInfo.new(duracion, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {Rotation = desde + 360})
    tween:Play()
    table.insert(gradTweens, tween)
end

local function pausarGradientes(pausa)
    for _, tween in ipairs(gradTweens) do
        if pausa then tween:Pause() else tween:Play() end
    end
end

local function aplicarStroke(obj, color, thickness, transparency)
    local s = Instance.new("UIStroke", obj)
    s.Color = color
    s.Thickness = thickness
    s.Transparency = transparency or 0
    return s
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

local function intentarAbrirBrowser(url)
    if type(openbrowser) == "function" then
        pcall(openbrowser, url)
        return true
    end
    if type(OpenBrowserWindow) == "function" then
        pcall(OpenBrowserWindow, url)
        return true
    end
    return false
end

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
    yaDetectado = true
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

    local speed = 80

    flyConn = RunService.RenderStepped:Connect(function()
        if not flyActive or not hrp or not hrp.Parent then
            stopFly()
            return
        end
        local camera = workspace.CurrentCamera
        if not camera then return end
        local dir = Vector3.zero
        if controlModule then
            local ok, mv = pcall(function() return controlModule:GetMoveVector() end)
            if ok and typeof(mv) == "Vector3" then
                dir = camera.CFrame.RightVector * mv.X + camera.CFrame.LookVector * (-mv.Z)
            end
        else
            if UIS:IsKeyDown(Enum.KeyCode.W) then dir = dir + camera.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then dir = dir - camera.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then dir = dir - camera.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then dir = dir + camera.CFrame.RightVector end
        end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.yAxis end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.yAxis end
        if dir.Magnitude > 0 then dir = dir.Unit end
        flyBV.Velocity = dir * speed
        flyBG.CFrame = camera.CFrame
    end)
end

local function reconstruirMenu()
    conexiones = {}
    gradTweens = {}
    shineToken = 0
    clickConn = nil
    startToken = 0
    flyBV, flyBG, flyConn = nil, nil, nil
    flyActive = false
    running = false
    clicksAcumulados = 0
    tiempoInicioEncendido = nil
    yaDetectado = false

    local refs = {}
    local opcionesIdioma = {}
    local aplicarIdioma
    local cambiarIdioma

    local escalaBase = calcularEscala()

    local gui = Instance.new("ScreenGui")
    gui.Name = "SpeedClickOwnerv2.2"
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 999
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = pg

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 300, 0, 478)
    main.Position = posGlobalMain
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

    local borde = aplicarStroke(main, ORO, 1.5, 0.35)
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
    iconoTexto.Font = Enum.Font.GothamBold
    iconoTexto.TextSize = 15
    iconoTexto.ZIndex = 5
    iconoTexto.Parent = icono

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -110, 0, 20)
    title.Position = UDim2.new(0, 52, 0, 8)
    title.BackgroundTransparency = 1
    title.Text = t("titulo")
    title.TextColor3 = ORO
    title.Font = Enum.Font.GothamMedium
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
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

    local function crearSub(texto, color, orden, clave)
        local l = Instance.new("TextLabel")
        l.AutomaticSize = Enum.AutomaticSize.X
        l.Size = UDim2.new(0, 0, 1, 0)
        l.BackgroundTransparency = 1
        l.Text = texto
        l.TextColor3 = color
        l.Font = Enum.Font.GothamMedium
        l.TextSize = 11
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.TextWrapped = false
        l.LayoutOrder = orden
        l.ZIndex = 4
        l.Parent = subFrame
        if clave then refs[clave] = l end
        return l
    end

    local subv2.2 = crearSub(esMovil and "v2.2" or t("version"), ORO, 1, "version")
    local subv2.2Grad = Instance.new("UIGradient")
    subv2.2Grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, ORO_CLARO),
        ColorSequenceKeypoint.new(0.5, ORO),
        ColorSequenceKeypoint.new(1, ORO_OSCURO)
    })
    subv2.2Grad.Parent = subv2.2

    crearSub("·", TEXTO_GRIS, 2)
    crearSub(t("autor"), AZUL_CIELO, 3, "autor")
    crearSub("·", TEXTO_GRIS, 4)
    crearSub(esMovil and t("mobile") or t("pc"), VERDE_CLARO, 5, "plataforma")

    girar(titleGrad, 3, 0)
    girar(subv2.2Grad, 3, 0)
    girar(bordeGrad, 6, 45)

    local minBtn = Instance.new("TextButton")
    minBtn.Size = UDim2.new(0, 28, 0, 28)
    minBtn.Position = UDim2.new(1, -64, 0, 18)
    minBtn.BackgroundColor3 = NEGRO_2
    minBtn.Text = "−"
    minBtn.TextColor3 = ORO
    minBtn.Font = Enum.Font.GothamMedium
    minBtn.TextSize = 20
    minBtn.ZIndex = 4
    minBtn.Parent = titleBar
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 8)
    aplicarStroke(minBtn, ORO, 1, 0.5)

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 28, 0, 28)
    closeBtn.Position = UDim2.new(1, -32, 0, 18)
    closeBtn.BackgroundColor3 = ROJO
    closeBtn.Text = "X"
    closeBtn.TextColor3 = TEXTO
    closeBtn.Font = Enum.Font.GothamMedium
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

    local circleBordeExt = aplicarStroke(circle, ORO_CLARO, 3, 0.2)
    aplicarStroke(circle, NEGRO, 1, 0.6)

    local circleTexto = Instance.new("TextLabel")
    circleTexto.Size = UDim2.new(1, 0, 1, 0)
    circleTexto.BackgroundTransparency = 1
    circleTexto.Text = "SC"
    circleTexto.TextColor3 = NEGRO
    circleTexto.Font = Enum.Font.GothamBold
    circleTexto.TextSize = 20
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
    aplicarStroke(navBar, ORO, 1.5, 0.4)

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
    pageIndicator.Text = string.format(t("pagina"), 1)
    pageIndicator.TextColor3 = ORO
    pageIndicator.Font = Enum.Font.GothamMedium
    pageIndicator.TextSize = 11
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
    aplicarStroke(statsPanel, ORO, 1, 0.6)

    local function crearStat(parent, xPos, ancho, tituloTexto, claveTitulo)
        local cont = Instance.new("Frame")
        cont.Size = UDim2.new(ancho, -8, 1, -18)
        cont.Position = UDim2.new(xPos, 4, 0, 6)
        cont.BackgroundTransparency = 1
        cont.ZIndex = 4
        cont.Parent = parent

        local tituloLabel = Instance.new("TextLabel")
        tituloLabel.Size = UDim2.new(1, 0, 0, 14)
        tituloLabel.BackgroundTransparency = 1
        tituloLabel.Text = tituloTexto
        tituloLabel.TextColor3 = TEXTO_GRIS
        tituloLabel.Font = Enum.Font.GothamMedium
        tituloLabel.TextSize = 10
        tituloLabel.ZIndex = 5
        tituloLabel.Parent = cont
        if claveTitulo then refs[claveTitulo] = tituloLabel end

        local valorLabel = Instance.new("TextLabel")
        valorLabel.Size = UDim2.new(1, 0, 0, 22)
        valorLabel.Position = UDim2.new(0, 0, 0, 14)
        valorLabel.BackgroundTransparency = 1
        valorLabel.Text = "—"
        valorLabel.TextColor3 = ORO
        valorLabel.Font = Enum.Font.GothamMedium
        valorLabel.TextSize = 17
        valorLabel.ZIndex = 5
        valorLabel.Parent = cont

        return valorLabel
    end

    local statCPS = crearStat(statsPanel, 0, 0.5, "CPS")
    local statTiempo = crearStat(statsPanel, 0.5, 0.5, t("tiempoEncendidoLabel"), "tiempoEncendidoLabel")

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
    funcionando.Text = t("apagado")
    funcionando.TextColor3 = TEXTO_GRIS
    funcionando.Font = Enum.Font.GothamMedium
    funcionando.TextSize = 12
    funcionando.ZIndex = 3
    funcionando.Parent = page1
    Instance.new("UICorner", funcionando).CornerRadius = UDim.new(0, 8)

    local estadoBorde = aplicarStroke(funcionando, TEXTO_GRIS, 1, 0.6)

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
    speedBtn.Font = Enum.Font.GothamMedium
    speedBtn.TextSize = 15
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

    local btnBorde = aplicarStroke(speedBtn, ORO_CLARO, 1.5, 0.4)

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
    speedText.Text = t("start")
    speedText.TextColor3 = NEGRO
    speedText.Font = Enum.Font.GothamMedium
    speedText.TextSize = 15
    speedText.ZIndex = 5
    speedText.Parent = speedBtn

    local etiquetaTiempo = Instance.new("TextLabel")
    etiquetaTiempo.Size = UDim2.new(1, -28, 0, 14)
    etiquetaTiempo.Position = UDim2.new(0, 14, 0, 150)
    etiquetaTiempo.BackgroundTransparency = 1
    etiquetaTiempo.Text = t("tiempoClick")
    etiquetaTiempo.TextColor3 = TEXTO_GRIS
    etiquetaTiempo.Font = Enum.Font.GothamMedium
    etiquetaTiempo.TextSize = 10
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
    waitBox.Font = Enum.Font.GothamMedium
    waitBox.TextSize = 15
    waitBox.ZIndex = 3
    waitBox.Parent = page1
    Instance.new("UICorner", waitBox).CornerRadius = UDim.new(0, 10)

    local boxBorde = aplicarStroke(waitBox, ORO, 1, 0.5)
    boxBorde.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local flyBtn = Instance.new("TextButton")
    flyBtn.Size = UDim2.new(1, -28, 0, 40)
    flyBtn.Position = UDim2.new(0, 14, 0, 208)
    flyBtn.BackgroundColor3 = NEGRO_3
    flyBtn.Text = t("flyOff")
    flyBtn.TextColor3 = ORO
    flyBtn.Font = Enum.Font.GothamMedium
    flyBtn.TextSize = 14
    flyBtn.ZIndex = 3
    flyBtn.Parent = page1
    Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0, 12)
    aplicarStroke(flyBtn, ORO, 1.5, 0.4)

    local controles = Instance.new("TextLabel")
    controles.Size = UDim2.new(1, -28, 0, 18)
    controles.Position = UDim2.new(0, 14, 0, 252)
    controles.BackgroundTransparency = 1
    controles.Text = esMovil and "" or t("controles")
    controles.TextColor3 = TEXTO_GRIS
    controles.Font = Enum.Font.Gotham
    controles.TextSize = 10
    controles.TextXAlignment = Enum.TextXAlignment.Left
    controles.TextWrapped = true
    controles.ZIndex = 3
    controles.Parent = page1

    local tpBtn = Instance.new("TextButton")
    tpBtn.Size = UDim2.new(1, -28, 0, 46)
    tpBtn.Position = UDim2.new(0, 14, 0, 278)
    tpBtn.BackgroundColor3 = NEGRO_3
    tpBtn.Text = t("irTorre")
    tpBtn.TextColor3 = ORO
    tpBtn.Font = Enum.Font.GothamMedium
    tpBtn.TextSize = 14
    tpBtn.ZIndex = 3
    tpBtn.Parent = page1
    Instance.new("UICorner", tpBtn).CornerRadius = UDim.new(0, 12)
    aplicarStroke(tpBtn, ORO, 1.5, 0.4)

    local antiafkLabel = Instance.new("TextLabel")
    antiafkLabel.Size = UDim2.new(1, -28, 0, 16)
    antiafkLabel.Position = UDim2.new(0, 14, 0, 330)
    antiafkLabel.BackgroundTransparency = 1
    antiafkLabel.Text = t("antiAfk")
    antiafkLabel.TextColor3 = VERDE_CLARO
    antiafkLabel.Font = Enum.Font.GothamMedium
    antiafkLabel.TextSize = 11
    antiafkLabel.TextXAlignment = Enum.TextXAlignment.Center
    antiafkLabel.ZIndex = 3
    antiafkLabel.Parent = page1

    local page2Titulo = Instance.new("TextLabel")
    page2Titulo.Size = UDim2.new(1, -28, 0, 24)
    page2Titulo.Position = UDim2.new(0, 14, 0, 8)
    page2Titulo.BackgroundTransparency = 1
    page2Titulo.Text = t("autoTPTitulo")
    page2Titulo.TextColor3 = ORO
    page2Titulo.Font = Enum.Font.GothamMedium
    page2Titulo.TextSize = 14
    page2Titulo.TextXAlignment = Enum.TextXAlignment.Left
    page2Titulo.ZIndex = 3
    page2Titulo.Parent = page2
    refs.autoTPTitulo = page2Titulo

    local autoTPPanel = Instance.new("Frame")
    autoTPPanel.Size = UDim2.new(1, -28, 0, 56)
    autoTPPanel.Position = UDim2.new(0, 14, 0, 40)
    autoTPPanel.BackgroundColor3 = NEGRO_2
    autoTPPanel.BorderSizePixel = 0
    autoTPPanel.ZIndex = 3
    autoTPPanel.Parent = page2
    Instance.new("UICorner", autoTPPanel).CornerRadius = UDim.new(0, 12)
    aplicarStroke(autoTPPanel, ORO, 1.5, 0.5)

    local autoTPTimerTag = Instance.new("TextLabel")
    autoTPTimerTag.Size = UDim2.new(0, 70, 0, 12)
    autoTPTimerTag.Position = UDim2.new(0, 10, 0, 6)
    autoTPTimerTag.BackgroundTransparency = 1
    autoTPTimerTag.Text = t("autoTPTimerLabel")
    autoTPTimerTag.TextColor3 = TEXTO_GRIS
    autoTPTimerTag.Font = Enum.Font.GothamMedium
    autoTPTimerTag.TextSize = 9
    autoTPTimerTag.TextXAlignment = Enum.TextXAlignment.Left
    autoTPTimerTag.ZIndex = 4
    autoTPTimerTag.Parent = autoTPPanel
    refs.autoTPTimerTag = autoTPTimerTag

    local autoTPTimerValor = Instance.new("TextLabel")
    autoTPTimerValor.Size = UDim2.new(0, 70, 0, 26)
    autoTPTimerValor.Position = UDim2.new(0, 10, 0, 20)
    autoTPTimerValor.BackgroundTransparency = 1
    autoTPTimerValor.Text = "--:--"
    autoTPTimerValor.TextColor3 = ORO
    autoTPTimerValor.Font = Enum.Font.GothamMedium
    autoTPTimerValor.TextSize = 20
    autoTPTimerValor.TextXAlignment = Enum.TextXAlignment.Left
    autoTPTimerValor.ZIndex = 4
    autoTPTimerValor.Parent = autoTPPanel

    local autoTPEstadoLabel = Instance.new("TextLabel")
    autoTPEstadoLabel.Size = UDim2.new(1, -160, 0, 14)
    autoTPEstadoLabel.Position = UDim2.new(0, 88, 0, 22)
    autoTPEstadoLabel.BackgroundTransparency = 1
    autoTPEstadoLabel.Text = t("autoTPApagado")
    autoTPEstadoLabel.TextColor3 = TEXTO_GRIS
    autoTPEstadoLabel.Font = Enum.Font.GothamMedium
    autoTPEstadoLabel.TextSize = 11
    autoTPEstadoLabel.TextXAlignment = Enum.TextXAlignment.Left
    autoTPEstadoLabel.ZIndex = 4
    autoTPEstadoLabel.Parent = autoTPPanel

    local toggleTrack = Instance.new("Frame")
    toggleTrack.Size = UDim2.new(0, 48, 0, 26)
    toggleTrack.Position = UDim2.new(1, -58, 0.5, -13)
    toggleTrack.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    toggleTrack.BorderSizePixel = 0
    toggleTrack.ZIndex = 4
    toggleTrack.Parent = autoTPPanel
    Instance.new("UICorner", toggleTrack).CornerRadius = UDim.new(1, 0)

    local toggleStroke = aplicarStroke(toggleTrack, Color3.fromRGB(80, 80, 90), 1, 0.5)

    local toggleKnob = Instance.new("Frame")
    toggleKnob.Size = UDim2.new(0, 20, 0, 20)
    toggleKnob.Position = UDim2.new(0, 3, 0.5, -10)
    toggleKnob.BackgroundColor3 = Color3.fromRGB(200, 200, 210)
    toggleKnob.BorderSizePixel = 0
    toggleKnob.ZIndex = 5
    toggleKnob.Parent = toggleTrack
    Instance.new("UICorner", toggleKnob).CornerRadius = UDim.new(1, 0)

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(1, 0, 1, 0)
    toggleBtn.BackgroundTransparency = 1
    toggleBtn.Text = ""
    toggleBtn.ZIndex = 6
    toggleBtn.Parent = toggleTrack

    local discordBtn = Instance.new("TextButton")
    discordBtn.Size = UDim2.new(1, -28, 0, 44)
    discordBtn.Position = UDim2.new(0, 14, 0, 108)
    discordBtn.BackgroundColor3 = DISCORD_AZUL
    discordBtn.Text = ""
    discordBtn.TextColor3 = TEXTO
    discordBtn.Font = Enum.Font.GothamMedium
    discordBtn.TextSize = 13
    discordBtn.ZIndex = 3
    discordBtn.AutoButtonColor = false
    discordBtn.Parent = page2
    Instance.new("UICorner", discordBtn).CornerRadius = UDim.new(0, 12)

    local discordGrad = Instance.new("UIGradient")
    discordGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(114, 137, 218)),
        ColorSequenceKeypoint.new(1, DISCORD_AZUL)
    })
    discordGrad.Rotation = 90
    discordGrad.Parent = discordBtn

    local discordBorde = aplicarStroke(discordBtn, DISCORD_CLARO, 2, 0.5)
    refs.discordBtn = discordBtn

    local discordIcon = Instance.new("Frame")
    discordIcon.Size = UDim2.new(0, 22, 0, 22)
    discordIcon.Position = UDim2.new(0, 8, 0.5, -11)
    discordIcon.BackgroundColor3 = Color3.new(1, 1, 1)
    discordIcon.BackgroundTransparency = 0.15
    discordIcon.BorderSizePixel = 0
    discordIcon.ZIndex = 4
    discordIcon.Parent = discordBtn
    Instance.new("UICorner", discordIcon).CornerRadius = UDim.new(0, 6)

    local discordIconText = Instance.new("TextLabel")
    discordIconText.Size = UDim2.new(1, 0, 1, 0)
    discordIconText.BackgroundTransparency = 1
    discordIconText.Text = "D"
    discordIconText.TextColor3 = DISCORD_AZUL
    discordIconText.Font = Enum.Font.GothamBold
    discordIconText.TextSize = 14
    discordIconText.ZIndex = 5
    discordIconText.Parent = discordIcon

    local discordLabel = Instance.new("TextLabel")
    discordLabel.Size = UDim2.new(1, -40, 1, 0)
    discordLabel.Position = UDim2.new(0, 36, 0, 0)
    discordLabel.BackgroundTransparency = 1
    discordLabel.Text = t("discord")
    discordLabel.TextColor3 = TEXTO
    discordLabel.Font = Enum.Font.GothamBold
    discordLabel.TextSize = 13
    discordLabel.TextXAlignment = Enum.TextXAlignment.Left
    discordLabel.ZIndex = 4
    discordLabel.Parent = discordBtn

    local discordCopiado = Instance.new("TextLabel")
    discordCopiado.Size = UDim2.new(1, -40, 1, 0)
    discordCopiado.Position = UDim2.new(0, 36, 0, 0)
    discordCopiado.BackgroundTransparency = 1
    discordCopiado.Text = t("discordCopiado")
    discordCopiado.TextColor3 = VERDE_CLARO
    discordCopiado.Font = Enum.Font.GothamBold
    discordCopiado.TextSize = 12
    discordCopiado.TextXAlignment = Enum.TextXAlignment.Left
    discordCopiado.TextTransparency = 1
    discordCopiado.ZIndex = 4
    discordCopiado.Parent = discordBtn

    local discordCopiandoToken = 0

    discordBtn.MouseButton1Click:Connect(function()
        discordCopiandoToken += 1
        local miToken = discordCopiandoToken

        local copiado = false
        if type(setclipboard) == "function" then
            pcall(function() setclipboard(DISCORD_URL) copiado = true end)
        else
            pcall(function() toclipboard(DISCORD_URL) copiado = true end)
        end

        intentarAbrirBrowser(DISCORD_URL)

        if copiado then
            TweenService:Create(discordLabel, TWEEN_COLOR, {TextTransparency = 1}):Play()
            TweenService:Create(discordCopiado, TWEEN_COLOR, {TextTransparency = 0}):Play()
            TweenService:Create(discordBtn, TWEEN_COLOR, {BackgroundColor3 = VERDE}):Play()

            task.delay(2, function()
                if miToken ~= discordCopiandoToken then return end
                TweenService:Create(discordLabel, TWEEN_COLOR, {TextTransparency = 0}):Play()
                TweenService:Create(discordCopiado, TWEEN_COLOR, {TextTransparency = 1}):Play()
                TweenService:Create(discordBtn, TWEEN_COLOR, {BackgroundColor3 = DISCORD_AZUL}):Play()
            end)
        else
            discordLabel.Text = DISCORD_URL
            discordLabel.TextSize = 9
            TweenService:Create(discordBtn, TWEEN_COLOR, {BackgroundColor3 = ROJO}):Play()
            task.delay(4, function()
                if miToken ~= discordCopiandoToken then return end
                discordLabel.Text = t("discord")
                discordLabel.TextSize = 13
                TweenService:Create(discordBtn, TWEEN_COLOR, {BackgroundColor3 = DISCORD_AZUL}):Play()
            end)
        end
    end)

    local masEnvoltorio = Instance.new("Frame")
    masEnvoltorio.Size = UDim2.new(1, -28, 0, 52)
    masEnvoltorio.Position = UDim2.new(0, 14, 0, 160)
    masEnvoltorio.BackgroundTransparency = 1
    masEnvoltorio.ZIndex = 3
    masEnvoltorio.Parent = page2

    local masBtn = Instance.new("TextButton")
    masBtn.Size = UDim2.new(1, -6, 0, 44)
    masBtn.Position = UDim2.new(0.5, 0, 0.5, 0)
    masBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    masBtn.BackgroundColor3 = Color3.new(1, 1, 1)
    masBtn.Text = ""
    masBtn.AutoButtonColor = false
    masBtn.BorderSizePixel = 0
    masBtn.ClipsDescendants = true
    masBtn.ZIndex = 4
    masBtn.Parent = masEnvoltorio
    Instance.new("UICorner", masBtn).CornerRadius = UDim.new(0, 12)

    local masGrad = Instance.new("UIGradient")
    masGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, ORO),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 140, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 90, 140))
    })
    masGrad.Parent = masBtn

    aplicarStroke(masBtn, ORO_CLARO, 2, 0.1)

    local masEscala = Instance.new("UIScale")
    masEscala.Scale = 1
    masEscala.Parent = masBtn

    local masBrillo = Instance.new("Frame")
    masBrillo.Size = UDim2.new(0.3, 0, 1.6, 0)
    masBrillo.Position = UDim2.new(-0.5, 0, -0.3, 0)
    masBrillo.BackgroundColor3 = Color3.new(1, 1, 1)
    masBrillo.BorderSizePixel = 0
    masBrillo.Rotation = 20
    masBrillo.ZIndex = 5
    masBrillo.Parent = masBtn

    local brilloGrad = Instance.new("UIGradient")
    brilloGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0.45),
        NumberSequenceKeypoint.new(1, 1)
    })
    brilloGrad.Parent = masBrillo

    local masTexto = Instance.new("TextLabel")
    masTexto.Size = UDim2.new(1, 0, 1, 0)
    masTexto.BackgroundTransparency = 1
    masTexto.Text = t("masJuegos")
    masTexto.TextColor3 = NEGRO
    masTexto.Font = Enum.Font.GothamMedium
    masTexto.TextSize = 15
    masTexto.ZIndex = 6
    masTexto.Parent = masBtn

    local nuevoTag = Instance.new("Frame")
    nuevoTag.Size = UDim2.new(0, 44, 0, 15)
    nuevoTag.Position = UDim2.new(1, -50, 0, 4)
    nuevoTag.BackgroundColor3 = ROJO
    nuevoTag.BorderSizePixel = 0
    nuevoTag.ZIndex = 6
    nuevoTag.Parent = masBtn
    Instance.new("UICorner", nuevoTag).CornerRadius = UDim.new(0, 8)

    local nuevoTexto = Instance.new("TextLabel")
    nuevoTexto.Size = UDim2.new(1, 0, 1, 0)
    nuevoTexto.BackgroundTransparency = 1
    nuevoTexto.Text = t("nuevo")
    nuevoTexto.TextColor3 = TEXTO
    nuevoTexto.Font = Enum.Font.GothamMedium
    nuevoTexto.TextSize = 9
    nuevoTexto.ZIndex = 7
    nuevoTexto.Parent = nuevoTag

    task.spawn(function()
        while gui.Parent do
            masGrad.Rotation = 0
            local tw2 = TweenService:Create(masGrad, TweenInfo.new(4, Enum.EasingStyle.Linear), {Rotation = 360})
            tw2:Play()
            tw2.Completed:Wait()
        end
    end)

    TweenService:Create(masEscala, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Scale = 1.04}):Play()
    TweenService:Create(nuevoTag, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {BackgroundTransparency = 0.35}):Play()

    task.spawn(function()
        while gui.Parent do
            if masBtn.Parent and masBtn.Parent.Parent and masBtn.Parent.Parent.Visible then
                masBrillo.Position = UDim2.new(-0.5, 0, -0.3, 0)
                TweenService:Create(masBrillo, TweenInfo.new(0.9, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Position = UDim2.new(1.2, 0, -0.3, 0),
                }):Play()
                task.wait(2.4)
            else
                task.wait(0.5)
            end
        end
    end)

    local idiomaBtn = Instance.new("TextButton")
    idiomaBtn.Size = UDim2.new(1, -28, 0, 44)
    idiomaBtn.Position = UDim2.new(0, 14, 0, 296)
    idiomaBtn.BackgroundColor3 = NEGRO_3
    idiomaBtn.Text = t("botonIdioma")
    idiomaBtn.TextColor3 = VERDE_CLARO
    idiomaBtn.Font = Enum.Font.GothamMedium
    idiomaBtn.TextSize = 13
    idiomaBtn.ZIndex = 3
    idiomaBtn.Parent = page2
    Instance.new("UICorner", idiomaBtn).CornerRadius = UDim.new(0, 12)
    aplicarStroke(idiomaBtn, VERDE_CLARO, 1.5, 0.4)

    local idiomaDropdown = Instance.new("Frame")
    idiomaDropdown.Size = UDim2.new(1, -28, 0, 78)
    idiomaDropdown.Position = UDim2.new(0, 14, 0, 210)
    idiomaDropdown.BackgroundColor3 = NEGRO_2
    idiomaDropdown.BackgroundTransparency = 0.05
    idiomaDropdown.BorderSizePixel = 0
    idiomaDropdown.Visible = false
    idiomaDropdown.ZIndex = 20
    idiomaDropdown.Parent = page2
    Instance.new("UICorner", idiomaDropdown).CornerRadius = UDim.new(0, 10)
    aplicarStroke(idiomaDropdown, ORO, 1, 0.3)

    local idiomaOpciones = Instance.new("Frame")
    idiomaOpciones.Size = UDim2.new(1, -8, 1, -8)
    idiomaOpciones.Position = UDim2.new(0, 4, 0, 4)
    idiomaOpciones.BackgroundTransparency = 1
    idiomaOpciones.ZIndex = 21
    idiomaOpciones.Parent = idiomaDropdown

    local idiomaLayout = Instance.new("UIListLayout")
    idiomaLayout.SortOrder = Enum.SortOrder.LayoutOrder
    idiomaLayout.Padding = UDim.new(0, 4)
    idiomaLayout.Parent = idiomaOpciones

    local panelAbierto = false
    local panelOcupado = false

    local panelJuegos = Instance.new("Frame")
    panelJuegos.Name = "PanelJuegos"
    panelJuegos.Size = UDim2.new(1, 0, 1, -64)
    panelJuegos.Position = UDim2.new(1, 0, 0, 64)
    panelJuegos.BackgroundColor3 = NEGRO_2
    panelJuegos.BorderSizePixel = 0
    panelJuegos.Visible = false
    panelJuegos.ZIndex = 40
    panelJuegos.Parent = main

    local volverBtn = Instance.new("TextButton")
    volverBtn.Size = UDim2.new(0, 84, 0, 32)
    volverBtn.Position = UDim2.new(0, 14, 0, 12)
    volverBtn.BackgroundColor3 = NEGRO_3
    volverBtn.Text = t("volver")
    volverBtn.TextColor3 = ORO
    volverBtn.Font = Enum.Font.GothamMedium
    volverBtn.TextSize = 12
    volverBtn.AutoButtonColor = false
    volverBtn.BorderSizePixel = 0
    volverBtn.ZIndex = 41
    volverBtn.Parent = panelJuegos
    Instance.new("UICorner", volverBtn).CornerRadius = UDim.new(0, 10)
    aplicarStroke(volverBtn, ORO, 1.5, 0.4)

    local juegosTitulo = Instance.new("TextLabel")
    juegosTitulo.Size = UDim2.new(1, -122, 0, 32)
    juegosTitulo.Position = UDim2.new(0, 108, 0, 12)
    juegosTitulo.BackgroundTransparency = 1
    juegosTitulo.Text = t("juegosTitulo")
    juegosTitulo.TextColor3 = ORO
    juegosTitulo.Font = Enum.Font.GothamMedium
    juegosTitulo.TextSize = 16
    juegosTitulo.TextXAlignment = Enum.TextXAlignment.Left
    juegosTitulo.ZIndex = 41
    juegosTitulo.Parent = panelJuegos

    local listaJuegos = Instance.new("ScrollingFrame")
    listaJuegos.Position = UDim2.new(0, 0, 0, 54)
    listaJuegos.Size = UDim2.new(1, 0, 1, -54)
    listaJuegos.BackgroundTransparency = 1
    listaJuegos.BorderSizePixel = 0
    listaJuegos.CanvasSize = UDim2.new(0, 0, 0, 0)
    listaJuegos.AutomaticCanvasSize = Enum.AutomaticSize.Y
    listaJuegos.ScrollBarThickness = 3
    listaJuegos.ScrollBarImageColor3 = ORO
    listaJuegos.ScrollingDirection = Enum.ScrollingDirection.Y
    listaJuegos.ZIndex = 41
    listaJuegos.Parent = panelJuegos

    local listaLayout = Instance.new("UIListLayout")
    listaLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listaLayout.Padding = UDim.new(0, 10)
    listaLayout.Parent = listaJuegos

    local listaPadding = Instance.new("UIPadding")
    listaPadding.PaddingTop = UDim.new(0, 4)
    listaPadding.PaddingBottom = UDim.new(0, 14)
    listaPadding.PaddingLeft = UDim.new(0, 14)
    listaPadding.PaddingRight = UDim.new(0, 14)
    listaPadding.Parent = listaJuegos

    local modalFondo = Instance.new("TextButton")
    modalFondo.Size = UDim2.new(1, 0, 1, 0)
    modalFondo.BackgroundColor3 = Color3.new(0, 0, 0)
    modalFondo.BackgroundTransparency = 1
    modalFondo.Text = ""
    modalFondo.AutoButtonColor = false
    modalFondo.Visible = false
    modalFondo.ZIndex = 50
    modalFondo.Parent = gui

    local modal = Instance.new("Frame")
    modal.AnchorPoint = Vector2.new(0.5, 0.5)
    modal.Position = UDim2.new(0.5, 0, 0.5, 0)
    modal.Size = UDim2.new(0, 300, 0, 240)
    modal.BackgroundColor3 = NEGRO_2
    modal.BorderSizePixel = 0
    modal.ZIndex = 51
    modal.Parent = modalFondo
    Instance.new("UICorner", modal).CornerRadius = UDim.new(0, 14)

    local modalBorde = aplicarStroke(modal, ORO, 1.5, 0.35)
    local modalBordeGrad = Instance.new("UIGradient")
    modalBordeGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, ORO_CLARO),
        ColorSequenceKeypoint.new(0.5, ORO),
        ColorSequenceKeypoint.new(1, ORO_OSCURO)
    })
    modalBordeGrad.Rotation = 45
    modalBordeGrad.Parent = modalBorde

    local modalEscala = Instance.new("UIScale")
    modalEscala.Scale = 0.01
    modalEscala.Parent = modal

    local modalTitulo = Instance.new("TextLabel")
    modalTitulo.Size = UDim2.new(1, -60, 0, 22)
    modalTitulo.Position = UDim2.new(0, 16, 0, 14)
    modalTitulo.BackgroundTransparency = 1
    modalTitulo.Text = t("modalTitulo")
    modalTitulo.TextColor3 = ORO
    modalTitulo.Font = Enum.Font.GothamMedium
    modalTitulo.TextSize = 17
    modalTitulo.TextXAlignment = Enum.TextXAlignment.Left
    modalTitulo.ZIndex = 52
    modalTitulo.Parent = modal

    local modalCerrar = Instance.new("TextButton")
    modalCerrar.Size = UDim2.new(0, 28, 0, 28)
    modalCerrar.Position = UDim2.new(1, -40, 0, 12)
    modalCerrar.BackgroundColor3 = NEGRO_3
    modalCerrar.Text = "X"
    modalCerrar.TextColor3 = ORO
    modalCerrar.Font = Enum.Font.GothamMedium
    modalCerrar.TextSize = 13
    modalCerrar.AutoButtonColor = false
    modalCerrar.BorderSizePixel = 0
    modalCerrar.ZIndex = 52
    modalCerrar.Parent = modal
    Instance.new("UICorner", modalCerrar).CornerRadius = UDim.new(0, 8)

    local modalMensaje = Instance.new("TextLabel")
    modalMensaje.Size = UDim2.new(1, -32, 0, 90)
    modalMensaje.Position = UDim2.new(0, 16, 0, 48)
    modalMensaje.BackgroundTransparency = 1
    modalMensaje.Text = t("modalMensaje")
    modalMensaje.TextColor3 = TEXTO
    modalMensaje.Font = Enum.Font.Gotham
    modalMensaje.TextSize = 13
    modalMensaje.TextWrapped = true
    modalMensaje.TextXAlignment = Enum.TextXAlignment.Left
    modalMensaje.TextYAlignment = Enum.TextYAlignment.Top
    modalMensaje.ZIndex = 52
    modalMensaje.Parent = modal

    local copiarModal = Instance.new("TextButton")
    copiarModal.Size = UDim2.new(1, -32, 0, 44)
    copiarModal.Position = UDim2.new(0, 16, 0, 148)
    copiarModal.BackgroundColor3 = ORO
    copiarModal.Text = t("copiarLink")
    copiarModal.TextColor3 = NEGRO
    copiarModal.Font = Enum.Font.GothamMedium
    copiarModal.TextSize = 14
    copiarModal.AutoButtonColor = false
    copiarModal.BorderSizePixel = 0
    copiarModal.ZIndex = 52
    copiarModal.Parent = modal
    Instance.new("UICorner", copiarModal).CornerRadius = UDim.new(0, 10)

    local modalFeedback = Instance.new("TextLabel")
    modalFeedback.Size = UDim2.new(1, -32, 0, 16)
    modalFeedback.Position = UDim2.new(0, 16, 0, 200)
    modalFeedback.BackgroundTransparency = 1
    modalFeedback.Text = ""
    modalFeedback.TextColor3 = VERDE_CLARO
    modalFeedback.Font = Enum.Font.GothamMedium
    modalFeedback.TextSize = 11
    modalFeedback.TextWrapped = true
    modalFeedback.ZIndex = 52
    modalFeedback.Parent = modal

    local modalToken = 0

    local function abrirModal()
        modalToken += 1
        modalFeedback.Text = ""
        modalFondo.BackgroundTransparency = 1
        modalFondo.Visible = true
        modalEscala.Scale = 0.01
        TweenService:Create(modalFondo, TWEEN_COLOR, {BackgroundTransparency = 0.45}):Play()
        TweenService:Create(modalEscala, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Scale = escalaBase
        }):Play()
    end

    local function cerrarModal()
        modalToken += 1
        local miToken = modalToken
        TweenService:Create(modalFondo, TWEEN_COLOR, {BackgroundTransparency = 1}):Play()
        TweenService:Create(modalEscala, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Scale = 0.01
        }):Play()
        task.delay(0.17, function()
            if modalToken == miToken then
                modalFondo.Visible = false
            end
        end)
    end

    conectar(modalCerrar.MouseButton1Click, cerrarModal)

    conectar(copiarModal.MouseButton1Click, function()
        local exito = pcall(function()
            if setclipboard then setclipboard(JUEGOS[1].link)
            elseif toclipboard then toclipboard(JUEGOS[1].link)
            else error("No clipboard API") end
        end)
        if exito then
            modalFeedback.Text = t("linkJuegoCopiado")
            modalFeedback.TextColor3 = VERDE_CLARO
        else
            modalFeedback.Text = t("copiaFalla")
            modalFeedback.TextColor3 = AMBAR
            print("[Speed Click] Link: " .. JUEGOS[1].link)
        end
    end)

    local function abrirPanel()
        if panelAbierto or panelOcupado then return end
        panelOcupado = true
        panelAbierto = true
        panelJuegos.Position = UDim2.new(1, 0, 0, 64)
        panelJuegos.Visible = true
        local tw2 = TweenService:Create(panelJuegos, TWEEN_SLIDE, {Position = UDim2.new(0, 0, 0, 64)})
        tw2:Play()
        tw2.Completed:Wait()
        panelOcupado = false
    end

    local function cerrarPanel()
        if not panelAbierto or panelOcupado then return end
        panelOcupado = true
        local tw2 = TweenService:Create(panelJuegos, TWEEN_SLIDE, {Position = UDim2.new(1, 0, 0, 64)})
        tw2:Play()
        tw2.Completed:Wait()
        panelJuegos.Visible = false
        panelAbierto = false
        panelOcupado = false
    end

    conectar(masBtn.MouseButton1Click, function() task.spawn(abrirPanel) end)
    conectar(volverBtn.MouseButton1Click, function() task.spawn(cerrarPanel) end)

    local function crearTarjetaJuego(juego, orden)
        local tarjeta = Instance.new("Frame")
        tarjeta.Size = UDim2.new(1, 0, 0, 96)
        tarjeta.BackgroundColor3 = NEGRO_3
        tarjeta.BorderSizePixel = 0
        tarjeta.LayoutOrder = orden
        tarjeta.ZIndex = 42
        tarjeta.Parent = listaJuegos
        Instance.new("UICorner", tarjeta).CornerRadius = UDim.new(0, 12)
        aplicarStroke(tarjeta, ORO, 1, 0.7)

        local marco = Instance.new("Frame")
        marco.Size = UDim2.new(0, 72, 0, 72)
        marco.Position = UDim2.new(0, 10, 0.5, -36)
        marco.BackgroundColor3 = ORO
        marco.BorderSizePixel = 0
        marco.ClipsDescendants = true
        marco.ZIndex = 43
        marco.Parent = tarjeta
        Instance.new("UICorner", marco).CornerRadius = UDim.new(0, 12)

        local marcoGrad = Instance.new("UIGradient")
        marcoGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, ORO_CLARO),
            ColorSequenceKeypoint.new(0.5, ORO),
            ColorSequenceKeypoint.new(1, ORO_OSCURO),
        })
        marcoGrad.Rotation = 45
        marcoGrad.Parent = marco

        aplicarStroke(marco, ORO_CLARO, 3, 0.2)
        aplicarStroke(marco, NEGRO, 1, 0.6)

        local textoSC = Instance.new("TextLabel")
        textoSC.Size = UDim2.new(1, 0, 1, 0)
        textoSC.BackgroundTransparency = 1
        textoSC.Text = juego.siglas
        textoSC.TextColor3 = NEGRO
        textoSC.Font = Enum.Font.GothamBold
        textoSC.TextSize = 24
        textoSC.ZIndex = 44
        textoSC.Parent = marco

        local scGrad = Instance.new("UIGradient")
        scGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 40, 10)),
            ColorSequenceKeypoint.new(1, NEGRO),
        })
        scGrad.Rotation = 90
        scGrad.Parent = textoSC

        local nombreLabel = Instance.new("TextLabel")
        nombreLabel.Size = UDim2.new(1, -176, 0, 34)
        nombreLabel.Position = UDim2.new(0, 92, 0, 14)
        nombreLabel.BackgroundTransparency = 1
        nombreLabel.Text = juego.nombre
        nombreLabel.TextColor3 = TEXTO
        nombreLabel.Font = Enum.Font.GothamMedium
        nombreLabel.TextSize = 13
        nombreLabel.TextWrapped = true
        nombreLabel.TextXAlignment = Enum.TextXAlignment.Left
        nombreLabel.TextYAlignment = Enum.TextYAlignment.Top
        nombreLabel.ZIndex = 43
        nombreLabel.Parent = tarjeta

        local insigniaKey = Instance.new("Frame")
        insigniaKey.Size = UDim2.new(0, 64, 0, 20)
        insigniaKey.Position = UDim2.new(0, 92, 0, 56)
        insigniaKey.BackgroundColor3 = VERDE
        insigniaKey.BorderSizePixel = 0
        insigniaKey.ZIndex = 43
        insigniaKey.Parent = tarjeta
        Instance.new("UICorner", insigniaKey).CornerRadius = UDim.new(0, 10)
        aplicarStroke(insigniaKey, VERDE_CLARO, 1, 0.3)

        local keyTexto = Instance.new("TextLabel")
        keyTexto.Size = UDim2.new(1, 0, 1, 0)
        keyTexto.BackgroundTransparency = 1
        keyTexto.Text = t("sinKey")
        keyTexto.TextColor3 = TEXTO
        keyTexto.Font = Enum.Font.GothamMedium
        keyTexto.TextSize = 10
        keyTexto.ZIndex = 44
        keyTexto.Parent = insigniaKey

        local playBtn = Instance.new("TextButton")
        playBtn.Size = UDim2.new(0, 66, 0, 36)
        playBtn.Position = UDim2.new(1, -78, 0.5, -18)
        playBtn.BackgroundColor3 = VERDE
        playBtn.Text = t("play")
        playBtn.TextColor3 = TEXTO
        playBtn.Font = Enum.Font.GothamMedium
        playBtn.TextSize = 13
        playBtn.AutoButtonColor = false
        playBtn.BorderSizePixel = 0
        playBtn.ZIndex = 44
        playBtn.Parent = tarjeta
        Instance.new("UICorner", playBtn).CornerRadius = UDim.new(0, 10)
        aplicarStroke(playBtn, VERDE_CLARO, 1.5, 0.35)

        conectar(playBtn.MouseEnter, function()
            TweenService:Create(playBtn, TWEEN_COLOR, {BackgroundColor3 = Color3.fromRGB(60, 190, 85)}):Play()
        end)
        conectar(playBtn.MouseLeave, function()
            TweenService:Create(playBtn, TWEEN_COLOR, {BackgroundColor3 = VERDE}):Play()
        end)
        conectar(playBtn.MouseButton1Click, abrirModal)
    end

    for i, juego in ipairs(JUEGOS) do
        crearTarjetaJuego(juego, i)
    end

    conectar(workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"), function()
        if modalFondo.Visible then
            modalEscala.Scale = calcularEscala()
        end
    end)

    local MARGEN_RESET = 8
    local COOLDOWN_INTENTO = 8
    local ESPERA_PRE_TP = 1.5
    local ESPERA_EN_TORRE = 4
    local DELAY_POST_TP = 0.5

    local autoActivo = false
    local autoToken = 0
    local timerLabel = nil
    local ultimoValorTimer = nil
    local ultimoValorLeidoGUI = nil
    local ultimaVezCambioTimer = 0
    local ultimoIntentoBuscar = 0
    local posicionGuardada = nil
    local yaVerificado = false
    local estadoReclamo = "APAGADO"
    local timerEnReclamo = -1
    local timestampReclamo = -1
    local intentoEnCurso = false
    local intentoToken = 0
    local delayHandle = nil
    local ultimoIntento = 0

    local function getChar()
        local char = player.Character
        if not char then return nil end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then return nil end
        return char, char:FindFirstChild("HumanoidRootPart"), hum
    end

    local function guardarPosicion()
        local _, hrp = getChar()
        if hrp then posicionGuardada = hrp.CFrame return true end
        return false
    end

    local function hacerTP(pos)
        local _, hrp = getChar()
        if not hrp then return false end
        hrp.Anchored = false
        hrp.CFrame = CFrame.new(pos)
        return true
    end

    local function volverAPosicion()
        local _, hrp = getChar()
        if hrp and posicionGuardada then
            hrp.Anchored = false
            hrp.CFrame = posicionGuardada
            return true
        end
        return false
    end

    local function buscarTimer(forzar)
        if timerLabel and timerLabel.Parent then return true end
        if not forzar and tick() - ultimoIntentoBuscar < 3 then return false end
        ultimoIntentoBuscar = tick()
        timerLabel = nil
        local obj = pg:FindFirstChild("ObbyTowerTimerGui")
        if obj then
            local c = obj:FindFirstChild("Countdown", true)
            if c and (c:IsA("TextLabel") or c:IsA("TextButton")) then
                timerLabel = c
                return true
            end
        end
        for _, o in ipairs(pg:GetDescendants()) do
            if o:IsA("TextLabel") and (o.Text or ""):match("%d+:%d%d") then
                timerLabel = o
                return true
            end
        end
        return false
    end

    local function leerTimerSV()
        if not timerLabel or not timerLabel.Parent then return nil end
        local txt = timerLabel.Text or ""
        local m, s = txt:match("(%d+):(%d+)")
        if m and s then return tonumber(m) * 60 + tonumber(s) end
        local solo = txt:match("^(%d+)$")
        if solo then return tonumber(solo) end
        return nil
    end

    local function leerTimerScript()
        if ultimoValorTimer == nil then return nil end
        local transcurrido = tick() - ultimaVezCambioTimer
        if transcurrido < 0 then transcurrido = 0 end
        local estimado = ultimoValorTimer - transcurrido
        if estimado < 0 then estimado = 0 end
        return math.floor(estimado)
    end

    local function actualizarCache()
        local raw = leerTimerSV()
        if raw == nil then return end
        if ultimoValorLeidoGUI == nil or raw ~= ultimoValorLeidoGUI then
            ultimoValorTimer = raw
            ultimoValorLeidoGUI = raw
            ultimaVezCambioTimer = tick()
        end
    end

    local function setEstado(nuevo, color)
        estadoReclamo = nuevo
        pcall(function()
            local clave = ESTADO_CLAVE[nuevo] or "autoTPSinVerificar"
            autoTPEstadoLabel.Text = t(clave)
            autoTPEstadoLabel.TextColor3 = color or TEXTO_GRIS
        end)
    end

    local function cancelarIntento()
        intentoToken += 1
        if delayHandle then
            pcall(task.cancel, delayHandle)
            delayHandle = nil
        end
        intentoEnCurso = false
    end

    local function intentarReclamar(forzar)
        if not forzar and tick() - ultimoIntento < COOLDOWN_INTENTO then return end
        if intentoEnCurso then return end
        ultimoIntento = tick()
        intentoEnCurso = true
        intentoToken += 1
        local miToken = intentoToken

        if not guardarPosicion() then
            intentoEnCurso = false
            return
        end

        delayHandle = task.delay(ESPERA_PRE_TP, function()
            if miToken ~= intentoToken then return end
            if not autoActivo then intentoEnCurso = false return end

            if not hacerTP(TORRE) then
                intentoEnCurso = false
                return
            end
            setEstado("TELEPORTANDO", AMBAR)

            delayHandle = task.delay(DELAY_POST_TP, function()
                if miToken ~= intentoToken then return end

                delayHandle = task.delay(ESPERA_EN_TORRE, function()
                    if miToken ~= intentoToken then return end
                    volverAPosicion()
                    if estadoReclamo ~= "RECLAMADO" then
                        setEstado("NO RECLAMABLE", AMBAR)
                    end
                    intentoEnCurso = false
                    delayHandle = nil
                    if autoActivo then
                        task.delay(0.5, function()
                            if autoActivo and not intentoEnCurso then
                                ultimoIntento = 0
                                pcall(intentarReclamar, true)
                            end
                        end)
                    end
                end)
            end)
        end)
    end

    local function actualizarToggle(activo)
        if activo then
            tw(toggleTrack, TWEEN_TOGGLE, {BackgroundColor3 = ORO})
            pcall(function() toggleStroke.Color = ORO end)
            tw(toggleKnob, TWEEN_TOGGLE, {
                Position = UDim2.new(1, -23, 0.5, -10),
                BackgroundColor3 = NEGRO
            })
        else
            tw(toggleTrack, TWEEN_TOGGLE, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)})
            pcall(function() toggleStroke.Color = Color3.fromRGB(80, 80, 90) end)
            tw(toggleKnob, TWEEN_TOGGLE, {
                Position = UDim2.new(0, 3, 0.5, -10),
                BackgroundColor3 = Color3.fromRGB(200, 200, 210)
            })
        end
    end
    local function actualizarToggle(activo)
        if activo then
            tw(toggleTrack, TWEEN_TOGGLE, {BackgroundColor3 = ORO})
            pcall(function() toggleStroke.Color = ORO end)
            tw(toggleKnob, TWEEN_TOGGLE, {
                Position = UDim2.new(1, -23, 0.5, -10),
                BackgroundColor3 = NEGRO
            })
        else
            tw(toggleTrack, TWEEN_TOGGLE, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)})
            pcall(function() toggleStroke.Color = Color3.fromRGB(80, 80, 90) end)
            tw(toggleKnob, TWEEN_TOGGLE, {
                Position = UDim2.new(0, 3, 0.5, -10),
                BackgroundColor3 = Color3.fromRGB(200, 200, 210)
            })
        end
    end

    local function detenerAuto()
        autoActivo = false
        autoToken += 1
        local teniaIntento = intentoEnCurso
        cancelarIntento()
        if teniaIntento then
            volverAPosicion()
        end
        actualizarToggle(false)
        setEstado("APAGADO", TEXTO_GRIS)
    end

    local function iniciarAuto()
        if autoActivo then return end
        autoActivo = true
        autoToken += 1
        local miToken = autoToken

        actualizarToggle(true)
        setEstado("ESPERANDO", VERDE_CLARO)

        buscarTimer(true)
        actualizarCache()

        if not yaVerificado then
            intentoEnCurso = false
            ultimoIntento = 0
            intentarReclamar(true)
            yaVerificado = true
        end

        task.spawn(function()
            local timerAnterior = leerTimerScript()
            while autoActivo and miToken == autoToken do
                task.wait(1)
                if not autoActivo or miToken ~= autoToken then return end
                buscarTimer(false)
                actualizarCache()
                local tv = leerTimerScript()
                if tv == nil then
                    pcall(function() autoTPTimerValor.Text = "--:--" end)
                    if autoActivo then setEstado("SIN TIMER", AMBAR) end
                else
                    pcall(function()
                        autoTPTimerValor.Text = string.format("%02d:%02d", math.floor(tv / 60), tv % 60)
                    end)
                    local reset = (timerAnterior and tv > timerAnterior + MARGEN_RESET)
                    if reset then
                        if not autoActivo then return end
                        yaVerificado = false
                        timerEnReclamo = -1
                        timestampReclamo = -1
                        if autoActivo then setEstado("SIN VERIFICAR", TEXTO_GRIS) end
                        intentarReclamar(true)
                        if not autoActivo then return end
                        task.wait(0.2)
                        buscarTimer(true)
                        actualizarCache()
                        timerAnterior = leerTimerScript()
                    elseif tv <= 0 then
                        if not autoActivo then return end
                        intentarReclamar(true)
                        if not autoActivo then return end
                        task.wait(0.2)
                        buscarTimer(true)
                        actualizarCache()
                        timerAnterior = leerTimerScript()
                    else
                        timerAnterior = tv
                        if autoActivo and estadoReclamo ~= "RECLAMADO" and estadoReclamo ~= "TELEPORTANDO" then
                            setEstado("ESPERANDO", VERDE_CLARO)
                        end
                    end
                end
            end
        end)
    end

    toggleBtn.MouseButton1Click:Connect(function()
        local ok, err = pcall(function()
            if autoActivo then detenerAuto() else iniciarAuto() end
        end)
        if not ok then
            warn("[SC v2.2] AutoTP error: " .. tostring(err))
        end
    end)

    task.spawn(function()
        local remotes = RS:WaitForChild("Remotes", 20)
        if not remotes then return end
        local TowerRewarded = remotes:WaitForChild("TowerRewarded", 20)
        local TowerRewardDenied = remotes:WaitForChild("TowerRewardDenied", 20)
        if TowerRewarded then
            TowerRewarded.OnClientEvent:Connect(function()
                local tActual = leerTimerScript() or leerTimerSV() or -1
                timerEnReclamo = tActual
                timestampReclamo = os.time()
                setEstado("RECLAMADO", ORO)
                yaVerificado = true
                if autoActivo then
                    setEstado("ESPERANDO", VERDE_CLARO)
                end
            end)
        end
        if TowerRewardDenied then
            TowerRewardDenied.OnClientEvent:Connect(function()
                if estadoReclamo == "RECLAMADO" then
                    local tActual = leerTimerScript() or leerTimerSV() or ultimoValorTimer
                    if tActual and timerEnReclamo >= 0 and tActual > timerEnReclamo + MARGEN_RESET then
                        timerEnReclamo = -1
                        timestampReclamo = -1
                        setEstado("NO RECLAMABLE", AMBAR)
                    end
                    return
                end
                setEstado("NO RECLAMABLE", AMBAR)
            end)
        end
    end)

    local function crearOpcionIdioma(codigo, texto, orden)
        local optBtn = Instance.new("TextButton")
        optBtn.Size = UDim2.new(1, 0, 0, 32)
        optBtn.BackgroundColor3 = codigo == idiomaActual and NEGRO or NEGRO_3
        optBtn.Text = texto
        optBtn.TextColor3 = codigo == idiomaActual and ORO or TEXTO
        optBtn.Font = Enum.Font.GothamMedium
        optBtn.TextSize = 13
        optBtn.LayoutOrder = orden
        optBtn.ZIndex = 22
        optBtn.Parent = idiomaOpciones
        Instance.new("UICorner", optBtn).CornerRadius = UDim.new(0, 8)

        local optStroke = aplicarStroke(optBtn, ORO, 1, codigo == idiomaActual and 0.2 or 0.85)

        table.insert(opcionesIdioma, {codigo = codigo, btn = optBtn, stroke = optStroke})

        optBtn.MouseEnter:Connect(function()
            if codigo ~= idiomaActual then
                tw(optBtn, TWEEN_COLOR, {BackgroundColor3 = Color3.fromRGB(40, 40, 52)})
                tw(optStroke, TWEEN_COLOR, {Transparency = 0.4})
            end
        end)

        optBtn.MouseLeave:Connect(function()
            if codigo ~= idiomaActual then
                tw(optBtn, TWEEN_COLOR, {BackgroundColor3 = NEGRO_3})
                tw(optStroke, TWEEN_COLOR, {Transparency = 0.85})
            end
        end)

        optBtn.MouseButton1Click:Connect(function()
            if codigo == idiomaActual then
                idiomaDropdown.Visible = false
                return
            end
            cambiarIdioma(codigo)
        end)
    end

    crearOpcionIdioma("es", "Español", 1)
    crearOpcionIdioma("en", "English", 2)

    idiomaBtn.MouseButton1Click:Connect(function()
        idiomaDropdown.Visible = not idiomaDropdown.Visible
    end)

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
            btn.MouseEnter:Connect(function() hover = true; aplicar() end)
            btn.MouseLeave:Connect(function() hover = false; press = false; aplicar() end)
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
    setupBoton(idiomaBtn)
    setupBoton(discordBtn)

    local function actualizarNav()
        tw(prevBtn, TWEEN_COLOR, {BackgroundTransparency = paginaActual == 1 and 0.65 or 0})
        tw(nextBtn, TWEEN_COLOR, {BackgroundTransparency = paginaActual == 2 and 0.65 or 0})
    end

    actualizarNav()

    local transicionando = false
    local function irAPagina(n)
        if transicionando or n == paginaActual then return end
        transicionando = true
        idiomaDropdown.Visible = false
        paginaActual = n
        pageIndicator.Text = string.format(t("pagina"), n)
        actualizarNav()
        local tween
        if n == 1 then
            page1.Visible = true
            page2.Visible = true
            page1.Position = UDim2.new(-1, 0, 0, 0)
            page2.Position = UDim2.new(0, 0, 0, 0)
            tween = tw(page1, TWEEN_SLIDE, {Position = UDim2.new(0, 0, 0, 0)})
            tw(page2, TWEEN_SLIDE, {Position = UDim2.new(1, 0, 0, 0)})
            tween.Completed:Wait()
            page2.Visible = false
        else
            page1.Visible = true
            page2.Visible = true
            page1.Position = UDim2.new(0, 0, 0, 0)
            page2.Position = UDim2.new(1, 0, 0, 0)
            tween = tw(page1, TWEEN_SLIDE, {Position = UDim2.new(-1, 0, 0, 0)})
            tw(page2, TWEEN_SLIDE, {Position = UDim2.new(0, 0, 0, 0)})
            tween.Completed:Wait()
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
            speedText.Text = t("stop")
            tw(speedBtn, TWEEN_COLOR, {BackgroundColor3 = Color3.new(1, 1, 1)})
            speedGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 100, 100)),
                ColorSequenceKeypoint.new(1, ROJO)
            })
            tw(btnBorde, TWEEN_COLOR, {Color = Color3.fromRGB(240, 130, 130)})
            funcionando.Text = t("encendido")
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
            speedText.Text = t("start")
            tw(speedBtn, TWEEN_COLOR, {BackgroundColor3 = Color3.new(1, 1, 1)})
            speedGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, ORO_CLARO),
                ColorSequenceKeypoint.new(1, ORO)
            })
            tw(btnBorde, TWEEN_COLOR, {Color = ORO_CLARO})
            funcionando.Text = t("apagado")
            tw(funcionando, TWEEN_COLOR, {TextColor3 = TEXTO_GRIS})
            estadoBorde.Color = TEXTO_GRIS
            if tiempoInicioEncendido then
                tiempoEncendido = os.clock() - tiempoInicioEncendido
                tiempoInicioEncendido = nil
            end
        end
    end

    speedBtn.MouseButton1Click:Connect(function()
        if running then
            startToken += 1
            setRunning(false)
            if clickConn then clickConn:Disconnect() clickConn = nil end
            return
        end

        startToken += 1
        local myToken = startToken
        if clickConn then clickConn:Disconnect() clickConn = nil end

        setRunning(true)

        funcionando.Text = t("calibrando")
        tw(funcionando, TWEEN_COLOR, {TextColor3 = AMBAR})
        estadoBorde.Color = AMBAR

        task.spawn(function()
            yaDetectado = false
            detectar()
            task.wait(0.5)

            if myToken ~= startToken or not gui.Parent or not running then return end

            if #clickRemotes == 0 then
                setRunning(false)
                funcionando.Text = t("sinRemotes")
                tw(funcionando, TWEEN_COLOR, {TextColor3 = AMBAR})
                estadoBorde.Color = AMBAR
                return
            end

            numRemotesFijo = #clickRemotes
            funcionando.Text = t("encendido")
            tw(funcionando, TWEEN_COLOR, {TextColor3 = VERDE_CLARO})
            estadoBorde.Color = VERDE_CLARO

            local numRemotes = numRemotesFijo
            local acumulado = 0
            local tEspera = tonumber(waitBox.Text) or 0.005
            if tEspera <= 0 then tEspera = 0.005 end
            if tEspera < 0.0001 then tEspera = 0.0001 end

            clickConn = RunService.Heartbeat:Connect(function(dt)
                if not running or myToken ~= startToken then
                    if clickConn then clickConn:Disconnect() clickConn = nil end
                    return
                end
                acumulado += dt
                local limite = os.clock() + PRESUPUESTO_FRAME
                while acumulado >= tEspera do
                    acumulado -= tEspera
                    for j = 1, numRemotes do
                        local r = clickRemotes[j]
                        if r and r.Parent then
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
        if flyActive then
            stopFly()
            flyBtn.Text = t("flyOff")
            tw(flyBtn, TWEEN_COLOR, {BackgroundColor3 = NEGRO_3, TextColor3 = ORO})
        else
            startFly()
            flyBtn.Text = t("flyOn")
            tw(flyBtn, TWEEN_COLOR, {BackgroundColor3 = ORO, TextColor3 = NEGRO})
        end
    end)

    tpBtn.MouseButton1Click:Connect(function()
        local char = player.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = CFrame.new(TORRE) end
        end
    end)

    waitBox.Focused:Connect(function()
        tw(boxBorde, TWEEN_HOVER, {Transparency = 0, Thickness = 2})
    end)

    waitBox.FocusLost:Connect(function()
        tw(boxBorde, TWEEN_HOVER, {Transparency = 0.5, Thickness = 1})
        local val = tonumber(waitBox.Text)
        if not val or val <= 0 then waitBox.Text = "0.005" end
        pcall(function()
            player:SetAttribute("SCO_v2.2_wait", tonumber(waitBox.Text) or 0.005)
        end)
    end)

    pcall(function()
        local saved = player:GetAttribute("SCO_v2.2_wait")
        if saved then waitBox.Text = tostring(saved) end
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
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(0, 0))
        end)
    end)

    conectar(player.CharacterAdded, function()
        if flyActive then
            stopFly()
            flyBtn.Text = t("flyOff")
            flyBtn.TextColor3 = ORO
            flyBtn.BackgroundColor3 = NEGRO_3
        end
    end)

    local confirmando = false

    local savedPos = main.Position
    local primeraVez = true
    local animando = false

    local function minimizar()
        if animando then return end
        animando = true
        idiomaDropdown.Visible = false
        savedPos = main.Position
        local tween = tw(mainEscala, TWEEN_SALIDA, {Scale = 0})
        tween.Completed:Wait()
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
        if confirmando then return end
        animando = true
        idiomaDropdown.Visible = false
        glowCirculo:Cancel()
        circleBordeExt.Transparency = 0.2
        local tween = tw(circleEscala, TWEEN_SALIDA, {Scale = 0})
        tween.Completed:Wait()
        circleWrapper.Visible = false
        main.Position = savedPos
        posGlobalMain = savedPos
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
                local cScale = circleEscala.Scale
                if cScale <= 0 then cScale = 1 end
                circleWrapper.Position = UDim2.new(cPos.X.Scale, cPos.X.Offset + delta.X / cScale, cPos.Y.Scale, cPos.Y.Offset + delta.Y / cScale)
            end
        end
        if dragging then
            local delta = input.Position - dragStart
            local dScale = mainEscala.Scale
            if dScale <= 0 then dScale = 1 end
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X / dScale, startPos.Y.Scale, startPos.Y.Offset + delta.Y / dScale)
            posGlobalMain = main.Position
        end
    end)

    conectar(UIS.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local fueClick = cDrag and not cMovido
            cDrag = false
            dragging = false
            if fueClick then task.spawn(restaurar) end
        end
    end)

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

    aplicarStroke(confirmFrame, ORO, 1.5, 0.3)

    local confirmTexto = Instance.new("TextLabel")
    confirmTexto.Size = UDim2.new(1, -20, 0, 24)
    confirmTexto.Position = UDim2.new(0, 10, 0, 8)
    confirmTexto.BackgroundTransparency = 1
    confirmTexto.Text = t("cerrarTitulo")
    confirmTexto.TextColor3 = TEXTO
    confirmTexto.Font = Enum.Font.GothamMedium
    confirmTexto.TextSize = 12
    confirmTexto.ZIndex = 51
    confirmTexto.Parent = confirmFrame

    local confirmTiempo = Instance.new("TextLabel")
    confirmTiempo.Size = UDim2.new(1, -20, 0, 20)
    confirmTiempo.Position = UDim2.new(0, 10, 0, 34)
    confirmTiempo.BackgroundTransparency = 1
    confirmTiempo.Text = "5s"
    confirmTiempo.TextColor3 = AMBAR
    confirmTiempo.Font = Enum.Font.GothamMedium
    confirmTiempo.TextSize = 14
    confirmTiempo.ZIndex = 51
    confirmTiempo.Parent = confirmFrame

    local confirmSi = Instance.new("TextButton")
    confirmSi.Size = UDim2.new(0.45, 0, 0, 34)
    confirmSi.Position = UDim2.new(0.03, 0, 0, 68)
    confirmSi.BackgroundColor3 = ROJO
    confirmSi.Text = t("si")
    confirmSi.TextColor3 = TEXTO
    confirmSi.Font = Enum.Font.GothamMedium
    confirmSi.TextSize = 12
    confirmSi.ZIndex = 51
    confirmSi.Parent = confirmFrame
    Instance.new("UICorner", confirmSi).CornerRadius = UDim.new(0, 8)

    local confirmNo = Instance.new("TextButton")
    confirmNo.Size = UDim2.new(0.45, 0, 0, 34)
    confirmNo.Position = UDim2.new(0.52, 0, 0, 68)
    confirmNo.BackgroundColor3 = VERDE
    confirmNo.Text = t("cancelar")
    confirmNo.TextColor3 = TEXTO
    confirmNo.Font = Enum.Font.GothamMedium
    confirmNo.TextSize = 12
    confirmNo.ZIndex = 51
    confirmNo.Parent = confirmFrame
    Instance.new("UICorner", confirmNo).CornerRadius = UDim.new(0, 8)

    local function cancelarCountdown()
        if confirmCountdownTask then
            local tk = confirmCountdownTask
            confirmCountdownTask = nil
            pcall(task.cancel, tk)
        end
    end

    local function cerrarConfirm()
        if not confirmando then return end
        confirmando = false
        confirmSession += 1
        cancelarCountdown()
        local tween = TweenService:Create(confirmEscala, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Scale = 0.8})
        tween:Play()
        tween.Completed:Wait()
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
        idiomaDropdown.Visible = false
        main.Visible = false
        closeBtn.Visible = false
        confirmFrame.Visible = true
        confirmEscala.Scale = 0.8
        TweenService:Create(confirmEscala, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()

        cancelarCountdown()
        confirmCountdownTask = task.spawn(function()
            local restante = 5
            while restante > 0 and confirmando and mySession == confirmSession do
                confirmTiempo.Text = restante .. "s"
                task.wait(1)
                restante -= 1
            end
            if confirmando and mySession == confirmSession then
                confirmando = false
                confirmSession += 1
                confirmCountdownTask = nil
                local tween = TweenService:Create(confirmEscala, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Scale = 0.8})
                tween:Play()
                tween.Completed:Wait()
                confirmFrame.Visible = false
                main.Visible = true
                closeBtn.Visible = true
            end
        end)
    end)

    confirmSi.MouseButton1Click:Connect(function()
        confirmando = false
        cancelarCountdown()
        gui:Destroy()
    end)

    confirmNo.MouseButton1Click:Connect(function()
        cerrarConfirm()
    end)

    gui.Destroying:Connect(function()
        running = false
        shineToken += 1
        startToken += 1
        pcall(function()
            autoActivo = false
            autoToken += 1
            intentoEnCurso = false
        end)
        if clickConn then
            clickConn:Disconnect()
            clickConn = nil
        end
        cancelarCountdown()
        pcall(function()
            player:SetAttribute("SCO_v2.2_wait", tonumber(waitBox.Text) or 0.005)
        end)
        stopFly()
        for _, c in ipairs(conexiones) do
            c:Disconnect()
        end
        for _, tween in ipairs(gradTweens) do
            tween:Cancel()
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

    aplicarIdioma = function()
        title.Text = t("titulo")
        if refs.version then refs.version.Text = esMovil and "v2.2" or t("version") end
        if refs.autor then refs.autor.Text = t("autor") end
        if refs.plataforma then refs.plataforma.Text = esMovil and t("mobile") or t("pc") end
        if refs.tiempoEncendidoLabel then refs.tiempoEncendidoLabel.Text = t("tiempoEncendidoLabel") end

        pageIndicator.Text = string.format(t("pagina"), paginaActual)
        etiquetaTiempo.Text = t("tiempoClick")
        controles.Text = esMovil and "" or t("controles")
        tpBtn.Text = t("irTorre")
        antiafkLabel.Text = t("antiAfk")
        idiomaBtn.Text = t("botonIdioma")
        confirmTexto.Text = t("cerrarTitulo")
        confirmSi.Text = t("si")
        confirmNo.Text = t("cancelar")

        speedText.Text = running and t("stop") or t("start")
        flyBtn.Text = flyActive and t("flyOn") or t("flyOff")
        funcionando.Text = running and t("encendido") or t("apagado")

        if refs.autoTPTitulo then refs.autoTPTitulo.Text = t("autoTPTitulo") end
        if refs.autoTPTimerTag then refs.autoTPTimerTag.Text = t("autoTPTimerLabel") end
        pcall(function()
            local clave = ESTADO_CLAVE[estadoReclamo] or "autoTPApagado"
            autoTPEstadoLabel.Text = t(clave)
        end)

        for _, opt in ipairs(opcionesIdioma) do
            local sel = opt.codigo == idiomaActual
            opt.btn.BackgroundColor3 = sel and NEGRO or NEGRO_3
            opt.btn.TextColor3 = sel and ORO or TEXTO
            if opt.stroke then opt.stroke.Transparency = sel and 0.2 or 0.85 end
        end

        if discordLabel then discordLabel.Text = t("discord") end
        if discordCopiado then discordCopiado.Text = t("discordCopiado") end
    end

    cambiarIdioma = function(codigo)
        idiomaActual = codigo
        idiomaDropdown.Visible = false

        local cargandoGui = Instance.new("ScreenGui")
        cargandoGui.Name = "CargandoIdioma"
        cargandoGui.DisplayOrder = 1000
        cargandoGui.ResetOnSpawn = false
        cargandoGui.Parent = pg

        local cargandoFrame = Instance.new("Frame")
        cargandoFrame.Size = UDim2.new(0, 200, 0, 56)
        cargandoFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        cargandoFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        cargandoFrame.BackgroundColor3 = NEGRO_2
        cargandoFrame.BackgroundTransparency = 1
        cargandoFrame.BorderSizePixel = 0
        cargandoFrame.Parent = cargandoGui
        Instance.new("UICorner", cargandoFrame).CornerRadius = UDim.new(0, 12)

        local cargandoStroke = aplicarStroke(cargandoFrame, ORO, 1.5, 1)

        local cargandoLabel = Instance.new("TextLabel")
        cargandoLabel.Size = UDim2.new(1, 0, 1, 0)
        cargandoLabel.BackgroundTransparency = 1
        cargandoLabel.Text = textos[codigo].cargando
        cargandoLabel.TextColor3 = ORO
        cargandoLabel.TextTransparency = 1
        cargandoLabel.Font = Enum.Font.GothamMedium
        cargandoLabel.TextSize = 20
        cargandoLabel.Parent = cargandoFrame

        TweenService:Create(cargandoFrame, TweenInfo.new(0.2), {BackgroundTransparency = 0.1}):Play()
        TweenService:Create(cargandoStroke, TweenInfo.new(0.2), {Transparency = 0.3}):Play()
        TweenService:Create(cargandoLabel, TweenInfo.new(0.2), {TextTransparency = 0}):Play()

        task.wait(0.3)

        local mainEstabaVisible = main.Visible
        main.Visible = false
        circleWrapper.Visible = false

        local ok, err = pcall(aplicarIdioma)
        if not ok then
            warn("[SC v2.2] aplicarIdioma error: " .. tostring(err))
        end

        if mainEstabaVisible then main.Visible = true end

        TweenService:Create(cargandoFrame, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
        TweenService:Create(cargandoLabel, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
        task.wait(0.15)
        cargandoGui:Destroy()
    end

    tw(mainEscala, TWEEN_ENTRADA, {Scale = escalaBase})
end

reconstruirMenu()

print("[Speed Click for Owner v2.2] Listo · " .. (esMovil and "Mobile" or "PC") .. " · Idioma: " .. idiomaActual)
