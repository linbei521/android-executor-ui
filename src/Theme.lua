--[[
    Theme.lua
    Android 16 Material Design Theme
]]

local Theme = {
    Colors = {
        Primary = Color3.fromRGB(208, 188, 255),
        OnPrimary = Color3.fromRGB(55, 0, 179),
        PrimaryContainer = Color3.fromRGB(79, 55, 139),
        OnPrimaryContainer = Color3.fromRGB(234, 221, 255),
        
        Secondary = Color3.fromRGB(204, 194, 220),
        OnSecondary = Color3.fromRGB(51, 45, 65),
        SecondaryContainer = Color3.fromRGB(74, 68, 88),
        OnSecondaryContainer = Color3.fromRGB(232, 222, 248),
        
        Surface = Color3.fromRGB(28, 27, 31),
        SurfaceDim = Color3.fromRGB(20, 19, 23),
        SurfaceBright = Color3.fromRGB(54, 52, 58),
        OnSurface = Color3.fromRGB(230, 225, 229),
        OnSurfaceVariant = Color3.fromRGB(202, 196, 208),
        
        SurfaceContainerLowest = Color3.fromRGB(15, 14, 18),
        SurfaceContainerLow = Color3.fromRGB(31, 30, 34),
        SurfaceContainer = Color3.fromRGB(35, 34, 38),
        SurfaceContainerHigh = Color3.fromRGB(45, 44, 48),
        SurfaceContainerHighest = Color3.fromRGB(56, 54, 59),
        
        Outline = Color3.fromRGB(147, 143, 153),
        OutlineVariant = Color3.fromRGB(73, 69, 79),
        
        Error = Color3.fromRGB(242, 184, 181),
        OnError = Color3.fromRGB(105, 0, 5),
        ErrorContainer = Color3.fromRGB(147, 0, 10),
        OnErrorContainer = Color3.fromRGB(255, 218, 214),
    },
    
    Spacing = {
        None = 0,
        XXSmall = 2,
        XSmall = 4,
        Small = 8,
        Medium = 16,
        Large = 24,
        XLarge = 32,
        XXLarge = 48,
    },
    
    Radius = {
        None = 0,
        XSmall = 4,
        Small = 8,
        Medium = 12,
        Large = 16,
        XLarge = 28,
        Full = 9999,
    },
    
    Typography = {
        DisplayLarge = 57,
        DisplayMedium = 45,
        DisplaySmall = 36,
        HeadlineLarge = 32,
        HeadlineMedium = 28,
        HeadlineSmall = 24,
        TitleLarge = 22,
        TitleMedium = 16,
        TitleSmall = 14,
        BodyLarge = 16,
        BodyMedium = 14,
        BodySmall = 12,
        LabelLarge = 14,
        LabelMedium = 12,
        LabelSmall = 11,
    },
    
    Duration = {
        Short1 = 0.05,
        Short2 = 0.1,
        Short3 = 0.15,
        Short4 = 0.2,
        Medium1 = 0.25,
        Medium2 = 0.3,
        Medium3 = 0.35,
        Medium4 = 0.4,
        Long1 = 0.45,
        Long2 = 0.5,
        Long3 = 0.55,
        Long4 = 0.6,
    },
    
    Easing = {
        Standard = Enum.EasingStyle.Quad,
        Emphasized = Enum.EasingStyle.Quint,
        Decelerate = Enum.EasingStyle.Quart,
        Accelerate = Enum.EasingStyle.Cubic,
    }
}

return Theme
