
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Shi Wei X Sicheys - v1.0 -",
    LoadingTitle = "Shi Wei Hub",
    LoadingSubtitle = "by shi wei",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "ShiweiHub",
       FileName = "shiwei-v1.0"
    }
})

-- Tab Home
local HomeTab = Window:CreateTab("Home", 4483362458)
HomeTab:CreateParagraph({Title = "Author", Content = "shi wei"})
HomeTab:CreateButton({
    Name = "Discord Invite",
    Callback = function()
        setclipboard("https://discord.gg/VRUeqKfDq2")
        Rayfield:Notify({Title="Copied", Content="Discord link đã copy!", Duration=4})
    end
})

-- Tab Settings UI (đổi font toàn game)
local SettingsTab = Window:CreateTab("Settings UI", 4483362458)

local Fonts = {
    ["Default (Gotham)"] = Enum.Font.Gotham,
    ["Minecraft (Arcade)"] = Enum.Font.Arcade,
    ["Đậm (GothamBlack)"] = Enum.Font.GothamBlack,
    ["Mảnh (SourceSansLight)"] = Enum.Font.SourceSansLight,
    ["Kỹ thuật số (Code)"] = Enum.Font.Code,
}

SettingsTab:CreateDropdown({
    Name = "Chọn Font",
    Options = {"Default (Gotham)", "Minecraft (Arcade)", "Đậm (GothamBlack)", "Mảnh (SourceSansLight)", "Kỹ thuật số (Code)"},
    CurrentOption = "Default (Gotham)",
    Callback = function(option)
        local font = Fonts[option]
        if font then
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                    v.Font = font
                end
            end
            Rayfield:Notify({Title="Font Changed", Content="Đã đổi font: "..option, Duration=4})
        end
    end
})
