ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function SpawnVehicle(vehicle, plate)
    x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))

	ESX.Game.SpawnVehicle(vehicle.model, {
		x = x,
		y = y,
		z = z 
	}, GetEntityHeading(PlayerPedId()), function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
		SetVehRadioStation(callback_vehicle, "OFF")
		SetVehicleFixed(callback_vehicle)
		SetVehicleDeformationFixed(callback_vehicle)
		SetVehicleUndriveable(callback_vehicle, false)
		SetVehicleEngineOn(callback_vehicle, true, true)
		--SetVehicleEngineHealth(callback_vehicle, 1000) -- Might not be needed
		--SetVehicleBodyHealth(callback_vehicle, 1000) -- Might not be needed
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
	end)
	TriggerServerEvent('dpr_core:breakVehicleSpawn', plate, false)
end

function ReturnVehicle()
	local playerPed  = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed,  false) then
		local playerPed    = GetPlayerPed(-1)
		local coords       = GetEntityCoords(playerPed)
		local vehicle      = GetVehiclePedIsIn(playerPed, false)
		local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
		local current 	   = GetPlayersLastVehicle(GetPlayerPed(-1), true)
		local engineHealth = GetVehicleEngineHealth(current)
		local plate        = vehicleProps.plate

		ESX.TriggerServerCallback('dpr_core:returnVehicle', function(valid)
			if valid then
                BreakReturnVehicle(vehicle, vehicleProps)
			else
				ESX.ShowNotification('Tu ne peu pas garer ce véhicule')
			end
		end, vehicleProps)
	else
		ESX.ShowNotification('Il n y a pas de véhicule à rangé dans le garage.')
	end
end

function BreakReturnVehicle(vehicle, vehicleProps)
	ESX.Game.DeleteVehicle(vehicle)
	TriggerServerEvent('dpr_core:breakVehicleSpawn', vehicleProps.plate, true)
	ESX.ShowNotification("Tu vien de ranger ton ~r~véhicule ~s~!")
end

-- Garage
CreateThread(function()
    while true do
		local wait = 750

			for k in pairs(Config.Positions.Garage) do
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			local pos = Config.Positions.Garage
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

			if dist <= Config.MarkerDistance then
				wait = 1
				DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, 3, 252, 65, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  

				if dist <= 2.0 then
				wait = 1
					Visual.Subtitle(Config.TextGarage, 1) 
					if IsControlJustPressed(1,51) then
						ESX.TriggerServerCallback('dpr_core:vehiclelist', function(ownedCars)
                            Garage.vehiclelist = ownedCars
                        end)
						OpenMenuGarage()
					end
				end
			end
    	end
	Wait(wait)
	end
end)

-- Fourrière 
Citizen.CreateThread(function()
    while true do
		local wait = 750

			for k in pairs(Config.Positions.Pound) do
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			local pos = Config.Positions.Pound
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

			if dist <= Config.MarkerDistance then
				wait = 0
				DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, 252, 157, 3, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  

				if dist <= 2.0 then
				wait = 0
					Visual.Subtitle(Config.TextPound, 1) 
					if IsControlJustPressed(1,51) then
						ESX.TriggerServerCallback('dpr_core:vehiclelistfourriere', function(ownedCars)
                            Pound.poundlist = ownedCars
                        end)
						OpenMenuPound()
					end
				end
			end
    	end
	Wait(wait)
	end
end)

-- Ranger 
Citizen.CreateThread(function()
    while true do
		local wait = 750

			for k in pairs(Config.Positions.Return) do
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			local pos = Config.Positions.Return
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

			if dist <= Config.MarkerDistance then
                wait = 1
                DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, 252, 3, 3, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  

				if dist <= 2.0 then
				wait = 1
					Visual.Subtitle(Config.TextReturn, 1) 
					if IsControlJustPressed(1,51) then
						ReturnVehicle()
					end
				end
			end
    	end
	Wait(wait)
	end
end)


Citizen.CreateThread(function()
    if Config.Blip then
        for k, v in pairs(Config.posblipgarage) do
            local blip = AddBlipForCoord(v.x, v.y, v.z)

            SetBlipSprite(blip, 50)
            SetBlipScale (blip, 0.7)
            SetBlipColour(blip, 12)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName('Garage')
            EndTextCommandSetBlipName(blip)
        end

		for k, v in pairs(Config.Positions.Pound) do
            local blip = AddBlipForCoord(v.x, v.y, v.z)

            SetBlipSprite(blip, 477)
            SetBlipScale (blip, 0.7)
            SetBlipColour(blip, 9)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName('Fourriere')
            EndTextCommandSetBlipName(blip)
        end
    end
end)