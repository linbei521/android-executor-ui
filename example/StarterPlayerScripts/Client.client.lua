-- 假设你把上面 src 目录作为 ModuleScripts 挂在 ReplicatedStorage/MobileOSUI
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UI = require(ReplicatedStorage:WaitForChild("MobileOSUI"))
local ui = UI.new({ style = "ios" })  -- "ios" 或 "android"