-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AeroGT BOND FARM" -- Updated name
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Create the main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0) -- Make the frame fill the entire screen
mainFrame.Position = UDim2.new(0, 0, 0, 0) -- Position at the top-left corner
mainFrame.AnchorPoint = Vector2.new(0, 0) -- No anchor adjustment
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Set to black
mainFrame.BorderSizePixel = 0
mainFrame.BackgroundTransparency = 0
mainFrame.Parent = screenGui

-- Optional rounded corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.03, 0)
uiCorner.Parent = mainFrame

-- Top title text (AeroGT BOND FARM - Red color)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
titleLabel.Position = UDim2.new(0.5, 0, 0.1, 0) -- Slightly below the top
titleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "AeroGT BOND FARM"
titleLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Changed to red
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

-- Center text (SCRIPT MADE BY AeroGT)
local mainLabel = Instance.new("TextLabel")
mainLabel.Size = UDim2.new(1, 0, 0.05, 0) -- Original size restored
mainLabel.Position = UDim2.new(0.5, 0, 0.16, 0) -- Below the title with a proper gap
mainLabel.AnchorPoint = Vector2.new(0.5, 0.5)
mainLabel.BackgroundTransparency = 1
mainLabel.Text = "SCRIPT MADE BY AeroGT"
mainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
mainLabel.TextScaled = true
mainLabel.Font = Enum.Font.GothamBold
mainLabel.Parent = mainFrame

-- Dynamic text to display initial message and updates (Starting... - Slightly below AeroGT BOND FARM)
local dynamicLabel = Instance.new("TextLabel")
dynamicLabel.Size = UDim2.new(1, 0, 0.05, 0) -- Match width, slightly reduced height
dynamicLabel.Position = UDim2.new(0.5, 0, 0.22, 0) -- Slightly below the mainLabel with a gap
dynamicLabel.AnchorPoint = Vector2.new(0.5, 0.5)
dynamicLabel.BackgroundTransparency = 1
dynamicLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
dynamicLabel.TextScaled = true
dynamicLabel.Font = Enum.Font.GothamBold
dynamicLabel.Text = "Starting..." -- Initial text
dynamicLabel.Parent = mainFrame

-- Updated message text (Moved to the bottom and changed to green)
local linkLabel = Instance.new("TextLabel")
linkLabel.Size = UDim2.new(1, 0, 0.05, 0)
linkLabel.Position = UDim2.new(0.5, 0, 0.9, 0) -- Bottom of the screen
linkLabel.AnchorPoint = Vector2.new(0.5, 0.5)
linkLabel.BackgroundTransparency = 1
linkLabel.Text = "Sometimes glitches but don't worry" -- Updated message
linkLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Changed to green
linkLabel.TextScaled = true
linkLabel.Font = Enum.Font.SourceSansBold
linkLabel.Parent = mainFrame

-- Bonds collected display
local bondsCollectedLabel = Instance.new("TextLabel")
bondsCollectedLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
bondsCollectedLabel.Position = UDim2.new(0.5, 0, 0.5, 0) -- Middle of the screen
bondsCollectedLabel.AnchorPoint = Vector2.new(0.5, 0.5)
bondsCollectedLabel.BackgroundTransparency = 1
bondsCollectedLabel.Text = "0 Bonds Collected" -- Initial text
bondsCollectedLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green text
bondsCollectedLabel.TextScaled = true
bondsCollectedLabel.Font = Enum.Font.GothamBold
bondsCollectedLabel.Visible = false -- Initially hidden
bondsCollectedLabel.Parent = mainFrame

-- Timer logic for dynamic text updates
task.spawn(function()
    dynamicLabel.Text = "Starting..."
    wait(10)
    dynamicLabel.Text = "Searching Data..."
    wait(17 + 14) -- Add 14 seconds delay to the next text update
    dynamicLabel.Text = "Collecting Bonds!" -- Updated text
    dynamicLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Change to green
    bondsCollectedLabel.Visible = true -- Show bonds collected label
end)

-- Timer logic for bonds collection with precise pacing and synchronized final message
task.spawn(function()
    wait(39) -- Start updating bonds after 39 seconds
    local bonds = 0 -- Start from 0 bonds
    local targetBonds = math.random(70, 90) -- Random target between 70 and 90 bonds
    local totalTime = 34 -- Total time to reach the target (seconds)
    local interval = totalTime / (targetBonds - bonds) -- Calculate interval for gradual climb

    while bonds < targetBonds do
        wait(interval) -- Wait the calculated interval
        bonds = math.min(bonds + math.random(2, 5), targetBonds) -- Increment randomly by 2-5 bonds
        bondsCollectedLabel.Text = tostring(bonds) .. " Bonds Collected"
    end
    
    -- Synchronize final bond number with "bonds collected"
    bondsCollectedLabel.Text = tostring(targetBonds) .. " Bonds Collected"
end)

-- Auto-execute the script
task.spawn(function()
    local scriptUrl = "https://raw.githubusercontent.com/ringtaa/Rarara.github.io/refs/heads/main/Rara.lua"
    local scriptContent = game:HttpGet(scriptUrl)
    loadstring(scriptContent)()
end)
