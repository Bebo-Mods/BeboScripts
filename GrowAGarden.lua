-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage").GameEvents
local player = Players.LocalPlayer
local backpack = player:FindFirstChild("Backpack")
local remote = ReplicatedStorage:FindFirstChild("Plant_RE")
local teleportBackPosition = nil

-- Feature Toggles
local autoCollect = false
local autoBuyAllSeeds = false
local autoBuySpecificSeed = false
local autoPlant = false
local autoWalkToPlant = false
local selectedSeedName = nil
local sellAtCount = 0
local sellInterval = 0
local sellWhenFull = false
local sellBasedOnSlider = false
local autoSell = false
local autoBuyRobuxSeeds = false

-- Please give credits if you gonna skid this


-- UI Setup
local LuxtLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Luxware-UI-Library/main/Source.lua"))()
local Window = LuxtLib.CreateWindow("Grow A Garden", 13537090934)

local mainTab = Window:Tab("Auto Farm", 11433532654)
local autoSection = mainTab:Section("Auto Shit")

autoSection:Toggle("Auto Collect", function(v) autoCollect = v end)
autoSection:Toggle("Auto Plant", function(v) autoPlant = v end)
autoSection:Toggle("Auto Walk To Plant", function(v) autoWalkToPlant = v end)

-- Seed Buying Section
local seedSection = mainTab:Section("Seed Buying")

seedSection:Toggle("Auto Buy/Dupe Robux Seeds", function(v)
	autoBuyRobuxSeeds = v
end)

seedSection:Toggle("Auto Buy All Seeds", function(v)
	autoBuyAllSeeds = v
end)

seedSection:Toggle("Auto Buy Selected Seed", function(v)
	autoBuySpecificSeed = v
end)

-- Selling Section
local sellSection = mainTab:Section("Selling")

sellSection:Toggle("Sell When Full (Max Backpack Space)", function(v)
	sellWhenFull = v
end)

sellSection:Toggle("Sell Based On Number of Fruits", function(v)
	sellBasedOnSlider = v
end)


sellSection:TextBox("Sell At Count", "Epic PlaceHolder", function(value)
	sellAtCount = tonumber(value)
end)

sellSection:Toggle("Auto Sell", function(v)
	autoSell = v
end)

-- Function to fetch available seed names
local function getAvailableSeedNames()
	local shopUI = player:FindFirstChild("PlayerGui"):FindFirstChild("Seed_Shop")
	if not shopUI then return {} end

	local names = {}
	local scroll = shopUI.Frame.ScrollingFrame
	for _, item in pairs(scroll:GetChildren()) do
		if item:IsA("Frame") and not item.Name:match("_Padding$") then
			table.insert(names, item.Name)
		end
	end
	return names
end

-- Populate the dropdown with dynamic seed names
task.spawn(function()
	repeat task.wait() until player:FindFirstChild("PlayerGui"):FindFirstChild("Seed_Shop")
	local names = getAvailableSeedNames()
	seedSection:DropDown("Choose Seed", names, function(choice)
		selectedSeedName = choice
	end)
end)

-- Get owned plot
local function getOwnedPlot()
	for _, plot in pairs(workspace.Farm:GetChildren()) do
		local important = plot:FindFirstChild("Important") or plot:FindFirstChild("Importanert")
		if important then
			local data = important:FindFirstChild("Data")
			if data and data:FindFirstChild("Owner") and data.Owner.Value == player.Name then
				return plot
			end
		end
	end
	return nil
end

-- Auto Collect
task.spawn(function()
	while task.wait(1) do
		if autoCollect then
			local plot = getOwnedPlot()
			local farm = plot and plot:FindFirstChild("Important"):FindFirstChild("Plants_Physical")
			if farm then
				for _, prompt in ipairs(farm:GetDescendants()) do
					if prompt:IsA("ProximityPrompt") then
						local playerRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
						if playerRoot then
							local dist = (playerRoot.Position - prompt.Parent.Parent.PrimaryPart.Position).Magnitude
							if dist <= 20 then
								prompt.Exclusivity = Enum.ProximityPromptExclusivity.AlwaysShow
								prompt.MaxActivationDistance = 100
								prompt.RequiresLineOfSight = false
								fireproximityprompt(prompt)
							elseif autoWalkToPlant then
								local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
								if humanoid then
                                    humanoid.Jump = true
									humanoid:MoveTo(prompt.Parent.Parent.PrimaryPart.Position + Vector3.new(0, 5, 0))
								end
							end
						end
					end
				end
			end
		end
	end
end)

-- Function to teleport and sell
local function teleportAndSell()
	local originalPosition = player.Character and player.Character.HumanoidRootPart.Position
	local tutorialPoint = workspace.Tutorial_Points:FindFirstChild("Tutorial_Point_2")
	
	if tutorialPoint then
		-- Save current position
		teleportBackPosition = originalPosition
		
		-- Teleport to Tutorial Point
		player.Character:SetPrimaryPartCFrame(tutorialPoint.CFrame)
        task.wait(.1)
		-- Fire the remote to sell
		ReplicatedStorage:FindFirstChild("Sell_Inventory"):FireServer()

		-- Teleport back to the original position
		task.wait(1)  -- Wait a moment before teleporting back
		if teleportBackPosition then
			player.Character:SetPrimaryPartCFrame(CFrame.new(teleportBackPosition))
		end
	end
end

-- Auto Sell based on different conditions
task.spawn(function()
	while task.wait() do
		if autoSell then
			local holdableCount = 0
			for _, item in ipairs(backpack:GetChildren()) do
				if item:GetAttribute("ITEM_TYPE") == "Holdable" then
					holdableCount = holdableCount + 1
				end
			end

			-- Sell When Full (Max Backpack Space)
			if sellWhenFull then
				local notificationUI = player:FindFirstChild("PlayerGui"):FindFirstChild("Top_Notification")
				local notificationFrame = notificationUI and notificationUI:FindFirstChild("Frame")
				local notification = notificationFrame and notificationFrame:FindFirstChild("Notification_UI")
				if notification and notification:GetAttribute("OG") == "Max backpack space! Go sell!" then
					teleportAndSell()  -- Trigger teleportation and selling
				end
			end

			-- Sell based on Slider value
			if sellBasedOnSlider and holdableCount >= sellAtCount then
				teleportAndSell()  -- Trigger teleportation and selling
			end
		end
	end
end)

-- Auto Buy Seeds
local function autoBuySeedsFunction()
	local shopUI = player:FindFirstChild("PlayerGui"):FindFirstChild("Seed_Shop")
	if not shopUI then return end

	local scroll = shopUI.Frame.ScrollingFrame
	for _, item in pairs(scroll:GetChildren()) do
		if item:IsA("Frame") and not item.Name:match("_Padding$") then
			local mainFrame = item:FindFirstChild("Main_Frame")
			if mainFrame then
				local stockTextLabel = mainFrame:FindFirstChild("Stock_Text")
				if stockTextLabel then
					local stock = tonumber(stockTextLabel.Text:match("X(%d+) Stock"))
					if stock and stock > 0 then
						-- Auto-buy all seeds
						if autoBuyAllSeeds then
							ReplicatedStorage:FindFirstChild("BuySeedStock"):FireServer(item.Name)
						end
						-- Auto-buy selected seed
						if autoBuySpecificSeed and selectedSeedName == item.Name then
							ReplicatedStorage:FindFirstChild("BuySeedStock"):FireServer(item.Name)
						end
					end
				end
			end
		end
	end
end

task.spawn(function()
	while task.wait(0.2) do
		if autoBuyAllSeeds or (autoBuySpecificSeed and selectedSeedName) then
			autoBuySeedsFunction()
		end
	end
end)

-- Find seed tool
local function findSeedTool()
	for _, item in ipairs(player.Character:GetChildren()) do
		if item:IsA("Tool") and item.Name:find("Seed") then
			local crop = item.Name:match("^(.-) Seed")
			return item, crop
		end
	end
	for _, item in ipairs(backpack:GetChildren()) do
		if item:IsA("Tool") and item.Name:find("Seed") then
			local crop = item.Name:match("^(.-) Seed")
			return item, crop
		end
	end
	return nil, nil
end

-- Auto Plant
task.spawn(function()
	while task.wait() do
		if autoPlant then
			local character = player.Character or player.CharacterAdded:Wait()
			local root = character:FindFirstChild("HumanoidRootPart")
			local pos = Vector3.new(math.floor(root.Position.X), 0.1, math.floor(root.Position.Z))
			local tool, seedType = findSeedTool()

			if tool and seedType then
				if tool.Parent == backpack then
					character:FindFirstChild("Humanoid"):EquipTool(tool)
					repeat task.wait() until tool.Parent == character
				end
				remote:FireServer(pos, seedType)
			end
		end
	end
end)

-- Auto Buy Robux Seeds
task.spawn(function()
	while task.wait(5) do
		if autoBuyRobuxSeeds then
			for i = 1, 5 do
                ReplicatedStorage.EasterShopService:FireServer("PurchaseSeed", i)
            end
		end
	end
end)

local creditsTab = Window:Tab("Credits",14202377267)
local cf = creditsTab:Section("Main Credits")
cf:Credit("Made By: BeboMods")
local cf1 = creditsTab:Section("UI Credits")
cf1:Credit("xHeptc: UI Library")
local cf2 = creditsTab:Section("Discord User")
cf2:Credit("bebomods")
