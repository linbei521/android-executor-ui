local TweenService = game:GetService("TweenService")

local WindowManager = {}
WindowManager.__index = WindowManager

function WindowManager.new(root)
    local self = setmetatable({}, WindowManager)
    self.root = root
    self.windows = {}
    return self
end

function WindowManager:register(appId, frame)
    self.windows[appId] = frame
end

function WindowManager:open(appId)
    local frame = self.windows[appId]
    if not frame then return end
    frame.Visible = true
    frame.ZIndex = 100
    TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(1,0,1,0), Position = UDim2.new(0,0,0,0), BackgroundTransparency = 0
    }):Play()
end

function WindowManager:close(appId)
    local frame = self.windows[appId]
    if not frame then return end
    TweenService:Create(frame, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
    task.delay(0.16, function() frame.Visible = false end)
end

return WindowManager