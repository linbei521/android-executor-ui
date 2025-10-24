--[[
    Main.lua
    Android 16 Executor UI - Main Entry
    
    Stage 1: Foundation Test
]]

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

-- Module loader for GitHub
local function LoadModule(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    
    if success then
        return result
    else
        warn("Failed to load module:", url, result)
        return nil
    end
end

-- For local testing, we'll embed the modules
-- In production, replace with LoadModule(github_url)

local Theme = {
    Colors = {
        Primary = Color3.fromRGB(208, 188, 255),
        OnPrimary = Color3.fromRGB(55, 0, 179),
        PrimaryContainer = Color3.fromRGB(79, 55, 139),
        OnPrimaryContainer = Color3.fromRGB(234, 221, 255),
        Surface = Color3.fromRGB(28, 27, 31),
        SurfaceContainer = Color3.fromRGB(35, 34, 38),
        OnSurface = Color3.fromRGB(230, 225, 229),
    },
    Spacing = { Small = 8, Medium = 16, Large = 24 },
    Radius = { Medium = 12, Large = 16 },
    Typography = { HeadlineMedium = 28, BodyLarge = 16 },
}

local Util = {
    Create = function(class, props)
        local obj = Instance.new(class)
        for k, v in pairs(props or {}) do
            if k ~= "Parent" then obj[k] = v end
        end
        if props.Parent then obj.Parent = props.Parent end
        return obj
    end,
    
    Padding = function(parent, pad)
        local p = Instance.new("UIPadding")
        p.PaddingTop = UDim.new(0, pad)
        p.PaddingBottom = UDim.new(0, pad)
        p.PaddingLeft = UDim.new(0, pad)
        p.PaddingRight = UDim.new(0, pad)
        p.Parent = parent
        return p
    end,
    
    Corner = function(parent, radius)
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, radius)
        c.Parent = parent
        return c
    end
}

-- Main UI Class
local ExecutorUI = {}
ExecutorUI.__index = ExecutorUI

function ExecutorUI.new()
    local self = setmetatable({}, ExecutorUI)
    self:Initialize()
    return self
end

function ExecutorUI:Initialize()
    -- Remove existing UI if present
    local existing = Players.LocalPlayer.PlayerGui:FindFirstChild("AndroidExecutorUI")
    if existing then
        existing:Destroy()
    end
    
    -- Create ScreenGui
    self.ScreenGui = Util.Create("ScreenGui", {
        Name = "AndroidExecutorUI",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = Players.LocalPlayer.PlayerGui
    })
    
    -- Create test window
    self:CreateTestWindow()
    
    print("✓ Android 16 Executor UI - Stage 1 Loaded")
end

function ExecutorUI:CreateTestWindow()
    -- Main container
    local window = Util.Create("Frame", {
        Name = "MainWindow",
        Size = UDim2.new(0, 500, 0, 350),
        Position = UDim2.new(0.5, -250, 0.5, -175),
        BackgroundColor3 = Theme.Colors.Surface,
        BorderSizePixel = 0,
        Parent = self.ScreenGui
    })
    Util.Corner(window, Theme.Radius.Large)
    
    -- Title bar
    local titleBar = Util.Create("Frame", {
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 60),
        BackgroundColor3 = Theme.Colors.PrimaryContainer,
        BorderSizePixel = 0,
        Parent = window
    })
    Util.Corner(titleBar, Theme.Radius.Large)
    
    local title = Util.Create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(1, -32, 1, 0),
        Position = UDim2.new(0, 16, 0, 0),
        BackgroundTransparency = 1,
        Text = "Android 16 Executor",
        TextColor3 = Theme.Colors.OnPrimaryContainer,
        Font = Enum.Font.GothamBold,
        TextSize = Theme.Typography.HeadlineMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = titleBar
    })
    
    -- Status area
    local statusContainer = Util.Create("Frame", {
        Name = "Status",
        Size = UDim2.new(1, -32, 1, -92),
        Position = UDim2.new(0, 16, 0, 76),
        BackgroundColor3 = Theme.Colors.SurfaceContainer,
        BorderSizePixel = 0,
        Parent = window
    })
    Util.Corner(statusContainer, Theme.Radius.Medium)
    Util.Padding(statusContainer, Theme.Spacing.Medium)
    
    local statusText = Util.Create("TextLabel", {
        Name = "StatusText",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "✓ Stage 1: Foundation Complete\n\n• Theme System: Loaded\n• Android 16 Material You Colors\n• UI Framework: Ready\n\nStatus: Operational",
        TextColor3 = Theme.Colors.OnSurface,
        Font = Enum.Font.Gotham,
        TextSize = Theme.Typography.BodyLarge,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        Parent = statusContainer
    })
    
    self.Window = window
end

function ExecutorUI:Destroy()
    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
end

-- Create and return instance
return ExecutorUI.new()