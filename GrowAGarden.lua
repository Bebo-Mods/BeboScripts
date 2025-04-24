-- GUI Setup
local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "LuarmorKeyCheck"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 230)
frame.Position = UDim2.new(0.5, -160, 0.5, -115)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Luarmor Key Checker"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18

local keyBox = Instance.new("TextBox", frame)
keyBox.Size = UDim2.new(0.9, 0, 0, 30)
keyBox.Position = UDim2.new(0.05, 0, 0, 50)
keyBox.PlaceholderText = "Paste your key here"
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 16
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.BackgroundColor3 = Color3.fromRGB(55, 55, 55)

local checkBtn = Instance.new("TextButton", frame)
checkBtn.Size = UDim2.new(0.9, 0, 0, 30)
checkBtn.Position = UDim2.new(0.05, 0, 0, 90)
checkBtn.Text = "Check Key"
checkBtn.Font = Enum.Font.GothamBold
checkBtn.TextSize = 16
checkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
checkBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)

local statusLabel = Instance.new("TextLabel", frame)
statusLabel.Size = UDim2.new(0.9, 0, 0, 30)
statusLabel.Position = UDim2.new(0.05, 0, 0, 130)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Waiting..."
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextWrapped = true

-- Luarmor Key Check Logic
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "43488db9f41e67de2d625415e2aa5566" -- Your Script ID

checkBtn.MouseButton1Click:Connect(function()
	local userKey = keyBox.Text
	if not userKey or #userKey < 32 then
		statusLabel.Text = "❌ Key is too short or empty."
		return
	end

	local success, response = pcall(function()
		return api.check_key(userKey)
	end)

	if not success then
		statusLabel.Text = "⚠️ Error checking key."
		return
	end

	if response.code == "KEY_VALID" then
		statusLabel.Text = "✅ Valid! Seconds left: " .. (response.data.auth_expire - os.time())
		getgenv().script_key = userKey
		wait(1)
		api.load_script()

	elseif response.code == "KEY_HWID_LOCKED" then
		statusLabel.Text = "🔒 Key is locked to another HWID. Reset via bot."

	elseif response.code == "KEY_INCORRECT" then
		statusLabel.Text = "❌ Key is incorrect or deleted."

	elseif response.code == "KEY_EXPIRED" then
		statusLabel.Text = "⌛ Key expired. Please get a new one."

	elseif response.code == "KEY_BANNED" then
		statusLabel.Text = "🚫 Key has been blacklisted."

	else
		statusLabel.Text = "❗ Error: " .. response.message .. " (Code: " .. response.code .. ")"
	end
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

-- Get Key Button
local getKeyBtn = Instance.new("TextButton", frame)
getKeyBtn.Size = UDim2.new(0.425, 0, 0, 30)
getKeyBtn.Position = UDim2.new(0.05, 0, 0, 170)
getKeyBtn.Text = "🔑 Get Key"
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 14
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 127)

getKeyBtn.MouseButton1Click:Connect(function()
	local keyLink = "https://ads.luarmor.net/get_key?for=FreeScript-RtoucEshHHaK"
	copyToClipboard(keyLink)
end)

-- Discord Button
local discordBtn = Instance.new("TextButton", frame)
discordBtn.Size = UDim2.new(0.425, 0, 0, 30)
discordBtn.Position = UDim2.new(0.525, 0, 0, 170)
discordBtn.Text = "💬 Discord"
discordBtn.Font = Enum.Font.GothamBold
discordBtn.TextSize = 14
discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
discordBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 218)

discordBtn.MouseButton1Click:Connect(function()
	local discordLink = "https://discord.gg/DR2RdatRjc" -- Replace with your actual link
	copyToClipboard(discordLink)
end)
