--====================================================
-- ===============  SET PHÔNG CHỮ  ===================
--====================================================
-- Chọn font bằng cách bấm nút trong tab "SET PHÔNG CHỮ"

local AUTHOR_NAME   = "shi wei"
local LOGO_ASSET_ID = 81821993306183
local DISCORD_LINK  = "https://discord.gg/VRUeqKfDq2"
local FACEBOOK_LINK = "https://www.facebook.com/share/1JBQN79NvP/"

-- Font mapping
local Fonts = {
    ["Georgia"]     = Enum.Font.Fantasy,
    ["Verdana"]     = Enum.Font.Roboto,
    ["Courier New"] = Enum.Font.Code,
    ["Helvetica"]   = Enum.Font.Gotham,
    ["Arial"]       = Enum.Font.Arial,
    ["Minecraft"]   = Enum.Font.Arcade,
}
local CurrentFont = Enum.Font.Gotham

--====================================================
-- ===============  AD SCRIPT  =======================
--====================================================

-- Load Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat task.wait() until game:IsLoaded()

-- Tạo cửa sổ
local Window = Fluent:CreateWindow({
    Title = "Thông Tin Script",
    SubTitle = "by " .. AUTHOR_NAME,
    TabWidth = 157,
    Size = UDim2.fromOffset(450, 300),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.End
})

--================ TAB SET PHÔNG CHỮ =================
local FontTab = Window:AddTab({ Title = "SET PHÔNG CHỮ" })
for name, font in pairs(Fonts) do
    FontTab:AddButton({
        Title = name,
        Description = "Chọn font " .. name,
        Callback = function()
            CurrentFont = font
            Fluent:Notify({
                Title = "Đã đổi font",
                Content = "Font hiện tại: " .. name,
                Duration = 3
            })
        end
    })
end

--================ TAB AD SCRIPT =====================
local InfoTab = Window:AddTab({ Title = "AD SCRIPT" })

-- Logo
local logo = Instance.new("ImageLabel")
logo.Image = "rbxassetid://" .. LOGO_ASSET_ID
logo.Size = UDim2.new(0, 100, 0, 100)
logo.Position = UDim2.new(0.5, -50, 0, 20)
logo.BackgroundTransparency = 1
logo.Parent = InfoTab.Section

-- Tên tác giả
local text = Instance.new("TextLabel")
text.Text = "Người tạo: " .. AUTHOR_NAME
text.Font = CurrentFont
text.TextSize = 20
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.Size = UDim2.new(1, -20, 0, 30)
text.Position = UDim2.new(0, 10, 0, 130)
text.BackgroundTransparency = 1
text.Parent = InfoTab.Section

-- Nút copy Discord
InfoTab:AddButton({
    Title = "Discord",
    Description = "Copy link Discord",
    Callback = function()
        setclipboard(DISCORD_LINK)
        Fluent:Notify({
            Title = "Đã copy",
            Content = "Link Discord đã được copy!",
            Duration = 3
        })
    end
})

-- Nút copy Facebook
InfoTab:AddButton({
    Title = "Facebook",
    Description = "Copy link Facebook",
    Callback = function()
        setclipboard(FACEBOOK_LINK)
        Fluent:Notify({
            Title = "Đã copy",
            Content = "Link Facebook đã được copy!",
            Duration = 3
        })
    end
})

--================ LOGO BẬT/TẮT GUI ==================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local ToggleButton = Instance.new("ImageButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(1, -60, 1, -60) -- góc dưới phải
ToggleButton.BackgroundTransparency = 1
ToggleButton.Image = "rbxassetid://" .. LOGO_ASSET_ID
ToggleButton.Parent = ScreenGui

local GuiVisible = true
ToggleButton.MouseButton1Click:Connect