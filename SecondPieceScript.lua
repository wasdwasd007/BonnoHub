repeat wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

_G.Settings = {
    AutoFarm = false,
    AutoEquip = false,
    Mobs = {},
    SelectedMob = "",
    Weapons = {},
    SelectedWeapon = "",


}
local plr = game:GetService("Players").LocalPlayer
local character = plr.Character

for _, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
    local mobName = v.Name:match("^%D+")
    if mobName and not table.find(_G.Settings.Mobs, mobName) then
        table.insert(_G.Settings.Mobs, mobName)
    end
end

for _,v in pairs(plr.Backpack:GetChildren()) do
    table.insert(_G.Settings.Weapons,v.Name)
end

local Luxtl = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Luxware-UI-Library/main/Source.lua"))()
local Luxt = Luxtl.CreateWindow("Bonno GUI", 6105620301)
local mainTab = Luxt:Tab("Auto-Farm", 6087485864)
local teleportsTab = Luxt:Tab("Teleports")
local autoQTab = Luxt:Tab("Auto-Quest")
local combatTab = Luxt:Tab("Combat")
local creditsTab = Luxt:Tab("Credits")
local cf = creditsTab:Section("Main Credits")
cf:Credit("By: Bonno No.1")
local cf1 = creditsTab:Section("UI Credits")
cf1:Credit("xHeptc: UI Library")
local cf2 = creditsTab:Section("Helping Credits")
cf2:Credit("Salad: Helping")

local Examples = Luxt:Tab("Examples")
local ff = Examples:Section("All Examples")
local Main = mainTab:Section("Main")

Main:DropDown("Select Mob", _G.Settings.Mobs, function(mobs)
    _G.Settings.SelectedMob = mobs
end)
Main:DropDown("Select Weapon", _G.Settings.Weapons, function(weapons)
    _G.Settings.SelectedWeapon = weapons
end)
Main:Toggle("AutoFarm", function(isToggled)
    _G.Settings.AutoFarm = isToggled
end)
Main:Toggle("AutoEquip", function(isToggled)
    _G.Settings.AutoEquip = isToggled
end)

spawn(function()
    while wait() do
        if _G.Settings.AutoEquip == true then
            for _,v in pairs(plr.Backpack:GetChildren()) do
                if v.Name == _G.Settings.SelectedWeapon and v:IsA("Tool") then
                    v.Parent = Character
                end
            end
        end
    end
end)
