local ArgentSale, Items, Weapons = {}, {}, {}

function menuGangFouiller(gangSelected)

    local menuFouiller = RageUI.CreateMenu("Interaction", ("Gang : %s"):format(gangSelected.GangName), nil, nil, nil, nil, 255, 0, 0, 0);
    local playerSelected = RageUI.CreateSubMenu(menuFouiller,"Interaction", ("Gang : %s"):format(gangSelected.GangName));

    RageUI.Visible(menuFouiller, not RageUI.Visible(menuFouiller))

    while menuFouiller do
        Citizen.Wait(0)
        RageUI.IsVisible(menuFouiller, function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance < 3 then
                RageUI.Button("Fouiller la personne", nil, { }, true, {
                    onSelected = function()
                        if closestPlayer ~= -1 and closestDistance < 3 then
                            PlayerFouilleInventaire(closestPlayer)
                            TaskPlayAnim(PlayerPedId(),"amb@prop_human_bum_bin@idle_b","idle_d",-1, -1, -1, 120, 1, 0, 0, 0)
                        end
                    end
                }, playerSelected)
            else
                RageUI.Button("~r~Personne autour de toi !", nil, {}, false, {})
            end
        end)
        RageUI.IsVisible(playerSelected, function()
            RageUI.Separator("↓ ~g~Argent Sale ~s~↓")
            for k,v in pairs(ArgentSale) do
                RageUI.Button(" ~r~> ~s~Argent sale :", "~y~Info : ~r~Attention ton action peux avoir des répercutions !", { RightLabel = ("~r~%s ~s~$"):format(v.label) }, true, {
                    onSelected = function()
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                        if closestPlayer ~= -1 and closestDistance < 3 then
                            local valueRecupMoney = tonumber(TextInfo("Montant ?", "", 20, false))
                            if v.amount >= valueRecupMoney then
                                TriggerServerEvent("esx_gang:PlayerSelected", GetPlayerServerId(closestPlayer), "item_account", v.value, valueRecupMoney)
                            else
                                ESX.ShowNotification("~g~Quantité invalide")
                            end
                        end
                        RageUI.GoBack()
                    end
                })
            end
            RageUI.Separator("↓ ~g~Objet(s) ~s~↓")
            for k,v in pairs(Items) do
                RageUI.Button((" ~r~> ~s~%s"):format(v.label), nil, { RightLabel = ("x [~r~%s ~s~]"):format(v.right) }, true, {
                    onSelected = function()
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                        if closestPlayer ~= -1 and closestDistance < 3 then
                            local valueRecupItem = tonumber(TextInfo("Montant ?", "", 20, false))
                            if v.amount >= valueRecupItem then
                                TriggerServerEvent("esx_gang:PlayerSelected", GetPlayerServerId(closestPlayer), "item_standard", v.value, valueRecupItem)
                            else
                                ESX.ShowNotification("~g~Quantité invalide")
                            end
                        end
                        RageUI.GoBack()
                    end
                })
            end
            RageUI.Separator("↓ ~g~Arme(s) ~s~↓")
            for k,v in pairs(Weapons) do
                RageUI.Button((" ~r~> ~s~%s"):format(v.label), nil, { RightLabel = ("x [~r~%s ~s~]"):format(v.munitions) }, true, {
                    onSelected = function()
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                        if closestPlayer ~= -1 and closestDistance < 3 then
                            TriggerServerEvent("esx_gang:PlayerSelected", GetPlayerServerId(closestPlayer), "item_weapon", v.value, munitions)
                        end
                        RageUI.GoBack()
                    end
                })
            end
        end)
        if not RageUI.Visible(menuFouiller) and not RageUI.Visible(playerSelected) then
            menuFouiller = RMenu:DeleteType("menuFouiller", true)
        end
    end
end

function PlayerFouilleInventaire(player)
    ArgentSale = {}
    Items = {}
    Weapons = {}
    ESX.TriggerServerCallback("esx_gang:PlayerFouilleInventaire", function(data)
        for i = 1, #data.accounts, 1 do
            if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
                table.insert(ArgentSale, {
                    label    = ESX.Math.Round(data.accounts[i].money),
                    value    = 'black_money',
                    itemType = 'item_account',
                    amount   = data.accounts[i].money
                })

                break
            end
        end
        for i = 1, #data.inventory, 1 do
            if data.inventory[i].count > 0 then
                table.insert(Items, {
                    label    = data.inventory[i].label,
                    right    = data.inventory[i].count,
                    value    = data.inventory[i].name,
                    itemType = 'item_standard',
                    amount   = data.inventory[i].count
                })

                break
            end
        end
        for i = 1, #data.weapon, 1 do
            local playerWeapons = data.weapon[i]
            table.insert(Weapons, {
                label = ESX.GetWeaponLabel(playerWeapons.name),
                munitions = playerWeapons.ammo,
                value = playerWeapons.name,
            })

            break
        end
    end, GetPlayerServerId(player))
end

Keys.Register("f7", "f7", "Menu Fouiller", function()
    for i = 1, #Gang do
        if Gang[i].JobGangName == ESX.PlayerData.job2.name then
            menuGangFouiller(Gang[i])
        end
    end
end)