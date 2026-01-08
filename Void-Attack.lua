local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

if CoreGui:FindFirstChild("MaintenanceGui") then 
    CoreGui.MaintenanceGui:Destroy() 
end
if Lighting:FindFirstChild("MaintenanceBlur") then 
    Lighting.MaintenanceBlur:Destroy() 
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MaintenanceGui"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local Blur = Instance.new("BlurEffect")
Blur.Name = "MaintenanceBlur"
Blur.Size = 0
Blur.Parent = Lighting

TweenService:Create(Blur, TweenInfo.new(1), {Size = 24}):Play()

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 170, 255)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0.1, 0)
Title.BackgroundTransparency = 1
Title.Text = "UNDER MAINTENANCE"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 28
Title.Parent = MainFrame

local Desc = Instance.new("TextLabel")
Desc.Size = UDim2.new(0.9, 0, 0, 100)
Desc.Position = UDim2.new(0.05, 0, 0.35, 0)
Desc.BackgroundTransparency = 1
Desc.Text = "We are currently updating the system to improve your experience.\nPlease try again later."
Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
Desc.Font = Enum.Font.GothamMedium
Desc.TextSize = 16
Desc.TextWrapped = true
Desc.Parent = MainFrame

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Font = Enum.Font.GothamBlack
CloseButton.TextSize = 18
CloseButton.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    local closeTween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
    local blurTween = TweenService:Create(Blur, TweenInfo.new(0.3), {Size = 0})
    
    closeTween:Play()
    blurTween:Play()
    
    closeTween.Completed:Wait()
    
    ScreenGui:Destroy()
    Blur:Destroy()
end)

local openTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 250)})
openTween:Play()
