ESX = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Configwash = {}

Configwash.Locale = 'en'

Configwash.EnablePrice = true
Configwash.Price = 250

Configwash.Locations = {
	vector3(26.5906, -1392.0261, 27.3634),
	vector3(167.1034, -1719.4704, 27.2916),
	vector3(-74.5693, 6427.8715, 29.4400),
	vector3(-699.6325, -932.7043, 17.0139)
}

Citizen.CreateThread(function()
	for i=1, #Configwash.Locations, 1 do
		carWashLocation = Configwash.Locations[i]

		local blip = AddBlipForCoord(carWashLocation)
		SetBlipSprite(blip, 100)
		SetBlipScale(blip, 0.6)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('Lavage-Auto')
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local canSleep = true

		if CanWashVehicle() then

			for i=1, #Configwash.Locations, 1 do
				local carWashLocation = Configwash.Locations[i]
				local distance = GetDistanceBetweenCoords(coords, carWashLocation, true)

				if distance < 50 then
					DrawMarker(1, carWashLocation, 0, 0, 0, 0, 0, 0, 5.0, 5.0, 2.0, 0, 157, 0, 155, false, false, 2, false, false, false, false)
					canSleep = false
				end

				if distance < 5 then
					canSleep = false

					if Configwash.EnablePrice then
						ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour laver le véhicule pour ~g~250 $~s~', ESX.Math.GroupDigits(Configwash.Price))
					else
						ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour laver le véhicule')
					end

					if IsControlJustReleased(0, 38) then
						local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

						if GetVehicleDirtLevel(vehicle) > 2 then
							WashVehicle()
						else
							ESX.ShowNotification('votre véhicule n\'a pas besoin d\'un lavage.')
						end
					end
				end
			end

			if canSleep then
				Citizen.Wait(500)
			end

		else
			Citizen.Wait(500)
		end
	end
end)

function CanWashVehicle()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)

		if GetPedInVehicleSeat(vehicle, -1) == playerPed then
			return true
		end
	end

	return false
end

function WashVehicle()
	ESX.TriggerServerCallback('esx_carwash:canAfford', function(canAfford)
		if canAfford then
			local vehicle = GetVehiclePedIsIn(PlayerPedId())
			SetVehicleDirtLevel(vehicle, 0.1)

			if Configwash.EnablePrice then
				ESX.ShowNotification('Votre véhicule a été lavé pour ~g~250 $~s~', ESX.Math.GroupDigits(Configwash.Price))
			else
				ESX.ShowNotification('Votre véhicule a été lavé')
			end
			Citizen.Wait(5000)
		else
			ESX.ShowNotification('vous ne pouvez pas vous permettre un lavage de voiture')
			Citizen.Wait(5000)
		end
	end)
end
