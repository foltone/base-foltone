
Papier = {
    liste = {
        'Regarder',
        'Montrer'
    },
    carteidentite =  {

        Index = 1,
        [1] = function()TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId())) end,
        [2] = function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		    if closestDistance ~= -1 and closestDistance <= 3.0 then
		        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
		    else
			    ESX.ShowNotification("Aucun joueur a proximité")
		    end
        end
    },
    permis = {
        Index = 1,
        [1] = function()TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')end,
        [2] = function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestDistance ~= -1 and closestDistance <= 3.0 then
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
            else
                ESX.ShowNotification("Aucun joueur a proximité")
            end
        end,
    },
    ppa = {
        Index = 1,
        [1] = function()TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')end,
        [2] = function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestDistance ~= -1 and closestDistance <= 3.0 then
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
            else
                ESX.ShowNotification("Aucun joueur a proximité")
            end
        end,
    },
    medical = {
        Index = 1,
        [1] = function()TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'medical')end,
        [2] = function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestDistance ~= -1 and closestDistance <= 3.0 then
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'medical')
            else
                ESX.ShowNotification("Aucun joueur a proximité")
            end
        end,
    }
}
Inventaire = {
    liste = {
        'Utiliser',
        'Donner',
        'Jeter'
    },
    Index = 1,

    giveitem = function ()
        local donner,quantity = CheckQuantity(KeyboardInput("foltone","Montant","", 20))
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        local pPed = vehicle.ped()
        if donner then
            if closestDistance ~= -1 and closestDistance <= 3 then
                local closestPed = GetPlayerPed(closestPlayer)

                if IsPedOnFoot(closestPed) then
                    TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_standard', Item.name, quantity) -- ItemSelected ?? Sa sort d'ou ? Global nil sa risque pas de marcher
                else
                    ShowAboveRadarMessage("Vous ne pouvez pas jeter  d'items dans un véhicule !") -- Quoi ? Nombre d'item invalide si le joueurs drop un item alors qu'il est dasn un véhicule ?
                end
            else
                ShowAboveRadarMessage("Aucun joueur ~r~Proche~n~ !")
            end
        end
    end,

    useItem = function()
        if Item.usable then
            if Item.name == 'headbag' then 
                RageUI.CloseAll()
            end
            TriggerServerEvent('esx:useItem', Item.name)
        else
            ShowAboveRadarMessage("Cette item n'est pas utilisable", Item.label)
        end
    end,

    dropItem = function()
        if Item.canRemove then
            local jeter,quantity = CheckQuantity(KeyboardInput("Montant","Montant","", 20))
            if jeter then
                if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then -- PlayerPed ? Sa sort d'ou ? global nil
                    TriggerServerEvent('esx:removeInventoryItem', 'item_standard', Item.name, quantity)
                    TriggerServerEvent("esx:DropItem", Item.name, quantity, GetEntityCoords(personal.pedId()))

                end
            end
        end
    end
}

WeaponOption = {
        giveweapon = function()
           local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			if closestDistance ~= -1 and closestDistance <= 3 then
			local closestPed = GetPlayerPed(closestPlayer)
				if IsPedOnFoot(closestPed) then
					local ammo = GetAmmoInPedWeapon(personal.pedId(), Weap.hash)
					TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_weapon', Weap.name, ammo)
				else
					ShowAboveRadarMessage('~r~Impossible~s~ de donner une arme dans un véhicule', Weap.label)
				end
			else
				ShowAboveRadarMessage('Aucun joueur ~r~proche !')
			end
        end,
        giveammo = function()
            local post, quantity = CheckQuantity(KeyboardInput('foltone','Nombre de munitions','', 20))
				if post then
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

					if closestDistance ~= -1 and closestDistance <= 3 then
						local closestPed = GetPlayerPed(closestPlayer)
						if IsPedOnFoot(closestPed) then
							local ammo = GetAmmoInPedWeapon(personal.pedId(), Weap.hash)

							if ammo > 0 then
								if quantity <= ammo and quantity >= 0 then
									local finalAmmo = math.floor(ammo - quantity)
									SetPedAmmo(personal.pedId(), Weap.name, finalAmmo)

									TriggerServerEvent('foltone:addAmmoToPeds', GetPlayerServerId(closestPlayer), Weap.name, quantity)
									ShowAboveRadarMessage('Vous avez donné '..quantity..' munitions à '..GetPlayerName(closestPlayer), quantity, GetPlayerName(closestPlayer))
									--RageUI.CloseAll()
								else
									ShowAboveRadarMessage('Vous ne possédez pas autant de munitions')
								end
							else
								ShowAboveRadarMessage("Vous n'avez pas de munition")
							end
						else
							ShowAboveRadarMessage('Vous ne pouvez pas donner des munitions dans un ~~r~véhicule~s~', Weap.label)
						end
					else
						ShowAboveRadarMessage('Aucun joueur ~r~proche~s~ !')
					end
				else
					ShowAboveRadarMessage('Nombre de munition ~r~invalid')
				end
        end,
        dropweapon = function()
            if IsPedOnFoot(personal.pedId()) then
                TriggerServerEvent('esx:removeInventoryItem', 'item_weapon', Weap.name)
            else
                ShowAboveRadarMessage("~r~Impossible~s~ de jeter l'armes dans un véhicule", Weap.label)
            end
        end,
}
SacPlayer = {
    InventoryPlayer = function()
        for i=1, #foltone.inventairePlayer, 1 do
            local count = foltone.inventairePlayer[i].count
            if count >= 1 then 
                RageUI.Button(" [~b~"..count .."~s~] - " .. foltone.inventairePlayer[i].label  , " Appuyer sur ~r~ Entrer ~s~ pour pouvoir retirer un(e) ~b~".. foltone.inventairePlayer[i].label, {RightLabel = ""} , true, {
                    onSelected = function()
                         quantity  = KeyboardInput('foltone',"Retirer un(e) ~b~"..foltone.inventairePlayer[i].label,"", 20)
                         sureter  = KeyboardInput('foltone',"tu est sur de retirer "..quantity.." ~y~ "..foltone.inventairePlayer[i].label .. "~s~ à ~b~" ..menuPlayerName,"", 20)

                        if quantity ~= nil then
                            local post = true
                            quantity = tonumber(quantity)
                    
                            if type(quantity) == 'number' then
                                quantity = ESX.Math.Round(quantity)
                    
                                if quantity <= 0 then
                                    post = false
                                end
                            end                  
                            if sureter == "Oui" or sureter == "oui" or sureter == "o" then
                                ESX.ShowNotification("Tu as retiré  "..quantity.." ~y~ "..foltone.inventairePlayer[i].label .. "~s~ à ~b~" ..menuPlayerName)
                                TriggerServerEvent('foltone:RemoveItem',menuPlayerId, foltone.inventairePlayer[i].name , quantity)
                            else 
                                ESX.ShowNotification("Tu as rien retiré ~s~ à ~b~" ..menuPlayerName)
                            end    
                        else
                            ESX.ShowNotification('Montant invalide')
                        end
                        inventaireadmin(menuPlayerId)
                    end	
                })
            end
        end
    end,

    RemoveBankPlayer = function()
        amount = KeyboardInput('Retirer Banque', 'Retirer Banque' , '',20)
        if amount ~= nil then
            amount = tonumber(amount)
            if type(amount) == 'number' then
                TriggerServerEvent("foltone:removebanque",menuPlayerId,amount) 
                ESX.ShowNotification("Tu as retiré ~g~"..amount.." €~s~à ~b~"..menuPlayerName)
            end
        end
    end,

    RemoveSalePlayer = function()
        amount = KeyboardInput('Retirer Sale','Retirer Sale','', 20)
        if amount ~= nil then
            amount = tonumber(amount)
            if type(amount) == 'number' then
                TriggerServerEvent("foltone:removesale",menuPlayerId,amount) 
                ESX.ShowNotification("Tu as retiré ~g~"..amount.." €~s~à ~b~"..menuPlayerName)
            end
        end
    end,

    RemoveLiquidePlayer = function()
        amount = KeyboardInput('Retirer Liquide', "Retirer Liquide", "", 20)
		TriggerServerEvent("foltone:removemoeney",menuPlayerId,amount) 
		ESX.ShowNotification("Tu as retiré ~g~"..amount.." €~s~à ~b~"..menuPlayerName)
		RefreshLiquideAdmin(menuPlayerId)
    end
}
Argent = {
    liste = {
        "Donner",
        "Jeter",
    },

    liquide = {
        Index = 1,

        [1] = function()
            local money, quantity = CheckQuantity(KeyboardInput("Montant", 'Montant', '', 1000))
            if money then
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                if closestDistance ~= -1 and closestDistance <= 3 then
                local closestPed = GetPlayerPed(closestPlayer)
                    if not IsPedSittingInAnyVehicle(personal.pedId()) then
                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_money', ESX.PlayerData.money, quantity)
                    else
                        ShowAboveRadarMessage('Vous ne pouvez pas donner de l\'argent dans un véhicles')
                    end
                else
                    ShowAboveRadarMessage('~b~INFORMATION\n~w~Il n\'y a aucun citoyen proche de toi.')
                end
            else
                ShowAboveRadarMessage('~b~INFORMATION\n~w~Montant invalide.')
            end
        end,

        [2] = function() 
            local money, quantity = CheckQuantity(KeyboardInput("Montant", 'Montant', '', 1000))
            if money then
                if not IsPedSittingInAnyVehicle(personal.pedId()) then
                    TriggerServerEvent('esx:removeInventoryItem', 'item_money', ESX.PlayerData.money, quantity)
                else
                    ShowAboveRadarMessage('~b~INFORMATION\n~w~Tu ne peux pas jeter d\'argent dans un véhicule.')
                end
            else
                ShowAboveRadarMessage('~b~INFORMATION\n~w~Montant invalide.')   
            end
        end,
    },


    Sale = {
        Index = 1,

        [1] = function()
            local black, quantity = CheckQuantity(KeyboardInput("foltone", 'Montant', '', 1000))
                if black then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        local closestPed = GetPlayerPed(closestPlayer)
    
                        if not IsPedSittingInAnyVehicle(personal.pedId()) then
                            TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', ESX.PlayerData.accounts[2].name, quantity)
                        else
                            ShowAboveRadarMessage('~b~INFORMATION\n~w~Tu ne peux pas donner d\'argent dans un véhicule.')
                        end
                    else
                        ShowAboveRadarMessage('~b~INFORMATION\n~w~Il n\'y a aucun citoyen proche de toi.')
                    end
                else
                    ShowAboveRadarMessage('~b~INFORMATION\n~w~Montant invalide.')
                end
        end,
        [2] = function()
            local black, quantity = CheckQuantity(KeyboardInput("foltone", 'Montant', '', 1000))
                if black then
                    if not IsPedSittingInAnyVehicle(personal.pedId()) then
                        TriggerServerEvent('esx:removeInventoryItem', 'item_account', ESX.PlayerData.accounts[2].name, quantity)
                    else
                        ShowAboveRadarMessage('~b~INFORMATION\n~w~Tu ne peux pas jeter d\'argent dans un véhicule.')
                    end
                else
                    ShowAboveRadarMessage('~b~INFORMATION\n~w~Montant invalide.')
                end                                   
        end,
    }
}

GestionEntreprise = {

    recruter = function()       
        if ESX.PlayerData.job.grade_name == 'boss' then
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestPlayer == -1 or closestDistance > 3.0 then
                ShowAboveRadarMessage('Aucun joueur à proximité')
            else
                TriggerServerEvent('foltone:Recruter', GetPlayerServerId(closestPlayer), ESX.PlayerData.job.name, 0)
            end
        end
    end,


    promouvoir = function()
        if ESX.PlayerData.job.grade_name == 'boss' then
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

            if closestPlayer == -1 or closestDistance > 3.0 then
                ShowAboveRadarMessage('Aucun joueur à proximité')
            else
                TriggerServerEvent('foltone:promouvoir', GetPlayerServerId(closestPlayer))
            end
        end
    end,

    destituer = function()
        if ESX.PlayerData.job.grade_name == 'boss' then
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

            if closestPlayer == -1 or closestDistance > 3.0 then
                ShowAboveRadarMessage('Aucun joueur à proximité')
            else
                TriggerServerEvent('foltone:destituer', GetPlayerServerId(closestPlayer))
            end
        end
    end,

    virer = function()
        if ESX.PlayerData.job.grade_name == 'boss' then
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

            if closestPlayer == -1 or closestDistance > 3.0 then
                ShowAboveRadarMessage('Aucun joueur à proximité')
            else
                TriggerServerEvent('foltone:Virer', GetPlayerServerId(closestPlayer))
            end
        end
    end,

}


Weather = {

    liste = {
        { name = 'extrasunny', label = 'Ensoleille' },
        { name = 'clear', label = 'Clair' },
        { name = 'neutral', label = 'Neutre' },
        { name = 'smog', label = 'Brouillard' },
        { name = 'foggy', label = 'Brumeux' },
        { name = 'overcast', label = 'Couvert' },
        { name = 'clouds', label = 'Nuageux' },
        { name = 'rain', label = 'Pluie' },
        { name = 'thunder', label = 'Orage' },
        { name = 'snowlight', label = 'Petite Neige' },
        { name = 'snow', label = 'Neige'},
        { name = 'blizzard', label = 'Blizzard'},
        { name = 'xmas', label = 'Noel' },
        { name = 'halloween', label = 'Halloween' },
    },

    time = 	{
        { name = 'morning', label = 'Matinee' },
        { name = 'noon', label = 'Midi' },
        { name = 'evening', label = 'Soiree' },
        { name = 'night', label = 'Minuit' },
    }
    


}


AdminVehicle = {

    RepearVehicle = function()
        local plyVehicle = vehicle.currentVehicle()
        SetVehicleFixed(plyVehicle)
        SetVehicleDeformationFixed(plyVehicle)
        SetVehicleUndriveable(plyVehicle, false)
        SetVehicleDirtLevel(plyVehicle, 0)
        SetVehicleEngineOn(plyVehicle, true, true)
    end,

    SpawnVeh = function()
        local result = KeyboardInput("foltone","Nom du véhicule","",20)
        vehicle.createVehicle(result,personal.coordped(),personal.headingped())
    end,

    returnveh = function()
        local pPed = vehicle.ped()
            posped = personal.coordped()
            carspawndep = vehicle.clothestVeh(posped)
                if carspawndep ~= nil then
                    platecarspawndep = GetVehicleNumberPlateText(carspawndep)
                end
            local playerCoords = personal.coordped()
            playerCoords = playerCoords + vector3(0, 2, 0)
            SetEntityCoords(carspawndep, playerCoords)
    end
}

---Sanction
Warn = {
    {name = "Autre ( entrer une raison )"},
    {name = "Nom + Prénom Rp sur Steam stp !"},
    {name = "Freekill"},
    {name = "NoFear"},
    {name = "Provocation inutile (Force Rp)"},
    {name = "HRP vocal"},
    {name = "Conduite HRP"},
    {name = "NoPain"},
    {name = "Parle coma"},
    {name = "Troll"},
    {name = "Powergaming"},
    {name = "Insultes"},
    {name = "Non respect du staff"},
    {name = "Metagaming"},
    {name = "ForceRP"},
    {name = "Freeshoot"},
    {name = "Freepunch"},
    {name = "Non respect du masse RP"},
    {name = "Vol de véhicule en zone safe"},
    {name = "Vol de véhicule de fonction"},
}

Kick = {
    {name = "Autre ( entrer une raison )"},
    {name = "Nom + Prénom Rp sur Steam stp !"},
    {name = "Freekill"},
    {name = "NoFear"},
    {name = "NoPain"},
    {name = "Insulte"},
    {name = "HRP"},
    {name = "AFK"},
}

Owners = {
    'steam:1100001349da85b'
}



Ranks = {
	["user"] = 0,
	["mod"] = 1,
	["admin"] = 2,
	["superadmin"] = 3,
	["owner"] = 4,
	["dev"] = 5
}
---Vetement 
Clothes = {
    men = {
		{
			grade = 'owner',
			cloths = {
				["tshirt_1"] = 15,
				["tshirt_2"] = 0,
				["torso_1"] = 178,
				["torso_2"] = 9,
				["decals_1"] = 0,
				["decals_2"] = 0,
				["arms"] = 6,
				["pants_1"] = 77,
				["pants_2"] = 9,
				["shoes_1"] = 55,
				["shoes_2"] = 9,
				["helmet_1"] = 91,
				["helmet_2"] = 9,
				["chain_1"] = 0,
				["chain_2"] = 0,
				["ears_1"] = 0,
				["ears_2"] = 0,
				["bproof_1"] = 0,
				["bproof_2"] = 0
			}
		},
		{
			grade = "superadmin",
			cloths = {
				["tshirt_1"] = 15,
				["tshirt_2"] = 0,
				["torso_1"] = 178,
				["torso_2"] = 9,
				["decals_1"] = 0,
				["decals_2"] = 0,
				["arms"] = 6,
				["pants_1"] = 77,
				["pants_2"] = 9,
				["shoes_1"] = 55,
				["shoes_2"] = 9,
				["helmet_1"] = 91,
				["helmet_2"] = 9,
				["chain_1"] = 0,
				["chain_2"] = 0,
				["ears_1"] = 0,
				["ears_2"] = 0,
				["bproof_1"] = 0,
				["bproof_2"] = 0
			}
		},
		{
			grade = "admin",
			cloths = {
				["tshirt_1"] = 15,
				["tshirt_2"] = 0,
				["torso_1"] = 178,
				["torso_2"] = 9,
				["decals_1"] = 0,
				["decals_2"] = 0,
				["arms"] = 6,
				["pants_1"] = 77,
				["pants_2"] = 9,
				["shoes_1"] = 55,
				["shoes_2"] = 9,
				["helmet_1"] = 91,
				["helmet_2"] = 9,
				["chain_1"] = 0,
				["chain_2"] = 0,
				["ears_1"] = 0,
				["ears_2"] = 0,
				["bproof_1"] = 0,
				["bproof_2"] = 0
			}
		},
		{
			grade = "mod",
			cloths = {
				["tshirt_1"] = 15,
				["tshirt_2"] = 0,
				["torso_1"] = 178,
				["torso_2"] = 9,
				["decals_1"] = 0,
				["decals_2"] = 0,
				["arms"] = 6,
				["pants_1"] = 77,
				["pants_2"] = 9,
				["shoes_1"] = 55,
				["shoes_2"] = 9,
				["helmet_1"] = 91,
				["helmet_2"] = 9,
				["chain_1"] = 0,
				["chain_2"] = 0,
				["ears_1"] = 0,
				["ears_2"] = 0,
				["bproof_1"] = 0,
				["bproof_2"] = 0
			}
		}
	},
	women = {
		{
			grade = "superadmin",
			cloths = {
				["tshirt_1"] = 15,
				["tshirt_2"] = 0,
				["torso_1"] = 178,
				["torso_2"] = 9,
				["decals_1"] = 0,
				["decals_2"] = 0,
				["arms"] = 6,
				["pants_1"] = 77,
				["pants_2"] = 9,
				["shoes_1"] = 55,
				["shoes_2"] = 9,
				["helmet_1"] = 91,
				["helmet_2"] = 9,
				["chain_1"] = 0,
				["chain_2"] = 0,
				["ears_1"] = 0,
				["ears_2"] = 0,
				["bproof_1"] = 0,
				["bproof_2"] = 0
			}
		},
		{
			grade = "admin",
			cloths = {
				["tshirt_1"] = 15,
				["tshirt_2"] = 0,
				["torso_1"] = 178,
				["torso_2"] = 9,
				["decals_1"] = 0,
				["decals_2"] = 0,
				["arms"] = 6,
				["pants_1"] = 77,
				["pants_2"] = 9,
				["shoes_1"] = 55,
				["shoes_2"] = 9,
				["helmet_1"] = 91,
				["helmet_2"] = 9,
				["chain_1"] = 0,
				["chain_2"] = 0,
				["ears_1"] = 0,
				["ears_2"] = 0,
				["bproof_1"] = 0,
				["bproof_2"] = 0
			}
		},
		{
			grade = "mod",
			cloths = {
				["tshirt_1"] = 15,
				["tshirt_2"] = 0,
				["torso_1"] = 178,
				["torso_2"] = 9,
				["decals_1"] = 0,
				["decals_2"] = 0,
				["arms"] = 6,
				["pants_1"] = 77,
				["pants_2"] = 9,
				["shoes_1"] = 55,
				["shoes_2"] = 9,
				["helmet_1"] = 91,
				["helmet_2"] = 9,
				["chain_1"] = 0,
				["chain_2"] = 0,
				["ears_1"] = 0,
				["ears_2"] = 0,
				["bproof_1"] = 0,
				["bproof_2"] = 0
			}
		}
	}
}


