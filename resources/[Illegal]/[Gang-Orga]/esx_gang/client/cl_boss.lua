local societymoney = {}

function RefreshSocietyMoney(gangSociety)
	if ESX.PlayerData.job2.name == gangSociety.JobGangName then
		ESX.TriggerServerCallback("esx_gang:argent", function(money)
			societymoney = money
		end, gangSociety.BossAction.SocietyAction)
	end
end

function menuGangBoss(gangSelected)

    RefreshSocietyMoney(gangSelected)

    local menuBoss = RageUI.CreateMenu("Action Patron", ("Gang : %s"):format(gangSelected.JobGangName), nil, nil, nil, nil, 255, 0, 0, 0);

    RageUI.Visible(menuBoss, not RageUI.Visible(menuBoss))

    while menuBoss do
        Citizen.Wait(0)
        RageUI.IsVisible(menuBoss, function()
            RageUI.Separator(("Argent Sale : ~r~%s ~s~$"):format(tostring(societymoney)))
            RageUI.Button(" ~r~> ~s~Deposer Argent", "~y~Information : ~s~Déposer de l'argent sale !", { }, true, {
                onSelected = function()
                    local valueDeposit = TextInfo("Montant à déposer ?", "", 20, false)
                    if valueDeposit ~= nil then
                        TriggerServerEvent("esx_gang:deposerargent", gangSelected, tonumber(valueDeposit))
                        RefreshSocietyMoney(gangSelected)
                    else
                        ESX.ShowNotification("Merci de rentrer un montant de dépot !")
                    end
                end
            })
            RageUI.Button(" ~r~> ~s~Retirer Argent", "~y~Information : ~s~Retirer de l'argent sale !", { }, true, {
                onSelected = function()
                    local valueRetire = TextInfo("Montant à retirer ?", "", 20, false)
                    if valueRetire ~= nil then
                        TriggerServerEvent("esx_gang:retirerargent", gangSelected, tonumber(valueRetire))
                        RefreshSocietyMoney(gangSelected)
                    else
                        ESX.ShowNotification("Merci de rentrer un montant de retrait !")
                    end
                end
            })
        end)

        if not RageUI.Visible(menuBoss) then
            FreezeEntityPosition(PlayerPedId(), false)
            menuBoss = RMenu:DeleteType("menuBoss", true)
        end
    end
end

