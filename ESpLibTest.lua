local ESPLibrary = {}

local camera = workspace.CurrentCamera
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local espEnabled = false
local playerESPInfo = {}

local function createPlayerESP(player, options)
    local function disconnectPlayerESP(player)
        local connections, textLabel = playerESPInfo[player]
        if connections then
            for _, conn in pairs(connections) do
                conn:Disconnect()
            end
            if textLabel then
                textLabel:Remove()
            end
            playerESPInfo[player] = nil
        end
    end

    local character = player.Character
    if not character then
        return
    end

    local humanoid = character:FindFirstChild("Humanoid")
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if not humanoid or not humanoidRootPart then
        return
    end

    local textLabel = Drawing.new("Text")
    textLabel.Visible = false
    textLabel.Outline = true
    textLabel.Font = options.Font or 2
    textLabel.Color = options.Color or Color3.fromRGB(255, 255, 255)
    textLabel.Size = options.Size or 13
    textLabel.Center = options.Center or false

    local partToShowOn = options.PartToShowOn or humanoidRootPart

    local ancestryChangedConnection
    local healthChangedConnection
    local renderSteppedConnection

    ancestryChangedConnection = character.AncestryChanged:Connect(function(_, parent)
        if not parent then
            textLabel.Visible = false
            disconnectPlayerESP(player)
        end
    end)

    healthChangedConnection = humanoid.HealthChanged:Connect(function(health)
        if health <= 0 then
            textLabel.Visible = false
            disconnectPlayerESP(player)
        end
    end)

    renderSteppedConnection = runService.RenderStepped:Connect(function()
        local partPosition, partOnScreen = camera:WorldToViewportPoint(partToShowOn.Position)
        if partOnScreen then
            local textToShow = ""
            if options.ShowName then
                textToShow = player.Name
            end
            if options.ShowHealth then
                textToShow = textToShow .. (textToShow ~= "" and "\n" or "") .. string.format("Health: %d", humanoid.Health)
            end
            if options.ShowDistance then
                local distance = math.floor((partToShowOn.Position - camera.CFrame.Position).Magnitude + 0.5)
                textToShow = textToShow .. (textToShow ~= "" and "\n" or "") .. string.format("Distance: %d studs", distance)
            end
            textLabel.Position = Vector2.new(partPosition.X, partPosition.Y)
            textLabel.Text = textToShow
            textLabel.Visible = espEnabled
        else
            textLabel.Visible = false
        end
    end)

    playerESPInfo[player] = {
        AncestryChanged = ancestryChangedConnection,
        HealthChanged = healthChangedConnection,
        RenderStepped = renderSteppedConnection,
        TextLabel = textLabel,
        Options = options,
    }
end

function ESPLibrary.AddESP(player, enabled, options)
    if enabled then
        createPlayerESP(player, options or {})
    else
        local espInfo = playerESPInfo[player]
        if espInfo then
            local connections = espInfo
            for _, conn in pairs(connections) do
                conn:Disconnect()
            end
            local textLabel = connections.TextLabel
            if textLabel then
                textLabel:Remove()
            end
            playerESPInfo[player] = nil
        end
    end
end

function ESPLibrary.ToggleESP(espEnabledState)
    espEnabled = espEnabledState or not espEnabled
    for player, espInfo in pairs(playerESPInfo) do
        if espEnabled then
            createPlayerESP(player, espInfo.Options)
        else
            for _, conn in pairs(espInfo) do
                if type(conn) == "userdata" and conn.Disconnect then
                    conn:Disconnect()
                end
            end
            local textLabel = espInfo.TextLabel
            if textLabel then
                textLabel:Remove()
            end
            playerESPInfo[player] = nil
        end
    end
end

userInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.J then
        ESPLibrary.ToggleESP()
    end
end)

players.PlayerAdded:Connect(function(player)
    if player ~= localPlayer then
        ESPLibrary.AddESP(player, true)
    end
end)

for _, player in ipairs(players:GetPlayers()) do
    if player ~= localPlayer then
        ESPLibrary.AddESP(player, true)
    end
end

return ESPLibrary
