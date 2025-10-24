local Players = game:GetService("Players")

local StatusBar = require(script.ui.StatusBar)
local HomeScreen = require(script.ui.HomeScreen)
local ControlCenter = require(script.ui.ControlCenter)
local Theme = require(script.core.Theme)
local WindowManager = require(script.core.WindowManager)

local UI = {}
UI.__index = UI

function UI.new(config)
    config = config or {}
    local self = setmetatable({}, UI)
    self.theme = Theme.new(config.style or "ios")

    local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    local root = Instance.new("ScreenGui")
    root.Name = "MobileOSUI"
    root.ResetOnSpawn = false
    root.IgnoreGuiInset = true
    root.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    root.Parent = playerGui
    self.root = root

    self.windowManager = WindowManager.new(root)
    self.statusBar = StatusBar.new(root, self.theme)
    self.home = HomeScreen.new(root, self.theme, function(appId)
        self.windowManager:open(appId)
    end)
    self.controlCenter = ControlCenter.new(root, self.theme)

    return self
end

function UI:Destroy()
    if self.root then self.root:Destroy() end
end

return UI
