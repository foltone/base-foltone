---------------
-------
----Début gestion voiture

----Moteur
function carengine()
    local fuel = GetVehicleEngineTemperature(GetVehiclePedIsIn(GetPlayerPed(-1), false))
			
    if vehicle.vehicleengine() then
        RageUI.Button('~r~Éteindre~s~ le moteur', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
            onSelected = function ()
                vehicle.vehicleOff()
            end
        })
    else
        RageUI.Button('~g~Démarrer~s~ le moteur', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
            onSelected = function ()
                vehicle.vehicleOn()()
            end
        })
    end
--    if vehicle.kmh() ~=nil then 
--        RageUI.Button("Compteur kilométrique : ~b~"..math.floor(vehicle.kmh()).."~s~ KM", false, {}, true, {})
--    end
    RageUI.Button('Etat du moteur : ~b~'..Round(vehicle.Health()).."~s~ /1000", false, {}, true, {})
    RageUI.Button('Température du moteur :~r~ '..Round(vehicle.Temp()).."~s~°C", false, {}, true, {})
    if vehicle.Oil() > 2.5 then 
        RageUI.Button("Niveau d'huile : ~g~ Bon", false, {RightBadge = RageUI.BadgeStyle.Tick}, true, {})
    else 
        RageUI.Button("Niveau d'huile : ~y~ Faible", "Prenez rendez-vous au mécano pour réajuster le niveau d'huile.", {RightBadge = RageUI.BadgeStyle.Alert}, true, {})
    end

end
----Fenetre
function windows()
    RageUI.Button('~g~Descendre~s~ la fenêtre avant gauche', false, {}, true, {
		onSelected = function()
			vehicle.downwindo(0)
		end
	})
	RageUI.Button('~g~Descendre~s~ la fenêtre avant droite', false, {}, true, {
		onSelected = function()
			vehicle.downwindo(1)
		end
	})
	RageUI.Button('~g~Descendre~s~ la fenêtre arrière gauche', false, {}, true, {
		onSelected = function()
			vehicle.downwindo(2)
		end
	})
	RageUI.Button('~g~Descendre~s~ la fenêtre arrière droite', false, {}, true, {
		onSelected = function()
			vehicle.downwindo(3)
		end
	})
	
	RageUI.Button('~r~Fermer~s~ toute les fenetres', false, {}, true, {
		onSelected = function()
			vehicle.upwindo(0)
			vehicle.upwindo(1)
			vehicle.upwindo(2)
			vehicle.upwindo(3)
		end
	})
end

-------Portiere
function doorcar()
    local fuel = GetVehicleEngineTemperature(GetVehiclePedIsIn(GetPlayerPed(-1), false))
	if vehicle.angledoor(0) then 
		RageUI.Button('~r~Fermé~s~ la porte avant gauche ', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
			onSelected = function ()   
				vehicle.closedoor(0)
			end
		})
	else
			RageUI.Button('~g~Ouvrir~s~ la porte avant gauche ', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
			onSelected = function ()
				vehicle.opendoor(0)
			end  
		})
	end
	
	if vehicle.angledoor(1) then 
		RageUI.Button('~r~Fermé~s~ la porte avant droite ', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
			onSelected = function ()   
				vehicle.closedoor(1)
			end
		})
	else
			RageUI.Button('~g~Ouvrir~s~ la porte avant droite ', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
			onSelected = function ()
				vehicle.opendoor(1)
			end  
		})
	end
	if vehicle.angledoor(2) then 
		RageUI.Button('~r~Fermé~s~ la porte arrière gauche', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
			onSelected = function()
				vehicle.closedoor(2)
			end
		})
	else
		RageUI.Button('~g~Ouvrir~s~ la porte arrière gauche', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
		onSelected = function()
			vehicle.opendoor(2)
		end
		})
	end
	if vehicle.angledoor(3) then 
		RageUI.Button('~r~Fermé~s~ la porte arrière droite', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
			onSelected = function()
				vehicle.closedoor(3)
			end
		})
	else
		RageUI.Button('~g~Ouvrir~s~ la porte arrière droite', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
		onSelected = function()
			vehicle.opendoor(3)
		end
		})
	end
	
	if vehicle.angledoor(4) then 
		RageUI.Button('~r~Fermer~s~ le capot', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
			onSelected = function()
				vehicle.closedoor(4)
			end
			})
	else
		RageUI.Button('~g~Ouvrir~s~ le capot', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
			onSelected = function()
				vehicle.opendoor(4)
			end
			})
	end
	if vehicle.angledoor(5) then 
		RageUI.Button('~r~Fermer~s~ le coffre', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
			onSelected = function()
				vehicle.closedoor(5)
			end
			})
	else
		RageUI.Button('~g~Ouvrir~s~ le coffre', false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
			onSelected = function()
				vehicle.opendoor(5)
			end
			})
	end			
end

------------- extra
function OpenVehicleExtraMenu()
	local pPed = GetPlayerPed(-1)
	local pInVeh = IsPedInAnyVehicle(pPed, false)
	if pInVeh then
		local pVeh = GetVehiclePedIsIn(pPed, false)
		local isInRightSeat = GetPedInVehicleSeat(pVeh, -1) == pPed
		if isInRightSeat then
			for i = 1, 9 do
				if DoesExtraExist(pVeh, i) then
					if IsVehicleExtraTurnedOn(pVeh, i) then
						RageUI.Button("~r~Désactiver~s~ l'extra " .. i, false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
						onSelected = function()
							SetVehicleExtra(pVeh, i, true)
						end
					}) 
					else
						RageUI.Button("~g~Activer~s~ l'extra " .. i, false, {RightBadge = RageUI.BadgeStyle.Car}, true, {
							onSelected = function()
								SetVehicleExtra(pVeh, i, false)
						end
					})
					end
				end
			end
		else
			RageUI.Separator("Vous devez etre conducteur dans un véhicule")
		end
	else
		RageUI.Separator("Vous devez etre dans un véhicule")
	end
end


----------limitateur 
local open = false 

local MenuSpeed = RageUI.CreateMenu("Gestion Véhicule", "INTERACTION")
local MenuSpeed = RageUI.CreateSubMenu(MenuSpeed, "Limiteur de vitesse", "INTERACTION")
MenuSpeed.Display.Header = true MenuSpeed.Closed = function() open = false end

-- Pour calculer la vitesse > Vitesse/3.6 Exemple 30/3.6 = 8.33 (puis arrondir)
local limit, speedLimitActive, door, hood, chest = "Aucune Limitation", false, 1, 1, 1

	function OpenMenuSpeedLimit() 
		if open then open = false RageUI.Visible(MenuSpeed, false) return else open = true RageUI.Visible(MenuSpeed, true)
			Citizen.CreateThread(function()
				while open do 
					RageUI.IsVisible(MenuSpeed, function()
						local plyPed = PlayerPedId()
						local plyVehicle = GetVehiclePedIsIn(plyPed, false)
						CarSpeed = GetEntitySpeed(plyVehicle) * 3.6
							RageUI.Separator("↓     ~g~Personalisé     ~s~↓")
							RageUI.Button("Limitation: ~r~"..limit, nil, {RightLabel = "~y~→"}, true, {
								onSelected = function()
									if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
										local speedlimit = KeyboardInput("Rentrer une vitesse", "", 10)
										limit, speedLimitActive = speedlimit.."km/h", true
										SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), speedlimit/3.7)
									else
										ESX.ShowNotification("Vous devez être dans un véhicule !")
									end
								end
							})

							RageUI.Separator("↓     ~g~Limiteur de vitesse     ~s~↓")
							RageUI.Button("Limitation ~g~30km/h", nil, {RightLabel = "~y~→"}, true, {
								onSelected = function()
									if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
										speedLimitActive = true
										SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 8.1)
									else
										ESX.ShowNotification("Vous devez être dans un véhicule !")
									end
								end
							})

							RageUI.Button("Limitation ~g~50km/h", nil, {RightLabel = "~y~→"}, true, {
								onSelected = function()
									if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
										speedLimitActive = true
										SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 13.7)
									else
										ESX.ShowNotification("Vous devez être dans un véhicule !")
									end
								end
							})
	
							RageUI.Button("Limitation ~g~80km/h", nil, {RightLabel = "~y~→"}, true, {
								onSelected = function()
									if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
										speedLimitActive = true
										SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 22.0)
									else
										ESX.ShowNotification("Vous devez être dans un véhicule !")
									end
								end
							})
	
							RageUI.Button("Limitation ~g~120km/h", nil, {RightLabel = "~y~→"}, true, {
								onSelected = function()
									if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
										speedLimitActive = true
										SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 33.0)
									else
										ESX.ShowNotification("Vous devez être dans un véhicule !")
									end
								end
							})
	
							RageUI.Separator("↓     ~o~Désactiver     ~s~↓")
							RageUI.Button("Désactivation", nil, {RightLabel = "~y~→"}, true, {
								onSelected = function()
									if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
										limit, speedLimitActive = "Aucune Limitation", false
										SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 0.0)
									else
										ESX.ShowNotification("Vous devez être dans un véhicule !")
									end
								end
							})		
					end)
				Wait(0)
				end
			end)
		end
	end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end

RegisterCommand("speed", function(source, args, rawcommand) 
    OpenMenuSpeedLimit() 
end, false)
----
-------
---------------Fin gestion voiture


---------------Debut Porte Feuille
-------
----

function portefeuilles()
    RageUI.Button('Facture', false, {RightLabel = ">"}, true, {
    	onSelected = function()
    		RefreshFacture()    
    	end
    },subfacture)
    RageUI.Button('Mes Papier', false, {RightLabel = ">"}, true, {}, mespapiers)    
    -- Argent
    if liquide ~=nil then
    	RageUI.List("Liquide : ~g~".. liquide .." €", Argent.liste, Argent.liquide.Index, nil, {}, true, {
    		onListChange = function(Index)  
    			Argent.liquide.Index = Index;
    		end,
    		onSelected = function(Index)
    			Argent.liquide[Index]()
    		end,
    	})
    end     
    if bank ~= nil then 
        RageUI.Button("Banque : ~b~".. bank .." €", false, {}, true, {}) -- Le fait de call en boucle la fonction GroupDigits doit causer une grosse monté en MS, faudrait préparer ça dans la fonction refresh, le save dans une variable et afficher la variable ici
    end
    if blackmoney ~=nil then 
    RageUI.List("Argent Sale : ~r~".. blackmoney .." €", Argent.liste, Argent.Sale.Index, nil, {}, true, {  
    	onListChange = function(Index)
    		Argent.Sale.Index = Index;
    	end,
    	onSelected = function(Index)
    		Argent.Sale[Index]()
    	end,
    })
    end
    RageUI.Button("Métier : ".. ESX.PlayerData.job.label .. " - " .. ESX.PlayerData.job.grade_label, false, {}, true, {})
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
    	RageUI.Button("Gestion Entreprise", false, {RightLabel = ">"}, true, {
    		onSelected = function()
    			RefreshMoneyBoss()
    		end
    	},gestentreprise)
    end
    RageUI.Button("Organisation : ".. ESX.PlayerData.job2.label .. " - " .. ESX.PlayerData.job2.grade_label, false, {}, true, {})
    if ESX.PlayerData.org ~= nil and ESX.PlayerData.job2.grade_name == 'boss' then
    	RageUI.Button("Gestion Organisation ", false, {RightLabel = ">"}, true, {})
    end
end

-------- Papier
function license()
    RageUI.List("Carte d'identitée", Papier.liste, Papier.carteidentite.Index, nil, {}, true, {
		onListChange = function(Index)
			Papier.carteidentite.Index = Index;
		end,
		onSelected = function(Index)
			Papier.carteidentite[Index]()
		end,
	})
	RageUI.List("Permis de conduire", Papier.liste, Papier.permis.Index, nil, {}, true, {
		onListChange = function(Index)
			Papier.permis.Index = Index;
		end,
		onSelected = function(Index)
			Papier.permis[Index]()
		end,
	})
	RageUI.List("Permis de port d'arme", Papier.liste, Papier.ppa.Index, nil, {}, true, {
		onListChange = function(Index)
			Papier.ppa.Index = Index;
		end,
		onSelected = function(Index)
			Papier.ppa[Index]()
		end,
	})
	--[[RageUI.List("Attestation médical", Papier.liste, Papier.medical.Index, nil, {}, true, {
		onListChange = function(Index)
			Papier.medical.Index = Index;
		end,
		onSelected = function(Index)
			Papier.medical[Index]()
		end,
	})]]
end

---Gestion Gestion Entreprise

function enterprise()
    if foltone.societymoney ~= nil then
        RageUI.Button("Argent Société : ~g~"..foltone.societymoney.."~s~ €", false, {}, true, {})
    end
    RageUI.Button("Recruter", false, {}, true, {
        onSelected = function()
           GestionEntreprise.recruter()
        end
    })
    RageUI.Button("Promouvoir", false, {}, true,{
        onSelected = function()
            GestionEntreprise.promouvoir()
        end
    })
    RageUI.Button("Rétrograder", false, {}, true, {
        onSeleted = function()
            GestionEntreprise.destituer()
        end
    })
    RageUI.Button("Virer", false, {RightBadge = RageUI.BadgeStyle.Alert}, true, {
        onSeleted = function ()
            GestionEntreprise.virer()
        end
    })
end


