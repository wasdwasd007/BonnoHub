repeat wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

function MobsList()
    for _, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
        local mobName = v.Name:match("^%D+")
        if mobName and not table.find(Settings.Mobs, mobName) then
            table.insert(Settings.Mobs, mobName)
        end
    end
end

local Settings = {
    AutoFarm = false,
    Mobs = {},
    SelectedMob = "",

}


MobsList()

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
Main:Toggle("AutoFarm", function(isToggled)
    _G.Settings.AutoFarm = isToggled
end)

ff:Label("Welcome to Bonno GUI")
ff:Button("TextButton Text", function()
    print("Clicked!")
end)
ff:Toggle("Toggle Me!", function(isToggled)
    print(isToggled) -- prints true or false
end)
ff:KeyBind("Print('Hey') on bind", Enum.KeyCode.R, function() --Enum.KeyCode.R is starting Key
    print('Hey')
end)
ff:TextBox("TextBox Info", "Epic PlaceHolder", function(getText)
    print(getText) -- Prints whatever player types
end)
ff:Slider("WalkSpeed", 16, 503, function(currentValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = currentValue 
end)
ff:DropDown("Favorite Food?", {"Pizza", "Burger", "Sandwiches"}, function(food) -- food is chosen item
    print(food)
end)
