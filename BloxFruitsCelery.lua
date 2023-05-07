local function Noclip()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        pcall(
            function()
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        )
    end
end
local function HitBox()
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart.Size ~= Vector3.new(20, 40, 20) then
            v.HumanoidRootPart.Transparency = 1
            v.HumanoidRootPart.Size = Vector3.new(20, 40, 20)
        end
    end
end
local function Hit()
    pcall(
        function()
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):Activate()
        end
    )
end

local player = game:GetService("Players").LocalPlayer
local chr = player.Character

local bVelocity = Instance.new("BodyVelocity")
bVelocity.MaxForce = Vector3.new()
bVelocity.Velocity = Vector3.new()
bVelocity.Name = "bV"
local bAngularVelocity = Instance.new("BodyAngularVelocity")
bAngularVelocity.AngularVelocity = Vector3.new()
bAngularVelocity.MaxTorque = Vector3.new()
bAngularVelocity.Name = "bAV"
bVelocity:Clone().Parent = chr.HumanoidRootPart
bAngularVelocity:Clone().Parent = chr.HumanoidRootPart
player.CharacterAdded:Connect(
    function(v)
        chr = v
        bVelocity:Clone().Parent = v:WaitForChild("HumanoidRootPart", 9e99)
        bAngularVelocity:Clone().Parent = v:WaitForChild("HumanoidRootPart", 9e99)
    end
)
local vim = game:service "VirtualInputManager"

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()
local OwO = library:Window("Blox Fruits")
OwO:Label("Made By: Bebo Mods", Color3.fromRGB(127, 143, 166))

OwO:Toggle(
    "Farm Area Mobs",
    false,
    function(bool121)
        ko1Mpb2s = bool121
    end
)
spawn(
    function()
        game:GetService("RunService").Stepped:connect(
            function()
                if ko1Mpb2s then
                    pcall(
                        function()
                            Noclip()
                            HitBox()
                            game:GetService("VirtualUser"):ClickButton1(Vector2.new(9e9, 9e9))
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if
                                    v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid").Health > 0 and
                                        game.Players.LocalPlayer:DistanceFromCharacter(v.PrimaryPart.Position) < 400
                                 then
                                    tween =
                                        game:GetService("TweenService"):Create(
                                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                                        TweenInfo.new(
                                            game.Players.LocalPlayer:DistanceFromCharacter(
                                                v:FindFirstChild("HumanoidRootPart").Position
                                            ) / 200
                                        ),
                                        {
                                            CFrame = CFrame.new(
                                                v.HumanoidRootPart.Position + Vector3.new(0, 11, 0),
                                                v.HumanoidRootPart.Position
                                            )
                                        }
                                    )

                                    tween:Play()
                                    chr = player.Character
                                    chr:FindFirstChild("HumanoidRootPart").bV.MaxForce =
                                        Vector3.new(1 / 0, 1 / 0, 1 / 0)
                                    chr:FindFirstChild("HumanoidRootPart").bAV.MaxTorque =
                                        Vector3.new(1 / 0, 1 / 0, 1 / 0)
                                    break
                                end
                            end
                        end
                    )
                else
                    pcall(
                        function()
                            chr:FindFirstChild("HumanoidRootPart").bV.MaxForce = Vector3.new()
                            chr:FindFirstChild("HumanoidRootPart").bAV.MaxTorque = Vector3.new()
                        end
                    )
                end
            end
        )
    end
)
local Places = {}

for i, v in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
    table.insert(Places, v.Name)
end

local dropdown =
    OwO:Dropdown(
    "Select Location",
    Places,
    function(PlaceName)
        for i, v in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
            if v.Name == PlaceName then
                tween =
                    game:GetService("TweenService"):Create(
                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                    TweenInfo.new(game.Players.LocalPlayer:DistanceFromCharacter(v.Position) / 150),
                    {
                        CFrame = CFrame.new(v.Position + Vector3.new(0, 30, 0), v.Position)
                    }
                )

                tween:Play()
            end
        end
    end
)
