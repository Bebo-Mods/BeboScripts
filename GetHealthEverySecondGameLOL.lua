for i, v in pairs(game.CoreGui:GetChildren()) do
    if v:FindFirstChild("Top") then
        v:Destroy()
    end
end
wait(1)
local library =
    loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/0x"))()

local w1 = library:Window("ToraIsAMadBitch") -- Text

w1:Label("~Functions~") -- Text
w1:Label("ToraIs {DUMB}")
w1:Button(
    "Copy Discord Link",
    function()
        setclipboard("https://discord.gg/HuKZaAFHK3")
    end
)

w1:Toggle(
    "Auto Rebirth",
    "frz",
    false,
    function(toggled1)
        AutoRebirth = toggled1
    end
)

spawn(
    function()
        while wait(1) do
            if AutoRebirth then
                pcall(
                    function()
                        game.ReplicatedStorage.RebirthEvent:FireServer()
                    end
                )
            end
        end
    end
)

w1:Toggle(
    "Auto Win",
    "frz",
    false,
    function(toggled3)
        AutoWin = toggled3
    end
)

spawn(
    function()
        while wait() do
            if AutoWin then
                pcall(
                    function()
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Wins.Bridge, 0) --0 is touch
                        wait()
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Wins.Bridge, 1) -- 1 is untouch
                    end
                )
            end
        end
    end
)
w1:Label("Tora Is A Salty Bitch")

w1:Button(
    "Get All Gear",
    function()
        for k, v in pairs(game:GetService("ReplicatedStorage").Gears:GetChildren()) do
            game:GetService("ReplicatedStorage").GearShop.Purchase:FireServer(1, v.Name, "Gears")
        end
    end
)
w1:Label("~Misc~") -- Text

w1:Slider(
    "WalkSpeed",
    "WS",
    16,
    300,
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
) -- Text, Flag, Minimum, Maximum, Callback, Default (Optional), Flag Location (Optional)

w1:Slider(
    "JumpPower",
    "JP",
    50,
    300,
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end,
    100
) -- Text, Flag, Minimum, Maximum, Callback, Default (Optional), Flag Location (Optional)

w1:Button(
    "Destroy GUI",
    function()
        for i, v in pairs(game.CoreGui:GetChildren()) do
            if v:FindFirstChild("Top") then
                v:Destroy()
            end
        end
    end
) -- Text, Callback
w1:Label("~Credits~") -- Text

w1:Label("Bebo Mods") -- Text
