local menu = RubyUI:CreateMenu("Test menu")
local submenu = RubyUI:CreateMenu("Test submenu")
local submenu2 = RubyUI:CreateMenu("Test submenu")

menu:AddButton("FRRRRRRRRAAAAAAAAA", {
    onClick = function()
        print("")
    end,
})
menu:AddButton("JOOOOOOOOHN", {
    onClick = function()
        print("")
    end,
})

menu:AddButtonToSubMenu("Vers submenu", submenu)
submenu:AddButtonToSubMenu("Vers submenu petit", submenu2)

Citizen.CreateThread(function()
    for i = 1, math.random(50, 100) do
        menu:AddButton("Test bouton " .. i, {
            onClick = function()
                print("Click sur Test bouton " .. i)
            end,
        })
    end

    for i = 1, math.random(50, 100) do
        submenu:AddButton("Test bouton " .. i, {
            onClick = function()
                print("Click sur Test bouton " .. i)
            end,
        })
    end

    for i = 1, math.random(1, 5) do
        submenu2:AddButton("Test bouton " .. i, {
            onClick = function()
                print("Click sur Test bouton " .. i)
            end,
        })
    end
end)

RegisterCommand("testmenu", function(source, args, rawCommand)
    OpenTestMenu()
end, false)

local open = false
function OpenTestMenu()
    if open then
        open = false
        SetNuiFocus(false, false)
        SetNuiFocusKeepInput(false)
        return
    else
        open = true

        SetNuiFocus(true, true)
        SetNuiFocusKeepInput(true, true)
        menu:SetMousePosition()
        menu:HandleCooldown()

        while open do
            if menu:Render() then
                open = false
            end
            Wait(1)
        end
    end
end