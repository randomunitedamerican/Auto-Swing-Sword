-- Universal Tool Auto-Clicker
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")

-- Protect UI from basic detection
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "UniversalClicker"

ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleButton.Position = UDim2.new(0.05, 0, 0.4, 0) -- Left side of screen
ToggleButton.Size = UDim2.new(0, 120, 0, 40)
ToggleButton.Text = "AutoClick: OFF"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Draggable = true

local active = false

ToggleButton.MouseButton1Click:Connect(function()
    active = not active
    ToggleButton.Text = active and "AutoClick: ON" or "AutoClick: OFF"
    ToggleButton.BackgroundColor3 = active and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(40, 40, 40)
end)

-- Automation Loop
task.spawn(function()
    while true do
        if active then
            local char = game.Players.LocalPlayer.Character
            local tool = char and char:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate() -- Works for any swingable/clickable tool
            end
        end
        -- Random delay between 0.1 and 0.15 seconds to bypass detection
        task.wait(math.random(10, 15) / 100) 
    end
end)
