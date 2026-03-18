-- UI Setup
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0.5, -100, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(1, -20, 0, 40)
box.Position = UDim2.new(0, 10, 0, 10)
box.PlaceholderText = "Enter swing delay (0.2)"
box.Text = "0.2"
box.TextScaled = true

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(1, -20, 0, 40)
button.Position = UDim2.new(0, 10, 0, 60)
button.Text = "Start Auto Swing"
button.TextScaled = true

local running = false

button.MouseButton1Click:Connect(function()
    running = not running
    button.Text = running and "Stop Auto Swing" or "Start Auto Swing"

    while running do
        local delay = tonumber(box.Text) or 0.2
        task.wait(delay)

        local char = player.Character or player.CharacterAdded:Wait()
        local tool = char:FindFirstChildOfClass("Tool")

        if tool then
            pcall(function()
                tool:Activate()
            end)
        end
    end
end)
