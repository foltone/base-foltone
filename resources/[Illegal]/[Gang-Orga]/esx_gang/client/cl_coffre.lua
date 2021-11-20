local PlayerInventory, GangInventoryItem, GangInventoryWeapon, PlayerWeapon = {}, {}, {}, {}

function openCoffreMenu(coffreGang)

    PlayerInventaire()
    GangStock(coffreGang.Coffre.SocietyCoffre)

    local menuCoffre = RageUI.CreateMenu("Coffre", ("Gang : %s"):format(coffreGang.JobGangName), nil, nil, nil, nil, 255, 0, 0, 0);
    local deposerItem = RageUI.CreateSubMenu(menuCoffre,"Mes Items", ("Gang : %s"):format(coffreGang.JobGangName));
    local prendreItem = RageUI.CreateSubMenu(menuCoffre,"Items Coffre", ("Gang : %s"):format(coffreGang.JobGangName));
    local deposerWeapon = RageUI.CreateSubMenu(menuCoffre,"Mes Armes", ("Gang : %s"):format(coffreGang.JobGangName));
    local prendreWeapon = RageUI.CreateSubMenu(menuCoffre,"Armes Coffre", ("Gang : %s"):format(coffreGang.JobGangName));

    RageUI.Visible(menuCoffre, not RageUI.Visible(menuCoffre))

    while menuCoffre do
        Citizen.Wait(0)
        RageUI.IsVisible(menuCoffre, function()
            RageUI.Button(" ~r~> ~s~Déposer des objets", nil, { }, true, {}, deposerItem)
            RageUI.Button(" ~r~> ~s~Prendre des objets", nil, { }, true, {}, prendreItem)
            RageUI.Button(" ~r~> ~s~Déposer des armes", nil, { }, true, {}, deposerWeapon)
            RageUI.Button(" ~r~> ~s~Prendre des armes", nil, { }, true, {}, prendreWeapon)
        end)
        RageUI.IsVisible(deposerItem, function()
            for i = 1, #PlayerInventory do
                RageUI.Button((" ~r~> ~s~%s"):format(PlayerInventory[i].label), nil, { RightLabel = (" [%s]"):format(PlayerInventory[i].nombre) }, true, {
                    onSelected = function()
                        local valueDeposerItem = tonumber(TextInfo("Nombre d'item ?", "", 20, false))
                        if valueDeposerItem ~= nil then
                            TriggerServerEvent("esx_gang:DeposerObjet", coffreGang, PlayerInventory[i].value, valueDeposerItem)
                            PlayerInventaire()
                            GangStock(coffreGang.Coffre.SocietyCoffre)
                        else
                            ESX.ShowNotification("Merci de rentrer un nom d'item !")
                        end
                    end
                })
            end
        end)
        RageUI.IsVisible(prendreItem, function()
            for i = 1, #GangInventoryItem do
                RageUI.Button((" ~r~> ~s~%s"):format(GangInventoryItem[i].label), nil, { RightLabel = (" [%s]"):format(GangInventoryItem[i].nombre) }, true, {
                    onSelected = function()
                        local valuePrendreItem = tonumber(TextInfo("Nombre d'item ?", "", 20, false))
                        if valuePrendreItem ~= nil then
                            TriggerServerEvent("esx_gang:PrendreObjet", coffreGang, GangInventoryItem[i].value, valuePrendreItem)
                            PlayerInventaire()
                            GangStock(coffreGang.Coffre.SocietyCoffre)
                        else
                            ESX.ShowNotification("Merci de rentrer un nom d'item !")
                        end
                    end
                })
            end
        end)
        RageUI.IsVisible(deposerWeapon, function()
            for i = 1, #PlayerWeapon do
                RageUI.Button((" ~r~> ~s~%s"):format(PlayerWeapon[i].label), nil, { RightLabel = (" [%s]"):format(PlayerWeapon[i].munitions) }, true, {
                    onSelected = function()
                        TriggerServerEvent("esx_gang:deposerarmes", coffreGang, PlayerWeapon[i].value, PlayerWeapon[i].munitions)
                        PlayerInventaire()
                        GangStock(coffreGang.Coffre.SocietyCoffre)
                    end
                })
            end
        end)
        RageUI.IsVisible(prendreWeapon, function()
            for i = 1, #GangInventoryWeapon do
                RageUI.Button((" ~r~> ~s~%s"):format(GangInventoryWeapon[i].label), nil, { RightLabel = (" [%s]"):format(GangInventoryWeapon[i].munitions) }, true, {
                    onSelected = function()
                        TriggerServerEvent("esx_gang:prendrearmes", coffreGang, GangInventoryWeapon[i].value, GangInventoryWeapon[i].munitions)
                        PlayerInventaire()
                        GangStock(coffreGang.Coffre.SocietyCoffre)
                    end
                })
            end
        end)
        if not RageUI.Visible(menuCoffre) and not RageUI.Visible(deposerItem) and not RageUI.Visible(prendreItem) and not RageUI.Visible(deposerWeapon) and not RageUI.Visible(prendreWeapon) then
            FreezeEntityPosition(PlayerPedId(), false)
            menuCoffre = RMenu:DeleteType("menuCoffre", true)
        end
    end
end

function PlayerInventaire()
    ESX.TriggerServerCallback("esx_gang:PlayerInventaire", function(inventory)
        PlayerInventory = {}
        for i = 1, #inventory, 1 do
            local playerItem = inventory[i]
            if playerItem.count > 0 then
                table.insert(PlayerInventory, {
                    label = playerItem.label,
                    nombre = playerItem.count,
                    value = playerItem.name
                })
            end
        end
    end)

    ESX.TriggerServerCallback("esx_gang:PlayerWeapon", function(weapon)
        PlayerWeapon = {}
        for i = 1, #weapon, 1 do
            local playerWeapon = weapon[i]
            table.insert(PlayerWeapon, {
                label = ESX.GetWeaponLabel(playerWeapon.name),
                munitions = playerWeapon.ammo,
                value = playerWeapon.name,
            })
        end
    end)
end

function GangStock(Society)
    ESX.TriggerServerCallback("esx_gang:GangStockItem", function(items)
        GangInventoryItem = {}
        for i = 1, #items, 1 do
            local gangItem = items[i]
            if gangItem.count > 0 then
                table.insert(GangInventoryItem, {
                    label = gangItem.label,
                    nombre = gangItem.count,
                    value = gangItem.name,
                })
            end
        end
    end, Society)

    ESX.TriggerServerCallback("esx_gang:GangStockWeapon", function(weapons)
        GangInventoryWeapon = {}
        for i = 1, #weapons, 1 do
            local gangWeapon = weapons[i]
            table.insert(GangInventoryWeapon, {
                label = ESX.GetWeaponLabel(gangWeapon.name),
                munitions = gangWeapon.ammo,
                value = gangWeapon.name,
            })
        end
    end, Society)
end
