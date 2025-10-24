--[[
    Util.lua
    Utility functions for UI creation
]]

local Util = {}

-- Create instance with properties
function Util.Create(className, properties)
    local instance = Instance.new(className)
    
    for prop, value in pairs(properties or {}) do
        if prop ~= "Parent" then
            instance[prop] = value
        end
    end
    
    if properties and properties.Parent then
        instance.Parent = properties.Parent
    end
    
    return instance
end

-- Create UIPadding
function Util.Padding(parent, padding)
    local p = Instance.new("UIPadding")
    
    if type(padding) == "number" then
        p.PaddingTop = UDim.new(0, padding)
        p.PaddingBottom = UDim.new(0, padding)
        p.PaddingLeft = UDim.new(0, padding)
        p.PaddingRight = UDim.new(0, padding)
    elseif type(padding) == "table" then
        p.PaddingTop = UDim.new(0, padding.Top or padding[1] or 0)
        p.PaddingRight = UDim.new(0, padding.Right or padding[2] or 0)
        p.PaddingBottom = UDim.new(0, padding.Bottom or padding[3] or 0)
        p.PaddingLeft = UDim.new(0, padding.Left or padding[4] or 0)
    end
    
    p.Parent = parent
    return p
end

-- Create UICorner
function Util.Corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    c.Parent = parent
    return c
end

-- Create UIStroke (for outlines)
function Util.Stroke(parent, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color
    s.Thickness = thickness or 1
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

return Util