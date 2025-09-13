
--====================================================
-- ===============  SET PHÔNG CHỮ  ===================
--====================================================
-- Bạn có thể chọn 1 trong các font dưới đây
-- Georgia     => Enum.Font.Fantasy
-- Verdana     => Enum.Font.Roboto
-- Courier New => Enum.Font.Code
-- Helvetica   => Enum.Font.Gotham
-- Arial       => Enum.Font.Arial
-- Minecraft   => Enum.Font.Arcade

local MAIN_FONT = Enum.Font.Gotham -- 👈 Đổi font ở đây


--====================================================
-- ===============  AD SCRIPT  =======================
--====================================================

local AUTHOR_NAME = "shi wei"
local LOGO_ASSET_ID = 14903003234

-- Link
local DISCORD_LINK = "https://discord.gg/VRUeqKfDq2"
local FACEBOOK_LINK = "https://www.facebook.com/share/1JBQN79NvP/"

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CreatorBadge"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Khung chính (dùng ảnh logo làm nền)
local frame = Instance.new("ImageLabel")
frame.Size = UDim2.new(0, 320, 0, 200)
frame.Position = UDim2.new(0.5, -160, 0, 50)
frame.BackgroundTransparency = 1
frame.Image = "rbxassetid://" .. LOGO_ASSET_ID
frame.ImageTransparency = 0.3 -- 👈 chỉnh độ mờ (0.2 = 20%, 0.4 = 40%)
frame.Parent = screenGui

-- Logo (hiển thị rõ ràng ở trên nền)
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 80, 0, 80)
logo.Position = UDim2.new(0.5, -40, 0, 10)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://" .. LOGO_ASSET_ID
logo.Parent = frame

-- Tên tác giả
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -20, 0, 30)
text.Position = UDim2.new(0, 10, 0, 100)
text.BackgroundTransparency = 1
text.Text = AUTHOR_NAME
text.Font = MAIN_FONT
text.TextSize = 22
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.Parent = frame

-- Link Discord
local discord = Instance.new("TextLabel")
discord.Size = UDim2.new(1, -20, 0, 25)
discord.Position = UDim2.new(0, 10, 0, 135)
discord.BackgroundTransparency = 1
discord.Text = "Discord: " .. DISCORD_LINK
discord.Font = MAIN_FONT
discord.TextSize = 18
discord.TextColor3 = Color3.fromRGB(0, 170, 255)
discord.Parent = frame

-- Link Facebook
local fb = Instance.new("TextLabel")
fb.Size = UDim2.new(1, -20, 0, 25)
fb.Position = UDim2.new(0, 10, 0, 165)
fb.BackgroundTransparency = 1
fb.Text = "Facebook: " .. FACEBOOK_LINK
fb.Font = MAIN_FONT
fb.TextSize = 18
fb.TextColor3 = Color3.fromRGB(0, 200, 0)
fb.Parent = frame
