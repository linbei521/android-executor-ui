local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local function newToggle(parent, labelText, theme)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 120, 0, 56)
    frame.BackgroundColor3 = theme:Get("surface")
    frame.Parent = parent
    local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 14); corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Text = labelText; label.TextColor3 = theme:Get("text")
    label.Font = Enum.Font.Gotham; label.TextSize = 14
    label.BackgroundTransparency = 1; label.Size = UDim2.new(1, -20, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0); label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 16, 0, 16)
    indicator.Position = UDim2.new(1, -24, 0.5, -8)
    indicator.BackgroundColor3 = theme:Get("accent")
    indicator.Parent = frame
    local indCorner = Instance.new("UICorner"); indCorner.CornerRadius = UDim.new(1, 0); indCorner.Parent = indicator

    local on = false
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            on = not on
            indicator.BackgroundColor3 = on and theme:Get("accent") or Color3.fromRGB(120,120,120)
        end
    end)

    return frame
end

local ControlCenter = {}
ControlCenter.__index = ControlCenter

function ControlCenter.new(root, theme)
    local panel = Instance.new("Frame")
    panel.Name = "ControlCenter"
    panel.Size = UDim2.new(1, 0, 0.55, 0)
    panel.Position = UDim2.new(0, 0, -0.55, 0)
    panel.BackgroundColor3 = theme:Get("surface")
    panel.BackgroundTransparency = 0.1
    panel.ZIndex = 50
    panel.Parent = root

    local layout = Instance.new("UIGridLayout")
    layout.CellSize = UDim2.new(0, 150, 0, 56)
    layout.CellPadding = UDim2.new(0, 12, 0, 12)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Top
    layout.Parent = panel

    newToggle(panel, "Wi‑Fi", theme)
    newToggle(panel, "蓝牙", theme)
    newToggle(panel, "飞行模式", theme)
    newToggle(panel, "勿扰模式", theme)

    -- 下拉显示/上推隐藏（简单手势）
    local dragging = false
    local startY = 0
    panel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; startY = input.Position.Y
        end
    end)
    panel.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            if panel.Position.Y.Scale < -0.3 then
                TweenService:Create(panel, TweenInfo.new(0.2), {Position = UDim2.new(0,0,-0.55,0)}):Play()
            else
                TweenService:Create(panel, TweenInfo.new(0.2), {Position = UDim2.new(0,0,0,0)}):Play()
            end
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.Touch then
            local viewport = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.Y or 800
            local dy = (input.Position.Y - startY) / viewport
            local y = math.clamp(-0.55 + dy, -0.55, 0)
            panel.Position = UDim2.new(0, 0, y, 0)
        end
    end)

    return setmetatable({Frame = panel}, ControlCenter)
end

return ControlCenter