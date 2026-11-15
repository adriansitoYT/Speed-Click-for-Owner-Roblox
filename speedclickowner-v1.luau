print("[Speed Click for Owner v1] Cargando...")
task.wait(0.5)

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui", 10)

local esMovil = UIS.TouchEnabled and not UIS.KeyboardEnabled

local VERDE = Color3.fromRGB(46, 160, 67)
local ROJO = Color3.fromRGB(200, 55, 55)
local MORADO = Color3.fromRGB(110, 70, 180)
local AZUL = Color3.fromRGB(55, 120, 200)
local AZUL_CLARO = Color3.fromRGB(80, 160, 240)
local TEXTO = Color3.fromRGB(235, 235, 240)

local gui = Instance.new("ScreenGui")
gui.Name = "SpeedClickOwner"
gui.ResetOnSpawn = false
gui.DisplayOrder = 999
gui.Parent = pg

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 300, 0, 360)
main.Position = UDim2.new(0.5, -150, 0.5, -180)
main.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
main.BorderSizePixel = 0
main.Active = true
main.ZIndex = 2
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

local borde = Instance.new("UIStroke", main)
borde.Color = Color3.fromRGB(60, 60, 75)
borde.Thickness = 1
borde.Transparency = 0.4

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 44)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
titleBar.ZIndex = 3
titleBar.Parent = main
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 14, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Speed Click for Owner"
title.TextColor3 = TEXTO
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 4
title.Parent = titleBar

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, -80, 0, 14)
sub.Position = UDim2.new(0, 14, 0, 26)
sub.BackgroundTransparency = 1
sub.Text = "v1  ·  adrianfis  ·  " .. (esMovil and "Mobile Detectado" or "PC Detectado")
sub.TextColor3 = AZUL_CLARO
sub.Font = Enum.Font.GothamBold
sub.TextSize = 11
sub.TextXAlignment = Enum.TextXAlignment.Left
sub.ZIndex = 4
sub.Parent = titleBar

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 26, 0, 26)
minBtn.Position = UDim2.new(1, -60, 0, 9)
minBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
minBtn.Text = "−"
minBtn.TextColor3 = TEXTO
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 16
minBtn.ZIndex = 4
minBtn.Parent = titleBar
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 7)

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 26, 0, 26)
closeBtn.Position = UDim2.new(1, -30, 0, 9)
closeBtn.BackgroundColor3 = ROJO
closeBtn.Text = "X"
closeBtn.TextColor3 = TEXTO
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 12
closeBtn.ZIndex = 4
closeBtn.Parent = titleBar
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 7)
closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

local circle = Instance.new("TextButton")
circle.Size = UDim2.new(0, 58, 0, 58)
circle.Position = UDim2.new(0.5, -29, 0.5, -29)
circle.BackgroundColor3 = AZUL
circle.Text = "SC"
circle.TextColor3 = Color3.new(1,1,1)
circle.Font = Enum.Font.GothamBold
circle.TextSize = 20
circle.Visible = false
circle.Active = true
circle.ZIndex = 10
circle.Parent = gui
Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

local circleGrad = Instance.new("UIGradient")
circleGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, AZUL_CLARO),
    ColorSequenceKeypoint.new(1, AZUL)
})
circleGrad.Rotation = 45
circleGrad.Parent = circle

local circleBorde = Instance.new("UIStroke", circle)
circleBorde.Color = Color3.new(1,1,1)
circleBorde.Thickness = 2.5
circleBorde.Transparency = 0.4

local funcionando = Instance.new("TextLabel")
funcionando.Size = UDim2.new(1, -28, 0, 26)
funcionando.Position = UDim2.new(0, 14, 0, 56)
funcionando.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
funcionando.BorderSizePixel = 0
funcionando.Text = "●  Apagado"
funcionando.TextColor3 = Color3.fromRGB(150, 150, 165)
funcionando.Font = Enum.Font.GothamBold
funcionando.TextSize = 12
funcionando.ZIndex = 3
funcionando.Parent = main
Instance.new("UICorner", funcionando).CornerRadius = UDim.new(0, 8)

local speedBtn = Instance.new("TextButton")
speedBtn.Size = UDim2.new(1, -28, 0, 50)
speedBtn.Position = UDim2.new(0, 14, 0, 90)
speedBtn.BackgroundColor3 = VERDE
speedBtn.Text = "START"
speedBtn.TextColor3 = Color3.new(1,1,1)
speedBtn.Font = Enum.Font.GothamBold
speedBtn.TextSize = 16
speedBtn.ZIndex = 3
speedBtn.Parent = main
Instance.new("UICorner", speedBtn).CornerRadius = UDim.new(0, 10)

local btnBorde = Instance.new("UIStroke", speedBtn)
btnBorde.Color = Color3.fromRGB(120, 220, 140)
btnBorde.Thickness = 2
btnBorde.Transparency = 0.5

local etiquetaTiempo = Instance.new("TextLabel")
etiquetaTiempo.Size = UDim2.new(1, -28, 0, 16)
etiquetaTiempo.Position = UDim2.new(0, 14, 0, 148)
etiquetaTiempo.BackgroundTransparency = 1
etiquetaTiempo.Text = "Tiempo por click"
etiquetaTiempo.TextColor3 = Color3.fromRGB(150, 150, 165)
etiquetaTiempo.Font = Enum.Font.GothamBold
etiquetaTiempo.TextSize = 11
etiquetaTiempo.TextXAlignment = Enum.TextXAlignment.Left
etiquetaTiempo.ZIndex = 3
etiquetaTiempo.Parent = main

local waitBox = Instance.new("TextBox")
waitBox.Size = UDim2.new(1, -28, 0, 34)
waitBox.Position = UDim2.new(0, 14, 0, 166)
waitBox.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
waitBox.BorderSizePixel = 0
waitBox.Text = "0.005"
waitBox.PlaceholderText = "0.005"
waitBox.TextColor3 = TEXTO
waitBox.Font = Enum.Font.Gotham
waitBox.TextSize = 13
waitBox.ZIndex = 3
waitBox.Parent = main
Instance.new("UICorner", waitBox).CornerRadius = UDim.new(0, 8)

local boxBorde = Instance.new("UIStroke", waitBox)
boxBorde.Color = Color3.fromRGB(60, 60, 75)
boxBorde.Thickness = 1
boxBorde.Transparency = 0.4

local flyBtn = Instance.new("TextButton")
flyBtn.Size = UDim2.new(1, -28, 0, 42)
flyBtn.Position = UDim2.new(0, 14, 0, 210)
flyBtn.BackgroundColor3 = MORADO
flyBtn.Text = "Fly: OFF"
flyBtn.TextColor3 = Color3.new(1,1,1)
flyBtn.Font = Enum.Font.GothamBold
flyBtn.TextSize = 13
flyBtn.ZIndex = 3
flyBtn.Parent = main
Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0, 10)

local flyBorde = Instance.new("UIStroke", flyBtn)
flyBorde.Color = Color3.fromRGB(170, 130, 240)
flyBorde.Thickness = 2
flyBorde.Transparency = 0.5

local controles = Instance.new("TextLabel")
controles.Size = UDim2.new(1, -28, 0, 28)
controles.Position = UDim2.new(0, 14, 0, 256)
controles.BackgroundTransparency = 1
if esMovil then
    controles.Text = ""
else
    controles.Text = "WASD mover · Espacio subir · Ctrl bajar"
end
controles.TextColor3 = Color3.fromRGB(120, 120, 140)
controles.Font = Enum.Font.Gotham
controles.TextSize = 10
controles.TextXAlignment = Enum.TextXAlignment.Left
controles.TextWrapped = true
controles.ZIndex = 3
controles.Parent = main

local tpBtn = Instance.new("TextButton")
tpBtn.Size = UDim2.new(1, -28, 0, 40)
tpBtn.Position = UDim2.new(0, 14, 0, 290)
tpBtn.BackgroundColor3 = AZUL
tpBtn.Text = "Ir a la torre"
tpBtn.TextColor3 = Color3.new(1,1,1)
tpBtn.Font = Enum.Font.GothamBold
tpBtn.TextSize = 13
tpBtn.ZIndex = 3
tpBtn.Parent = main
Instance.new("UICorner", tpBtn).CornerRadius = UDim.new(0, 10)

local tpBorde = Instance.new("UIStroke", tpBtn)
tpBorde.Color = Color3.fromRGB(120, 180, 240)
tpBorde.Thickness = 2
tpBorde.Transparency = 0.5

local clickRemotes = {}
local running = false
local flyActive = false
local flyBV, flyBG, flyConn
local TORRE = Vector3.new(230, 279, -204)
local yaDetectado = false

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

local function setRunning(on)
    running = on
    if on then
        speedBtn.Text = "STOP"
        speedBtn.BackgroundColor3 = ROJO
        btnBorde.Color = Color3.fromRGB(240, 130, 130)
        funcionando.Text = "●  Encendido"
        funcionando.TextColor3 = Color3.fromRGB(120, 220, 140)
    else
        speedBtn.Text = "START"
        speedBtn.BackgroundColor3 = VERDE
        btnBorde.Color = Color3.fromRGB(120, 220, 140)
        funcionando.Text = "●  Apagado"
        funcionando.TextColor3 = Color3.fromRGB(150, 150, 165)
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
    flyBtn.Text = "Fly: OFF"
    flyBtn.BackgroundColor3 = MORADO
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
    flyBV.Velocity = Vector3.new(0, 0, 0)
    flyBV.Parent = hrp

    flyBG = Instance.new("BodyGyro")
    flyBG.P = 9000
    flyBG.MaxTorque = Vector3.new(40000, 40000, 40000)
    flyBG.CFrame = hrp.CFrame
    flyBG.Parent = hrp

    flyBtn.Text = "Fly: ON"
    flyBtn.BackgroundColor3 = Color3.fromRGB(120, 70, 190)

    local camera = workspace.CurrentCamera
    local speed = 80

    flyConn = RunService.RenderStepped:Connect(function()
        if not flyActive or not hrp or not hrp.Parent then
            stopFly()
            return
        end
        local dir = Vector3.new(0, 0, 0)
        if UIS:IsKeyDown(Enum.KeyCode.W) then dir = dir + camera.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then dir = dir - camera.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then dir = dir - camera.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then dir = dir + camera.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0, 1, 0) end
        if dir.Magnitude > 0 then dir = dir.Unit end
        flyBV.Velocity = dir * speed
        flyBG.CFrame = camera.CFrame
    end)
end

speedBtn.MouseButton1Click:Connect(function()
    if running then
        setRunning(false)
        return
    end

    detectar()
    if #clickRemotes == 0 then
        funcionando.Text = "●  Sin remotes"
        funcionando.TextColor3 = Color3.fromRGB(240, 180, 120)
        return
    end

    local t = tonumber(waitBox.Text) or 0.005
    if waitBox.Text == "" or t <= 0 then t = 0.005 end
    if t < 0.0005 then t = 0.0005 end

    setRunning(true)

    task.spawn(function()
        while running do
            local startTime = os.clock()
            local clicksPerFrame = 1
            if t <= 0.01 then
                clicksPerFrame = 3
            end

            for i = 1, clicksPerFrame do
                if not running then break end
                for _, remote in ipairs(clickRemotes) do
                    pcall(function() remote:FireServer() end)
                end
            end

            local elapsed = os.clock() - startTime
            if elapsed < t then
                task.wait(t - elapsed)
            else
                task.wait()
            end
        end
    end)
end)

flyBtn.MouseButton1Click:Connect(function()
    if flyActive then stopFly() else startFly() end
end)

tpBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(TORRE)
    end
end)

waitBox.FocusLost:Connect(function()
    local t = tonumber(waitBox.Text)
    if not t or t <= 0 then
        waitBox.Text = "0.005"
    end
end)

task.spawn(function()
    task.wait(1)
    detectar()
end)

local savedPos = UDim2.new(0.5, -150, 0.5, -180)
local primeraVez = true

local function minimizar()
    savedPos = main.Position
    main.Visible = false
    if primeraVez then
        circle.Position = UDim2.new(0.5, -29, 0.5, -29)
        primeraVez = false
    end
    circle.Visible = true
    local tween = TweenService:Create(circle, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 58, 0, 58)
    })
    tween:Play()
end

local function restaurar()
    main.Position = savedPos
    main.Visible = true
    circle.Visible = false
end

minBtn.MouseButton1Click:Connect(minimizar)

local cDrag = false
local cStart = nil
local cPos = nil
local cMovido = false

circle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        cDrag = true
        cStart = input.Position
        cPos = circle.Position
        cMovido = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if cDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - cStart
        if math.abs(delta.X) > 8 or math.abs(delta.Y) > 8 then
            cMovido = true
            circle.Position = UDim2.new(cPos.X.Scale, cPos.X.Offset + delta.X, cPos.Y.Scale, cPos.Y.Offset + delta.Y)
        end
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if cDrag and not cMovido then
            restaurar()
        end
        cDrag = false
    end
end)

local dragging, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

print("[Speed Click for Owner v1] Listo · " .. (esMovil and "Mobile Detectado" or "PC Detectado"))
