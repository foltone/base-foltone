function openVestiaireMenu(vestiaireGang)

    local menuVestiaire = RageUI.CreateMenu("Vestiaire", ("Gang : %s"):format(vestiaireGang.JobGangName), nil, nil, nil, nil, 255, 0, 0, 0);

    RageUI.Visible(menuVestiaire, not RageUI.Visible(menuVestiaire))

    while menuVestiaire do
        Citizen.Wait(0)
        RageUI.IsVisible(menuVestiaire, function()
            RageUI.Button(" ~r~> ~s~Remettre sa tenue !", nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        TriggerEvent('skinchanger:loadSkin', skin)
                    end)
                end
            })
            RageUI.Separator("↓ ~y~TENUE(S) ~s~↓")
            for i = 1, #vestiaireGang.Vestiaire.Tenue, 1 do
                RageUI.Button((" ~r~> ~s~%s"):format(vestiaireGang.Vestiaire.Tenue[i].Name), nil, {}, true, {
                    onSelected = function()
                        TriggerEvent("skinchanger:getSkin", function(skin)
                            if skin.sex == 0 then
                                if vestiaireGang.Vestiaire.Tenue[i].Skin.Homme ~= nil then
                                    TriggerEvent("skinchanger:loadClothes", skin, vestiaireGang.Vestiaire.Tenue[i].Skin.Homme)
                                else
                                    ESX.ShowNotification("Il semblerait qu'il n'y a plus de tenue ?!")
                                end
                            else
                                if vestiaireGang.Vestiaire.Tenue[i].Skin.Femme ~= nil then
                                    TriggerEvent("skinchanger:loadClothes", skin, vestiaireGang.Vestiaire.Tenue[i].Skin.Femme)
                                else
                                    ESX.ShowNotification("Il semblerait qu'il n'y a plus de tenue ?!")
                                end
                            end
                        end)
                    end
                })
            end
        end)
        if not RageUI.Visible(menuVestiaire) then
            FreezeEntityPosition(PlayerPedId(), false)
            menuVestiaire = RMenu:DeleteType("menuVestiaire", true)
        end
    end
end