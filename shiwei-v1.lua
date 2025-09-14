
--====================================================
--                 SHIWEI SCRIPT v1
--====================================================

-- Bạn có thể chọn 1 trong các font dưới đây:
-- Georgia      => Enum.Font.Fantasy
-- Verdana      => Enum.Font.Roboto
-- Courier New  => Enum.Font.Code
-- Helvetica    => Enum.Font.Gotham
-- Arial        => Enum.Font.Arial
-- Minecraft    => Enum.Font.Arcade

local MAIN_FONT = Enum.Font.Gotham

--====================================================
--                 AD SCRIPT
--====================================================

local AUTHOR_NAME = "shi wei"
local LOGO_ASSET_ID = "rbxassetid://81821993306183"

-- Tạo ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ShiweiGui"
ScreenGui.Parent = game:GetService("CoreGui")

-- Khung chính
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundTransparency = 0.3
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.Parent = ScreenGui

-- Logo
local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 100, 0, 100)
Logo.Position = UDim2.new(0, 10, 0, 10)
Logo.BackgroundTransparency = 1
Logo.Image = LOGO_ASSET_ID
Logo.Parent = Frame

-- Tên tác giả
local Author = Instance.new("TextLabel")
Author.Size = UDim2.new(0, 180, 0, 40)
Author.Position = UDim2.new(0, 120, 0, 10)
Author.BackgroundTransparency = 1
Author.Font = MAIN_FONT
Author.TextSize = 18
Author.TextColor3 = Color3.fromRGB(255,255,255)
Author.Text = "Author: "..AUTHOR_NAME
Author.Parent = Frame

-- Gợi ý đổi font (menu cơ bản)
local FontList = {"Fantasy","Roboto","Code","Gotham","Arial","Arcade"}

for i, fontName in ipairs(FontList) do
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 120, 0, 25)
    Btn.Position = UDim2.new(0, 120, 0, 40 + (i-1)*30)
    Btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Btn.TextColor3 = Color3.fromRGB(255,255,255)
    Btn.Font = Enum.Font[fontName]
    Btn.Text = fontName
    Btn.Parent = Frame

    Btn.MouseButton1Click:Connect(function()
        Author.Font = Enum.Font[fontName]
    end)
end
