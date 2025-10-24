local function newLabel(parent, text, size, color)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.Text = text or ""
    l.TextColor3 = color or Color3.new(1,1,1)
    l.Font = Enum.Font.GothamSemibold
    l.TextSize = size or 14
    l.Parent = parent
    return l
end

local StatusBar = {}
StatusBar.__index = StatusBar

function StatusBar.new(root, theme)
    local bar = Instance.new("Frame")
    bar.Name = "StatusBar"
    bar.Size = UDim2.new(1, 0, 0, 28)
    bar.Position = UDim2.new(0, 0, 0, 0)
    bar.BackgroundTransparency = 1
    bar.Parent = root

    local timeLabel = newLabel(bar, "", 16, theme:Get("text"))
    timeLabel.Size = UDim2.new(0, 100, 1, 0)
    timeLabel.Position = UDim2.new(0, 12, 0, 0)
    timeLabel.TextXAlignment = Enum.TextXAlignment.Left

    local right = Instance.new("Frame"); right.BackgroundTransparency = 1
    right.Size = UDim2.new(0, 160, 1, 0)
    right.Position = UDim2.new(1, -168, 0, 0)
    right.Parent = bar

    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    layout.VerticalAlignment = Enum.VerticalAlignment.Center
    layout.Padding = UDim.new(0, 8)
    layout.Parent = right

    local net = newLabel(right, "📶 LTE", 14, theme:Get("subtleText")); net.Size = UDim2.new(0, 60, 1, 0)
    local wifi = newLabel(right, "📡", 14, theme:Get("subtleText")); wifi.Size = UDim2.new(0, 20, 1, 0)
    local battery = newLabel(right, "🔋100%", 14, theme:Get("subtleText")); battery.Size = UDim2.new(0, 70, 1, 0)

    local function updateTime()
        local now = os.date("*t")
        timeLabel.Text = string.format("%02d:%02d", now.hour, now.min)
    end
    updateTime()
    task.spawn(function()
        while bar.Parent do updateTime(); task.wait(30) end
    end)

    return setmetatable({Frame = bar}, StatusBar)
end

return StatusBar