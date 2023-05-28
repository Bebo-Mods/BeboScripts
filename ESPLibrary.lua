-- ESP Library

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = game:GetService("Workspace").CurrentCamera

local LineTracers = {}
local TextLabels = {}

-- Configure ESP settings
local espLineThickness = 2
local espTextSize = 18

local function createESP(player)
    if player == Players.LocalPlayer then
        return
    end
    
    local character = player.Character
    if not character then
        return
    end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        return
    end
    
    -- Create line tracer
    local lineTracer = Drawing.new("Line")
    lineTracer.Visible = false
    lineTracer.Color = Color3.new(1, 1, 1) -- White color for lines
    LineTracers[player] = lineTracer
    
    -- Create text label
    local textLabel = Drawing.new("Text")
    textLabel.Visible = false
    textLabel.Size = espTextSize
    TextLabels[player] = textLabel
    
    -- Update ESP
    local function updateESP()
        if character and character:IsDescendantOf(workspace) then
            local position = humanoidRootPart.Position
            local screenPosition, isVisible = Camera:WorldToViewportPoint(position)
            
            if isVisible then
                lineTracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                lineTracer.To = Vector2.new(screenPosition.X, screenPosition.Y)
                lineTracer.Visible = true
                
                -- Customize the text displayed (change this to suit your needs)
                textLabel.Text = player.Name .. " - Health: " .. humanoidRootPart.Parent.Humanoid.Health
                textLabel.Position = Vector2.new(screenPosition.X, screenPosition.Y - 30)
                textLabel.Visible = true
            else
                lineTracer.Visible = false
                textLabel.Visible = false
            end
        else
            lineTracer.Visible = false
            textLabel.Visible = false
        end
    end
    
    -- Connect the update function to the Heartbeat event
    local heartbeatConnection
    heartbeatConnection = RunService.Heartbeat:Connect(function()
        if character and character:IsDescendantOf(workspace) then
            updateESP()
        else
            heartbeatConnection:Disconnect()
            lineTracer.Visible = false
            lineTracer:Remove()
            LineTracers[player] = nil
            textLabel.Visible = false
            textLabel:Remove()
            TextLabels[player] = nil
        end
    end)
end

-- Create ESP for existing players
for _, player in ipairs(Players:GetPlayers()) do
    createESP(player)
end

-- Connect the PlayerAdded event to create ESP for new players
Players.PlayerAdded:Connect(createESP)

-- Clean up the ESP when a player leaves
Players.PlayerRemoving:Connect(function(player)
    local lineTracer = LineTracers[player]
    if lineTracer then
        lineTracer.Visible = false
        lineTracer:Remove()
        LineTracers[player] = nil
    end

    local textLabel = TextLabels[player]
    if textLabel then
        textLabel.Visible = false
        textLabel:Remove()
        TextLabels[player] = nil
    end
end)

-- Update line tracers and text labels
RunService.RenderStepped:Connect(function()
    for player, lineTracer in pairs(LineTracers) do
        local character = player.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                lineTracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                local position = humanoidRootPart.Position
                local screenPosition, isVisible = Camera:WorldToViewportPoint(position)
                if isVisible then
                    lineTracer.To = Vector2.new(screenPosition.X, screenPosition.Y)
                    lineTracer.Visible = true
                else
                    lineTracer.Visible = false
                end
            else
                lineTracer.Visible = false
            end
        else
            lineTracer.Visible = false
        end
    end

    for player, textLabel in pairs(TextLabels) do
        local character = player.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local position = humanoidRootPart.Position
                local screenPosition, isVisible = Camera:WorldToViewportPoint(position)
                
                if isVisible then
                    -- Customize the text displayed (change this to suit your needs)
                    textLabel.Text = player.Name .. " - Health: " .. humanoidRootPart.Parent.Humanoid.Health
                    textLabel.Position = Vector2.new(screenPosition.X, screenPosition.Y - 30)
                    textLabel.Visible = true
                else
                    textLabel.Visible = false
                end
            end
        else
            textLabel.Visible = false
        end
    end
end)

return {
    LineTracers = LineTracers,
    TextLabels = TextLabels
}
