-- GUI Setup
local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "LuarmorKeyCheck"
gui.ResetOnSpawn = false

-- Main Frame with Shadow
-- Main Shadow (parented to frame for correct alignment)
local shadow = Instance.new("ImageLabel", frame)
shadow.Name = "Shadow"
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.85
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Size = UDim2.new(1, 10, 1, 10) -- Slightly larger than frame
shadow.Position = UDim2.new(0, -5, 0, -5) -- Centered behind the frame
shadow.BackgroundTransparency = 1
shadow.ZIndex = 0


local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 340, 0, 270)
frame.Position = UDim2.new(0.5, -170, 0.5, -135)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0

-- Round corners
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 8)

-- Close Button
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BackgroundTransparency = 1
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 24

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Title with divider
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 20, 0, 0)
title.Text = "Luarmor Key Checker"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left

local divider = Instance.new("Frame", frame)
divider.Size = UDim2.new(1, -40, 0, 1)
divider.Position = UDim2.new(0, 20, 0, 40)
divider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
divider.BorderSizePixel = 0

-- Key Input Box
local keyBox = Instance.new("TextBox", frame)
keyBox.Size = UDim2.new(1, -40, 0, 40)
keyBox.Position = UDim2.new(0, 20, 0, 60)
keyBox.PlaceholderText = "Paste your key here..."
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
keyBox.ClearTextOnFocus = false

local boxCorner = Instance.new("UICorner", keyBox)
boxCorner.CornerRadius = UDim.new(0, 6)

local boxPadding = Instance.new("UIPadding", keyBox)
boxPadding.PaddingLeft = UDim.new(0, 10)
boxPadding.PaddingRight = UDim.new(0, 10)

-- Check Button
local checkBtn = Instance.new("TextButton", frame)
checkBtn.Size = UDim2.new(1, -40, 0, 40)
checkBtn.Position = UDim2.new(0, 20, 0, 110)
checkBtn.Text = "CHECK KEY"
checkBtn.Font = Enum.Font.GothamBold
checkBtn.TextSize = 14
checkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
checkBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)

local btnCorner = Instance.new("UICorner", checkBtn)
btnCorner.CornerRadius = UDim.new(0, 6)

-- Button hover effects
checkBtn.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(checkBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 140, 255)}):Play()
end)

checkBtn.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(checkBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 120, 215)}):Play()
end)

-- Status Label
local statusLabel = Instance.new("TextLabel", frame)
statusLabel.Size = UDim2.new(1, -40, 0, 50)
statusLabel.Position = UDim2.new(0, 20, 0, 160)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Waiting for key..."
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextWrapped = true
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Bottom Buttons Container
local buttonContainer = Instance.new("Frame", frame)
buttonContainer.Size = UDim2.new(1, -40, 0, 40)
buttonContainer.Position = UDim2.new(0, 20, 1, -50)
buttonContainer.BackgroundTransparency = 1

-- Get Key Button
local getKeyBtn = Instance.new("TextButton", buttonContainer)
getKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
getKeyBtn.Position = UDim2.new(0, 0, 0, 0)
getKeyBtn.Text = "🔑 GET KEY"
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 14
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)

local getKeyCorner = Instance.new("UICorner", getKeyBtn)
getKeyCorner.CornerRadius = UDim.new(0, 6)

-- Discord Button
local discordBtn = Instance.new("TextButton", buttonContainer)
discordBtn.Size = UDim2.new(0.48, 0, 1, 0)
discordBtn.Position = UDim2.new(0.52, 0, 0, 0)
discordBtn.Text = "💬 DISCORD"
discordBtn.Font = Enum.Font.GothamBold
discordBtn.TextSize = 14
discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 161)

local discordCorner = Instance.new("UICorner", discordBtn)
discordCorner.CornerRadius = UDim.new(0, 6)

-- Button hover effects
getKeyBtn.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(getKeyBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 170, 120)}):Play()
end)

getKeyBtn.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(getKeyBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 150, 100)}):Play()
end)

discordBtn.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(discordBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(114, 137, 218)}):Play()
end)

discordBtn.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(discordBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(88, 101, 161)}):Play()
end)

-- Copy Utility
local function copyToClipboard(text)
    setclipboard(text)
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Copied!",
            Text = "Link copied to clipboard.",
            Duration = 3
        })
    end)
end

-- Get Key Button Functionality
getKeyBtn.MouseButton1Click:Connect(function()
    local originalText = getKeyBtn.Text
    getKeyBtn.Text = "GENERATING KEY..."
    
    -- Simulate delay for generating key
    wait(0.5)
    
    local keyLink = "https://ads.luarmor.net/get_key?for=WorkinkSh-HXXYFxyjQCrF"
    copyToClipboard(keyLink)
    
    statusLabel.Text = "✅ Key link copied to clipboard! Paste it in your browser."
    
    -- Reset button text after delay
    wait(1.5)
    getKeyBtn.Text = originalText
end)

-- Discord Button Functionality
discordBtn.MouseButton1Click:Connect(function()
    local discordLink = "https://discord.gg/DR2RdatRjc"
    copyToClipboard(discordLink)
    statusLabel.Text = "✅ Discord invite link copied to clipboard!"
end)

-- Luarmor Key Check Logic
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "43488db9f41e67de2d625415e2aa5566" -- Your Script ID

checkBtn.MouseButton1Click:Connect(function()
    local userKey = keyBox.Text
    if not userKey or #userKey < 32 then
        statusLabel.Text = "❌ Key is too short or empty. Please enter a valid key."
        return
    end
    
    statusLabel.Text = "🔍 Checking key validity..."
    
    local success, response = pcall(function()
        return api.check_key(userKey)
    end)

    if not success then
        statusLabel.Text = "⚠️ Error checking key. Please try again."
        return
    end

    if response.code == "KEY_VALID" then
        local timeLeft = response.data.auth_expire - os.time()
        local hoursLeft = math.floor(timeLeft / 3600)
        local minutesLeft = math.floor((timeLeft % 3600) / 60)
        statusLabel.Text = string.format("✅ Valid key! Time remaining: %dh %dm", hoursLeft, minutesLeft)
        getgenv().script_key = userKey
        wait(1)
        api.load_script()
        gui:Destroy()
    elseif response.code == "KEY_HWID_LOCKED" then
        statusLabel.Text = "🔒 Key is locked to another device. Reset via bot."
    elseif response.code == "KEY_INCORRECT" then
        statusLabel.Text = "❌ Invalid key. Please check and try again."
    elseif response.code == "KEY_EXPIRED" then
        statusLabel.Text = "⌛ Key has expired. Please renew your subscription."
    elseif response.code == "KEY_BANNED" then
        statusLabel.Text = "🚫 Key has been blacklisted. Contact support."
    else
        statusLabel.Text = "❗ Error: " .. (response.message or "Unknown error") .. " (Code: " .. response.code .. ")"
    end
end)

-- Make the window draggable
local UserInputService = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    shadow.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X - 5, startPos.Y.Scale, startPos.Y.Offset + delta.Y - 5)
end

frame.InputBegan:Connect(function(input)
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

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
