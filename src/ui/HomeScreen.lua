local function newTextButton(parent, text, theme)
    local btn = Instance.new("TextButton")
    btn.BackgroundColor3 = theme:Get("surface")
    btn.Text = text
    btn.TextColor3 = theme:Get("text")
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 12
    btn.AutoButtonColor = true
    btn.Parent = parent
    local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 16); corner.Parent = btn
    return btn
end

local HomeScreen = {}
HomeScreen.__index = HomeScreen

function HomeScreen.new(root, theme, onAppPressed)
    local page = Instance.new("Frame")
    page.Name = "Home"
    page.Size = UDim2.new(1, 0, 1, -28)
    page.Position = UDim2.new(0, 0, 0, 28)
    page.BackgroundColor3 = theme:Get("bg")
    page.Parent = root

    local grid = Instance.new("UIGridLayout")
    grid.CellSize = UDim2.new(0, 80, 0, 80)
    grid.CellPadding = UDim2.new(0, 12, 0, 12)
    grid.FillDirectionMaxCells = 4
    grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
    grid.VerticalAlignment = Enum.VerticalAlignment.Top
    grid.Parent = page

    local apps = {
        { id = "settings", name = "设置" },
        { id = "gallery",  name = "相册" },
        { id = "music",    name = "音乐" },
        { id = "clock",    name = "时钟" },
        { id = "notes",    name = "备忘录" },
        { id = "browser",  name = "浏览器" },
        { id = "store",    name = "商店" },
        { id = "calc",     name = "计算器" },
    }

    for i, app in ipairs(apps) do
        local icon = newTextButton(page, app.name, theme)
        icon.Size = UDim2.new(0, 72, 0, 72)
        icon.LayoutOrder = i
        icon.MouseButton1Click:Connect(function()
            if onAppPressed then onAppPressed(app.id) end
        end)
    end

    local dock = Instance.new("Frame")
    dock.Name = "Dock"
    dock.Size = UDim2.new(1, 0, 0, 84)
    dock.Position = UDim2.new(0, 0, 1, -96)
    dock.BackgroundColor3 = theme:Get("surface")
    dock.BackgroundTransparency = 0.25
    dock.Parent = page
    local dockCorner = Instance.new("UICorner"); dockCorner.CornerRadius = UDim.new(0, 24); dockCorner.Parent = dock

    local dockLayout = Instance.new("UIListLayout")
    dockLayout.FillDirection = Enum.FillDirection.Horizontal
    dockLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    dockLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    dockLayout.Padding = UDim.new(0, 16)
    dockLayout.Parent = dock

    local function addDock(name, id)
        local btn = newTextButton(dock, name, theme)
        btn.Size = UDim2.new(0, 64, 0, 64)
        btn.MouseButton1Click:Connect(function()
            if onAppPressed then onAppPressed(id or name) end
        end)
    end

    addDock("电话", "phone"); addDock("信息", "messages")
    addDock("相机", "camera"); addDock("浏览器", "browser")

    return setmetatable({Frame = page}, HomeScreen)
end

return HomeScreen