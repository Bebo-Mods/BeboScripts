for i, v in pairs(game.CoreGui:GetChildren()) do
	if string.find(v.Name, "Pathfinder") then
		v:Destroy()
	end
end

local function Select(part)
    local Select = Instance.new("Highlight", part)
    Select.Name = "Selection"
    Select.DepthMode = Enum.HighlightDepthMode.Occluded
    Select.OutlineColor = Color3.fromRGB(255, 255, 255)
    Select.FillColor = Color3.fromRGB(122, 178, 255)
    Select.FillTransparency = 0.5
    Select.OutlineTransparency = 0
end

local function RemoveSelection()
    for i,v in pairs(game:GetDescendants()) do 
        if v.Name == "Selection" and v:IsA("Highlight") then
            v:Destroy()
        end
    end
end

local Pathfinder = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ShadowFrame = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local PathContainer = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local CopyPath = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UIGradient_2 = Instance.new("UIGradient")
local info = Instance.new("TextLabel")
local UICorner_5 = Instance.new("UICorner")
local RemoveHighlight = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local Credits = Instance.new("TextLabel")
local UICorner_7 = Instance.new("UICorner")

--Properties:

Pathfinder.Name = "Pathfinder"
Pathfinder.Parent = game:WaitForChild("CoreGui")

MainFrame.Name = "MainFrame"
MainFrame.Parent = Pathfinder
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.311033905, 0, 0.180438459, 0)
MainFrame.Size = UDim2.new(0, 357, 0, 143)
MainFrame.ZIndex = 4

UICorner.CornerRadius = UDim.new(0.100000001, 0)
UICorner.Parent = MainFrame

ShadowFrame.Name = "ShadowFrame"
ShadowFrame.Parent = MainFrame
ShadowFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ShadowFrame.BorderSizePixel = 0
ShadowFrame.Position = UDim2.new(-0.0174758881, 0, -0.0392692909, 0)
ShadowFrame.Size = UDim2.new(0, 369, 0, 154)
ShadowFrame.ZIndex = 2

UICorner_2.CornerRadius = UDim.new(0.100000001, 0)
UICorner_2.Parent = ShadowFrame

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(144, 193, 255)), ColorSequenceKeypoint.new(0.41, Color3.fromRGB(201, 195, 255)), ColorSequenceKeypoint.new(0.58, Color3.fromRGB(232, 196, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(220, 147, 255))}
UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.34), NumberSequenceKeypoint.new(1.00, 0.27)}
UIGradient.Parent = ShadowFrame

PathContainer.Name = "PathContainer"
PathContainer.Parent = MainFrame
PathContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PathContainer.BackgroundTransparency = 0.100
PathContainer.BorderSizePixel = 0
PathContainer.Position = UDim2.new(0.0202575177, 0, 0.0935152471, 0)
PathContainer.Size = UDim2.new(0, 342, 0, 50)
PathContainer.ZIndex = 5
PathContainer.Font = Enum.Font.SourceSans
PathContainer.Text = "Part Path Here"
PathContainer.TextColor3 = Color3.fromRGB(0, 0, 0)
PathContainer.TextScaled = true
PathContainer.TextSize = 5.000
PathContainer.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0.100000001, 0)
UICorner_3.Parent = PathContainer

CopyPath.Name = "CopyPath"
CopyPath.Parent = MainFrame
CopyPath.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CopyPath.BackgroundTransparency = 0.250
CopyPath.BorderSizePixel = 0
CopyPath.Position = UDim2.new(0.0180722196, 0, 0.517907083, 0)
CopyPath.Size = UDim2.new(0, 160, 0, 40)
CopyPath.ZIndex = 5
CopyPath.Font = Enum.Font.SourceSans
CopyPath.Text = "Copy Path"
CopyPath.TextColor3 = Color3.fromRGB(0, 0, 0)
CopyPath.TextSize = 35.000
CopyPath.TextWrapped = true
CopyPath.MouseButton1Click:connect(function()
	setclipboard(PathContainer.Text)
end)


UICorner_4.CornerRadius = UDim.new(0.100000001, 0)
UICorner_4.Parent = CopyPath

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(144, 193, 255)), ColorSequenceKeypoint.new(0.41, Color3.fromRGB(201, 195, 255)), ColorSequenceKeypoint.new(0.58, Color3.fromRGB(232, 196, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(220, 147, 255))}
UIGradient_2.Parent = MainFrame

info.Name = "info"
info.Parent = MainFrame
info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
info.BackgroundTransparency = 1.000
info.BorderSizePixel = 0
info.Position = UDim2.new(0.135103464, 0, 0.855753005, 0)
info.Size = UDim2.new(0, 258, 0, 14)
info.ZIndex = 5
info.Font = Enum.Font.SourceSans
info.Text = "Hold shift then click the part you want"
info.TextColor3 = Color3.fromRGB(0, 0, 0)
info.TextScaled = true
info.TextSize = 5.000
info.TextWrapped = true

UICorner_5.CornerRadius = UDim.new(0.100000001, 0)
UICorner_5.Parent = info

RemoveHighlight.Name = "RemoveHighlight"
RemoveHighlight.Parent = MainFrame
RemoveHighlight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RemoveHighlight.BackgroundTransparency = 0.250
RemoveHighlight.BorderSizePixel = 0
RemoveHighlight.Position = UDim2.new(0.527876139, 0, 0.517907083, 0)
RemoveHighlight.Size = UDim2.new(0, 160, 0, 40)
RemoveHighlight.ZIndex = 5
RemoveHighlight.Font = Enum.Font.SourceSans
RemoveHighlight.Text = "Remove Selection"
RemoveHighlight.TextColor3 = Color3.fromRGB(0, 0, 0)
RemoveHighlight.TextScaled = true
RemoveHighlight.TextSize = 23.000
RemoveHighlight.TextWrapped = true
RemoveHighlight.MouseButton1Click:connect(function()
RemoveSelection()
end)

UICorner_6.CornerRadius = UDim.new(0.100000001, 0)
UICorner_6.Parent = RemoveHighlight

Credits.Name = "Credits"
Credits.Parent = MainFrame
Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1.000
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(-0.00215144642, 0, 0, 0)
Credits.Size = UDim2.new(0, 112, 0, 13)
Credits.ZIndex = 5
Credits.Font = Enum.Font.SourceSans
Credits.Text = "Made By: Bebo Mods"
Credits.TextColor3 = Color3.fromRGB(0, 0, 0)
Credits.TextScaled = true
Credits.TextSize = 5.000
Credits.TextWrapped = true

UICorner_7.CornerRadius = UDim.new(0.100000001, 0)
UICorner_7.Parent = Credits

-- Scripts:

local function MXWWD_fake_script() -- MainFrame.DragUI 
	local script = Instance.new('LocalScript', MainFrame)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (8); -- // The speed of the UI darg.
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(MXWWD_fake_script)()

local CurrentMouse = game.Players.LocalPlayer:GetMouse()
pcall(function()
	CurrentMouse.Button1Down:Connect(
		function()
			if CurrentMouse.Target and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
				PathContainer.Text = tostring(CurrentMouse.Target:GetFullName())
				if not CurrentMouse.Target:FindFirstChild("Selection") then
					Select(CurrentMouse.Target)
				end
			end
		end
	)
end)
