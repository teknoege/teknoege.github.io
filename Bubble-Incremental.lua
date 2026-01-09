local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local MainButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Size = UDim2.new(0, 180, 0, 70)
Frame.Position = UDim2.new(0, 15, 0.5, -35)
Frame.Active = true
Frame.Draggable = true
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

MainButton.Parent = Frame
MainButton.Size = UDim2.new(1, -20, 1, -20)
MainButton.Position = UDim2.new(0, 10, 0, 10)
MainButton.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
MainButton.Text = "Autofarm: OFF"
MainButton.TextColor3 = Color3.new(1,1,1)
MainButton.Font = Enum.Font.GothamBold
MainButton.TextSize = 18
MainButton.BorderSizePixel = 0
Instance.new("UICorner", MainButton).CornerRadius = UDim.new(0, 10)

CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0, 26, 0, 26)
CloseButton.Position = UDim2.new(1, -34, 0, 8)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1,1,1)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 16
CloseButton.BorderSizePixel = 0
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 8)

local running = false
local index = 0

MainButton.MouseButton1Click:Connect(function()
    running = not running
    MainButton.Text = running and "Autofarm: ON" or "Autofarm: OFF"
    MainButton.BackgroundColor3 = running and Color3.fromRGB(0, 230, 0) or Color3.fromRGB(0, 140, 255)
    
    if running then
        spawn(function()
            while running and wait(0) do
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local bubbles = workspace.Bubbles:GetChildren()
                    if #bubbles > 0 then
                        index = (index % #bubbles) + 1
                        pcall(function()
                            char.HumanoidRootPart.CFrame = bubbles[index].CFrame * CFrame.new(0, 3, 0)
                        end)
                    end
                end
            end
        end)
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    running = false
    ScreenGui:Destroy()
end)
