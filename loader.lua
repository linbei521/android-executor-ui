--[[
    Loader for Android 16 Executor UI
    
    使用方法:
    loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/android-executor-ui/main/loader.lua"))()
]]

local GITHUB_REPO = "YOUR_USERNAME/android-executor-ui"
local BRANCH = "main"
local BASE_URL = string.format("https://raw.githubusercontent.com/%s/%s/", GITHUB_REPO, BRANCH)

print("Loading Android 16 Executor UI...")

-- Load main script
local success, result = pcall(function()
    return loadstring(game:HttpGet(BASE_URL .. "src/Main.lua"))()
end)

if success then
    print("✓ Android 16 Executor UI loaded successfully!")
    _G.AndroidExecutorUI = result
else
    warn("✗ Failed to load UI:", result)
end