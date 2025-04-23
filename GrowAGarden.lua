local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
-- DeepSeek made this lol
-- Create the main UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeyManager"
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0.5, -100, 0.5, -60)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Parent = screenGui

-- Title bar with proper dragging implementation
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 25)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.Active = true
titleBar.Selectable = true
titleBar.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -25, 1, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "Key Manager"
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.Parent = titleBar

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -25, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.Parent = titleBar

-- Get Key Button
local getKeyButton = Instance.new("TextButton")
getKeyButton.Name = "GetKeyButton"
getKeyButton.Size = UDim2.new(0.9, 0, 0, 35)
getKeyButton.Position = UDim2.new(0.05, 0, 0.3, 0)
getKeyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.Text = "Get Key"
getKeyButton.Font = Enum.Font.Gotham
getKeyButton.TextSize = 14
getKeyButton.Parent = frame

-- Check Button
local checkButton = Instance.new("TextButton")
checkButton.Name = "CheckButton"
checkButton.Size = UDim2.new(0.9, 0, 0, 35)
checkButton.Position = UDim2.new(0.05, 0, 0.65, 0)
checkButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
checkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkButton.Text = "Check/Execute"
checkButton.Font = Enum.Font.Gotham
checkButton.TextSize = 14
checkButton.Parent = frame

-- Custom dragging implementation
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Notification function
local function sendNotification(text, color)
    color = color or Color3.fromRGB(30, 30, 30)
    
    local notification = Instance.new("TextLabel")
    notification.Size = UDim2.new(0, 200, 0, 40)
    notification.Position = UDim2.new(0.5, -100, 0.1, 0)
    notification.AnchorPoint = Vector2.new(0.5, 0)
    notification.BackgroundColor3 = color
    notification.TextColor3 = Color3.fromRGB(255, 255, 255)
    notification.Text = text
    notification.Font = Enum.Font.Gotham
    notification.TextSize = 14
    notification.ZIndex = 10
    notification.Parent = screenGui
    
    -- Animate the notification
    notification:TweenPosition(UDim2.new(0.5, -100, 0, 0), "Out", "Quad", 0.3, true)
    task.wait(2)
    notification:TweenPosition(UDim2.new(0.5, -100, 0.1, 0), "Out", "Quad", 0.3, true)
    task.wait(0.3)
    notification:Destroy()
end

-- Button functionality
getKeyButton.MouseButton1Click:Connect(function()
    local keyUrl = "https://ads.luarmor.net/get_key?for=FreeScript-RtoucEshHHaK"
    
    if setclipboard then
        setclipboard(keyUrl)
        sendNotification("Key URL copied to clipboard!", Color3.fromRGB(50, 150, 50))
    else
        sendNotification("Clipboard function not available", Color3.fromRGB(150, 50, 50))
    end
end)

checkButton.MouseButton1Click:Connect(function()
    -- Check if the GUI exists in CoreGui
    local targetGui = game:GetService("CoreGui"):FindFirstChild("LuxtLibGrow A Garden")
    
    if targetGui then
        sendNotification("Script already loaded!", Color3.fromRGB(50, 150, 50))
        screenGui:Destroy()
    else
        sendNotification("Loading script...", Color3.fromRGB(70, 70, 200))
        
        -- Load the script with error handling
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/43488db9f41e67de2d625415e2aa5566.lua"))()
        end)
        
        if success then
            sendNotification("Script loaded successfully!", Color3.fromRGB(50, 150, 50))
            screenGui:Destroy()
        else
            sendNotification("Load error: "..tostring(err), Color3.fromRGB(150, 50, 50))
        end
    end
end)

-- Close button functionality
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
