local Theme = {}
Theme.__index = Theme

local tokensByStyle = {
    ios = {
        bg = Color3.fromRGB(10,10,12),
        surface = Color3.fromRGB(22,22,26),
        text = Color3.fromRGB(235,235,245),
        subtleText = Color3.fromRGB(174,174,178),
        accent = Color3.fromRGB(10,132,255),
    },
    android = {
        bg = Color3.fromRGB(18,18,18),
        surface = Color3.fromRGB(30,30,30),
        text = Color3.fromRGB(230,230,230),
        subtleText = Color3.fromRGB(180,180,180),
        accent = Color3.fromRGB(3,218,198),
    }
}

function Theme.new(style)
    local self = setmetatable({}, Theme)
    self.style = style
    self.tokens = tokensByStyle[style] or tokensByStyle.ios
    return self
end

function Theme:Get(k) return self.tokens[k] end

return Theme