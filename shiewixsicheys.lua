-- shiwei-v1.0.lua
-- Shi Wei X Sicheys - v1.0 -

-- ====== CẤU HÌNH ======
local TITLE = "Shi Wei X Sicheys - v1.0 -"
local AUTHOR = "shi wei"
local DISCORD_LINK  = "https://discord.gg/VRUeqKfDq2"
local FACEBOOK_LINK = "https://www.facebook.com/share/1JBQN79NvP/"

-- Bản đồ font
local fontMap = {
    ["Default (Gotham)"] = Enum.Font.Gotham,
    ["Minecraft (Arcade)"] = Enum.Font.Arcade,
    ["Đậm (GothamBlack)"] = Enum.Font.GothamBlack,
    ["Mảnh (SourceSansLight)"] = Enum.Font.SourceSansLight,
    ["Kỹ thuật số (Code)"] = Enum.Font.Code,
    ["Arial"] = Enum.Font.Arial,
    ["Roboto"] = Enum.Font.Roboto,
}

-- ====== LOAD ORION LIB ======
repeat task.wait() until game:IsLoaded()
local ok, OrionLib = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
end)
if not ok or not OrionLib then
    warn("Không tải được Orion UI library.")
    return
end

-- ====== FONT APPLY FUNCTIONS ======
local function setFontOnObject(obj, fontEnum)
    if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
        pcall(function() obj.Font = fontEnum end)
    end
end

local function applyFontToAll(fontEnum)
    for _, obj in pairs(game:GetDescendants()) do
        setFontOnObject(obj, fontEnum)
    end
end

local function watchForNewUI(fontEnum)
    local conn
    conn = game.DescendantAdded:Connect(function(d)
        setFontOnObject(d, fontEnum)
        for _, sub in pairs(d:GetDescendants()) do
            setFontOnObject(sub, fontEnum)
        end
    end)
    return conn
end

-- ====== CREATE WINDOW ======
local Window = OrionLib:MakeWindow({
    Name = TITLE,
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "ShiWeiXHub",
})

-- Tabs giống Speed Hub X
local HomeTab      = Window:MakeTab({Name = "Home", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local MainTab      = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local AutoTab      = Window:MakeTab({Name = "Automatically", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local InvTab       = Window:MakeTab({Name = "Inventory", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local ShopTab      = Window:MakeTab({Name = "Shop", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local WebhookTab   = Window:MakeTab({Name = "Webhook", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local MiscTab      = Window:MakeTab({Name = "Misc", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local SettingsTab  = Window:MakeTab({Name = "Settings", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local SettingsUITab= Window:MakeTab({Name = "Settings UI", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- ====== HOME: Font chọn ======
HomeTab:AddLabel("Author: " .. AUTHOR)

local watchConnection = nil
local currentFontEnum = Enum.Font.Gotham

for name, fontEnum in pairs(fontMap) do
    HomeTab:AddButton({
        Name = name,
        Callback = function()
            currentFontEnum = fontEnum
            applyFontToAll(fontEnum)
            if watchConnection then watchConnection:Disconnect() end
            watchConnection = watchForNewUI(fontEnum)
            OrionLib:MakeNotification({
                Name = "Font changed",
                Content = "Đã đổi font sang: " .. name,
                Time = 3
            })
        end
    })
end

HomeTab:AddButton({
    Name = "Stop auto apply",
    Callback = function()
        if watchConnection then
            watchConnection:Disconnect()
            watchConnection = nil
            OrionLib:MakeNotification({Name = "Stopped", Content = "Đã dừng auto apply font", Time = 3})
        end
    end
})

-- ====== WEBHOOK TAB ======
WebhookTab:AddLabel("Discord:")
WebhookTab:AddButton({Name = "Copy Discord Link", Callback = function()
    if setclipboard then pcall(setclipboard, DISCORD_LINK) end
    OrionLib:MakeNotification({Name = "Copied", Content = "Discord link đã copy", Time = 2})
end})
WebhookTab:AddLabel(DISCORD_LINK)

WebhookTab:AddLabel("Facebook:")
WebhookTab:AddButton({Name = "Copy Facebook Link", Callback = function()
    if setclipboard then pcall(setclipboard, FACEBOOK_LINK) end
    OrionLib:MakeNotification({Name = "Copied", Content = "Facebook link đã copy", Time = 2})
end})
WebhookTab:AddLabel(FACEBOOK_LINK)

-- ====== SETTINGS ======
SettingsTab:AddButton({Name = "Close GUI", Callback = function()
    OrionLib:Destroy()
end})

-- ====== INIT ======
applyFontToAll(currentFontEnum)
watchConnection = watchForNewUI(currentFontEnum)
OrionLib:Init()