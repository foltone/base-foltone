ESX = nil

 

------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	TriggerServerEvent('boutique:getpoints')
	if pointjoueur == nil then pointjoueur = 0 end
	while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
	end
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        ESX.TriggerServerCallback('boutique:GetCodeBoutique', function(thecode)
            code = thecode
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        ESX.TriggerServerCallback('boutique:GetCodeBoutique', function(thecode)
            code = thecode
        end)
    end    
end)

RegisterNetEvent("Boutique:Notification")
AddEventHandler("Boutique:Notification", function(message)
    ESX.ShowNotification("~o~Boutique : " .. message)
end)

------------------------------------------------------------------------------------------------------------

fullcustom = false
curentvehicle_name = ""
curentvehicle_model = ""
curentvehicle_finalpoint = 0

 

---------------------------------------------------------------------

RMenu.Add('boutique', 'main', RageUI.CreateMenu("Boutique V2", "Menu boutique"))
RMenu.Add('boutique', 'vehiclemenu', RageUI.CreateSubMenu(RMenu:Get('boutique', 'main'), "Véhicules", "Menu Véhicule"))
RMenu.Add('boutique', 'vehiclemenuparam', RageUI.CreateSubMenu(RMenu:Get('boutique', 'vehiclemenu'), "Paramètres", " "))
RMenu.Add('boutique', 'armesmenu', RageUI.CreateSubMenu(RMenu:Get('boutique', 'main'), "Armes", "Menu d'armes"))
RMenu.Add('boutique', 'moneymenu', RageUI.CreateSubMenu(RMenu:Get('boutique', 'main'), "Argent", "Menu d'argent"))
RMenu:Get('boutique', 'main').Closable = false
RMenu:Get("boutique", "main").Closed = function()
    boutiquemgl = false
end

---------------------------------------------------------------------

function openboutique()
    if boutiquemgl then
        boutiquemgl = false
        RageUI.CloseAll()
    else
        boutiquemgl = true
        RageUI.Visible(RMenu:Get("boutique","main"), true)
        Citizen.CreateThread(function()
            while boutiquemgl do
                Citizen.Wait(1)
		RageUI.IsVisible(RMenu:Get('boutique', 'main'), true, true, true, function()

	  	RageUI.Separator("~b~Tu as ~r~"..pointjoueur.." "..moneypoints, nil, {}, true, function(_, _, _) end)

			if menu_vehicule then
				RageUI.ButtonWithStyle("Véhicules", nil, { RightLabel = "→" },true, function() 
				end, RMenu:Get('boutique', 'vehiclemenu'))
			end

			if menu_vehicule then
				RageUI.ButtonWithStyle("Armes", nil, { RightLabel = "→" },true, function() 
				end, RMenu:Get('boutique', 'armesmenu'))
			end

			if menu_money then
				RageUI.ButtonWithStyle("Argent", nil, { RightLabel = "→" },true, function() 
				end, RMenu:Get('boutique', 'moneymenu'))
			end

			if donner_point then
			    RageUI.ButtonWithStyle("Donner des "..moneypoints, "Donner à sois même = perte de crédit(s)", {}, true,function(h,a,s)
                		if s then
                    local boutique_id = KeyboardInput('ID_BOUTIQUE', "Merci d'entrer l'id boutique de vôtre ami", '', 50)
                    local point = KeyboardInput('ID_BOUTIQUE', "Merci de spécifier le nombre de crédit(s) que vous souhaitez donner", '', 50)
                    ESX.TriggerServerCallback('Boutique:DonnePoint', function(callback)
                        if callback then
                           ESX.ShowNotification("~g~Transfert reussi !")
                        else
                            ESX.ShowNotification("~r~Vous n'avez pas assez de crédit(s) !")
                        end
                    end, point, boutique_id)
                end
          		end, nil)  
			end   

			RageUI.ButtonWithStyle("~r~Quitter", nil, {},true, function(h, a, s)
				if s then
					RageUI.CloseAll()
				end
			end)
		end)


		 

		
		RageUI.IsVisible(RMenu:Get('boutique', 'vehiclemenu'), true, true, true, function()
			for k, itemv in pairs(item_vehicule) do
				
				RageUI.ButtonWithStyle(itemv.name, nil, { RightLabel = "~r~"..tostring(itemv.point).." ~b~"..moneypoints },true, function(h, a, s)
					if a then 
						RenderSprite("RageUI", itemv.img, 0, 565, 430, 200, 100)
					end
					if s then
						curentvehicle_name = itemv.name
						curentvehicle_model = itemv.model
						curentvehicle_point = itemv.point
						curentvehicle_finalpoint = itemv.point
						curentvehicle_place = itemv.place
						curentvehicle_vitesse = itemv.vitesse
					end
				end, RMenu:Get('boutique', 'vehiclemenuparam'))
			end
		end)

		RageUI.IsVisible(RMenu:Get('boutique', 'vehiclemenuparam'), true, true, true, function()


			RageUI.Separator("~b~"..curentvehicle_name.." ~r~"..curentvehicle_point.." ~g~"..moneypoints, nil, {}, true, function(_, _, _) end)

			RageUI.Separator("~o~Vitesse max : ~s~".. curentvehicle_vitesse .."~o~km/h")

			RageUI.Separator("~o~Nombre de siège : ~s~".. curentvehicle_place)

			RageUI.ButtonWithStyle("Essayer le véhicule", "Permet d'essayer le véhicule 20 secondes", { }, true, function(h, a, s)
				if s then
				 	posessaie = GetEntityCoords(PlayerPedId())
					Wait(500)
					spawnuniCar(curentvehicle_model)
				end
			end)

			RageUI.Checkbox("Full custom", nil, superJump,{},function(Hovered,Ative,Selected,Checked)
				if (Selected) then
					superJump = Checked
					if Checked then
						fullcustom = true
						curentvehicle_finalpoint = curentvehicle_point + customprice
					else 
						fullcustom = false
						curentvehicle_finalpoint = curentvehicle_finalpoint - customprice
					end
				end
			end)

			RageUI.ButtonWithStyle("~b~Acheter", nil, {RightLabel = ""}, true, function(h, a, s)
				if s then
					if pointjoueur >= curentvehicle_finalpoint then
						give_vehi(curentvehicle_model)
						buying(curentvehicle_finalpoint)
					else
						ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
					end
				end
			end)

			RageUI.Separator("Cout de l'achat: ~r~"..curentvehicle_finalpoint.." ~g~"..moneypoints, nil, {}, true, function(_, _, _) end)

		end)

		RageUI.IsVisible(RMenu:Get('boutique', 'armesmenu'), true, true, true, function()
			for k, itemar in pairs(item_arme) do
                RageUI.ButtonWithStyle(itemar.name, nil, {RightLabel = "~r~"..tostring(itemar.point).." ~b~"..moneypoints}, true, function(h, a, s)
					if a then 
						RenderSprite("RageUI", itemar.img, 0, 520, 430, 200, 100)
					end
					if s then

						curentvehicle_name = itemar.name
						curentvehicle_model = itemar.model
						curentvehicle_point = itemar.point
						curentvehicle_finalpoint = itemar.point

						if pointjoueur >= curentvehicle_finalpoint then
							buying(curentvehicle_finalpoint)
							garme(curentvehicle_model, curentvehicle_name)
						else
							ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
						end
					end
				end)
			end
		end)


		RageUI.IsVisible(RMenu:Get('boutique', 'armesmenu'), true, true, true, function()
			for k, itemar in pairs(item_arme) do
                RageUI.ButtonWithStyle(itemar.name, nil, {RightLabel = "~r~"..tostring(itemar.point).." ~b~"..moneypoints}, true, function(h, a, s)
					if a then 
						RenderSprite("RageUI", itemar.img, 0, 520, 430, 200, 100)
					end
					if s then

						curentvehicle_name = itemar.name
						curentvehicle_model = itemar.model
						curentvehicle_point = itemar.point
						curentvehicle_finalpoint = itemar.point

						if pointjoueur >= curentvehicle_finalpoint then
							buying(curentvehicle_finalpoint)
							garme(curentvehicle_model, curentvehicle_name)
						else
							ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
						end
					end
				end)
			end
		end)


		RageUI.IsVisible(RMenu:Get('boutique', 'moneymenu'), true, true, true, function()
			for k, itemmoy in pairs(item_money) do
                RageUI.ButtonWithStyle(itemmoy.name, nil, {RightLabel = "~r~"..tostring(itemmoy.point).." ~b~"..moneypoints}, true, function(h, a, s)
					if a then 
						RenderSprite("RageUI", itemmoy.img, 0, 300, 430, 200, 100)
					end
					if s then

						curentvehicle_name = itemmoy.name
						curentvehicle_model = itemmoy.model
						curentvehicle_point = itemmoy.point
						curentvehicle_finalpoint = itemmoy.point

						if pointjoueur >= curentvehicle_finalpoint then
							buying(curentvehicle_finalpoint)
							gmoney(curentvehicle_model, curentvehicle_name)
						else
							ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
						end
					end
				end)
			end
		end)


end
end)
Citizen.Wait(0)
end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0, touche_open_menu) then
			TriggerServerEvent('boutique:getpoints')
			openboutique()
		end
	end
end)

function spawnuniCar(car)
    local car = GetHashKey(car)
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, -899.62, -3298.74, 13.94, 58.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true) 
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
	SetVehicleDoorsLocked(vehicle, 4)
	ESX.ShowNotification("Vous avez 20 secondes pour tester le véhicule.")
	local timer = 20
	local breakable = false
	breakable = false
	while not breakable do
		Wait(1000)
		timer = timer - 1
		if timer == 10 then
			ESX.ShowNotification("Il vous reste plus que 10 secondes.")
		end
		if timer == 5 then
			ESX.ShowNotification("Il vous reste plus que 5 secondes.")
		end
		if timer <= 0 then
			local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
			DeleteEntity(vehicle)
			ESX.ShowNotification("~r~Vous avez terminé la période d'essai.")
			SetEntityCoords(PlayerPedId(), posessaie)
			breakable = true
			break
		end
	end
end

 

function buying(point)
	if pointjoueur >= point then
		TriggerServerEvent('boutique:deltniop', point)
		Citizen.Wait(300)
		TriggerServerEvent('boutique:getpoints')
	else
		TriggerEvent('esx:showNotification', '~r~Tu ne peut pas acheter cet article.')
	end
end

RegisterNetEvent('boutique:retupoints')
AddEventHandler('boutique:retupoints', function(point)
	pointjoueur = point
end)


local voituregive = {}

function give_vehi(veh)
	TriggerEvent('esx:showAdvancedNotification', 'Boutique', '', 'Vous avez reçu votre :\n '..veh, img_notif, 3)
    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
    
    Citizen.Wait(10)
    ESX.Game.SpawnVehicle(veh, {x = plyCoords.x+2 ,y = plyCoords.y, z = plyCoords.z+2}, 313.4216, function (vehicle)
			local plate = GetVehicleNumberPlateText(vehicle)
			table.insert(voituregive, vehicle)		
            print(plate)
            local vehicleProps = ESX.Game.GetVehicleProperties(voituregive[#voituregive])
            vehicleProps.plate = plate
            SetVehicleNumberPlateText(voituregive[#voituregive] , plate)
			TriggerServerEvent('shop:vehiculeboutique', vehicleProps, plate)
	end)
end 



function garme(w,n)
	TriggerEvent('esx:showAdvancedNotification', '~o~Boutique', '', 'Vous avez reçu votre :\n'..n, img_notif, 3)
	TriggerServerEvent('give:weapon', w)
end

 

function gmoney(w,n)
	TriggerEvent('esx:showAdvancedNotification', '~o~Boutique', '', 'Vous avez reçu vos :\n'..n, img_notif, 3)
	TriggerServerEvent('give:money', w)
end

function FullVehicleBoost(vehicle)
	SetVehicleModKit(vehicle, 0)
	SetVehicleMod(vehicle, 14, 0, true)
	SetVehicleNumberPlateTextIndex(vehicle, 5)
	ToggleVehicleMod(vehicle, 18, true)
	SetVehicleColours(vehicle, 0, 0)
	SetVehicleModColor_2(vehicle, 5, 0)
	SetVehicleExtraColours(vehicle, 111, 111)
	SetVehicleWindowTint(vehicle, 2)
	ToggleVehicleMod(vehicle, 22, true)
	SetVehicleMod(vehicle, 23, 11, false)
	SetVehicleMod(vehicle, 24, 11, false)
	SetVehicleWheelType(vehicle, 120)
	SetVehicleWindowTint(vehicle, 3)
	ToggleVehicleMod(vehicle, 20, true)
	SetVehicleTyreSmokeColor(vehicle, 0, 0, 0)
	LowerConvertibleRoof(vehicle, true)
	SetVehicleIsStolen(vehicle, false)
	SetVehicleIsWanted(vehicle, false)
	SetVehicleHasBeenOwnedByPlayer(vehicle, true)
	SetVehicleNeedsToBeHotwired(vehicle, false)
	SetCanResprayVehicle(vehicle, true)
	SetPlayersLastVehicle(vehicle)
	SetVehicleFixed(vehicle)
	SetVehicleDeformationFixed(vehicle)
	SetVehicleTyresCanBurst(vehicle, false)
	SetVehicleWheelsCanBreak(vehicle, false)
	SetVehicleCanBeTargetted(vehicle, false)
	SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
	SetVehicleHasStrongAxles(vehicle, true)
	SetVehicleDirtLevel(vehicle, 0)
	SetVehicleCanBeVisiblyDamaged(vehicle, false)
	IsVehicleDriveable(vehicle, true)
	SetVehicleEngineOn(vehicle, true, true)
	SetVehicleStrong(vehicle, true)
	RollDownWindow(vehicle, 0)
	RollDownWindow(vehicle, 1)
	
	SetPedCanBeDraggedOut(PlayerPedId(), false)
	SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
	SetPedRagdollOnCollision(PlayerPedId(), false)
	ResetPedVisibleDamage(PlayerPedId())
	ClearPedDecorations(PlayerPedId())
	SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)
end


 

function Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, true)
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
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