_G.ToggleColor = Color3.fromRGB(0, 51, 255)
_G.SliderColor = Color3.fromRGB(0, 51, 255)
_G.ButtonColor = Color3.fromRGB(255, 34, 0)

local library = loadstring(game:HttpGet(("https://pastebin.com/raw/FsJak6AT")))() -- It's obfuscated, I won't let you see my ugly coding skills. =)

local w = library:CreateWindow("Beeface")

local b = w:CreateFolder("Functions")
b:Label("~Functions~", Color3.fromRGB(38, 38, 38), Color3.fromRGB(255, 34, 0))

b:Toggle(
    "Auto Convert Honey",
    function(bool)
        AutoSell = bool
    end
)

b:Slider(
    "BeeJumppower",
    10,
    300,
    true,
    function(value)
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = (value)
    end
)

b:Slider(
    "BeeSpeed",
    10,
    300,
    true,
    function(value)
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = (value)
    end
)
b:Button(
    "Inf Jump",
    function()
        game:GetService("UserInputService").JumpRequest:connect(
            function()
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        )
    end
)
b:Label("~Upgrades~", Color3.fromRGB(38, 38, 38), Color3.fromRGB(255, 34, 0))
b:Toggle(
    "Player Speed",
    function(bool)
        PlayerSpeed = bool
    end
)
b:Toggle(
    "Honey Conversion Rate",
    function(bool)
        HoneyConversion = bool
    end
)
b:Toggle(
    "Worker Speed",
    function(bool)
        WorkerSpeed = bool
    end
)
b:Toggle(
    "Worker Capacity",
    function(bool)
        WorkerCapacity = bool
    end
)

spawn(
    function()
        while wait() do
            if AutoSell then
                game.Workspace.Beehive.HitBox.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
)
-- Upgrades
spawn(
    function()
        while wait(.2) do
            if PlayerSpeed then
                game:GetService("ReplicatedStorage").UpgradeRequest:FireServer("speedMultiplierUpgrades")
            end
        end
    end
)

spawn(
    function()
        while wait(.2) do
            if HoneyConversion then
                game:GetService("ReplicatedStorage").UpgradeRequest:FireServer("honeyMultiplierUpgrades")
            end
        end
    end
)

spawn(
    function()
        while wait(.2) do
            if WorkerSpeed then
                game:GetService("ReplicatedStorage").UpgradeRequest:FireServer("workerSpeedUpgrades")
            end
        end
    end
)

spawn(
    function()
        while wait(.2) do
            if WorkerCapacity then
                game:GetService("ReplicatedStorage").UpgradeRequest:FireServer("workerCapacityUpgrades")
            end
        end
    end
)

local MISC = w:CreateFolder("Misc")

MISC:Button(
    "Rejoin",
    function()
        local TeleportService = game:GetService("TeleportService")
        local PlaceId = game.PlaceId
        local player = game.Players.LocalPlayer
        if player then
            TeleportService:Teleport(PlaceId, player)
        end
    end
)

MISC:GuiSettings()

local CS = w:CreateFolder("Credits")

CS:Label("Made By: Bebo Mods", Color3.fromRGB(38, 38, 38), Color3.fromRGB(255, 34, 0))
CS:Label("Discord Bebo Mods#1532", Color3.fromRGB(38, 38, 38), Color3.fromRGB(255, 34, 0))
CS:Label("YouTube Channel Bebo Mods", Color3.fromRGB(38, 38, 38), Color3.fromRGB(255, 34, 0))
CS:Label("Thanks For Using My Scripts", Color3.fromRGB(38, 38, 38), Color3.fromRGB(255, 34, 0))
CS:Button(
    "Discord Server Link",
    function()
        setclipboard("https://discord.gg/mTC5yP5ay8")
    end
)
CS:DestroyGUI()
