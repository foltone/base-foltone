ESX = nil



vehInLocation = {
    {label = "Scooter", veh = "faggio", price = 100},
    {label = "Panto", veh = "panto", price = 200},
}

locations = {
    {
        pos = vector3(-490.9016418457, -670.20709228516, 34),
        preview = {pos = vector3(-490.64624023438, -667.91076660156, 32.763580322266), heading = 270.0},
        outPos = {
            {pos = vector3(-490.64624023438, -667.91076660156, 32.763580322266), heading = 270.0},
            {pos = vector3(-490.64624023438, -667.91076660156, 32.763580322266), heading = 270.0},
            {pos = vector3(-490.64624023438, -667.91076660156, 32.763580322266), heading = 270.0},
        },
    },
}

                                                                              

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


Citizen.CreateThread(function()
	while true do
		local pPed = GetPlayerPed(-1)
		local pCoords = GetEntityCoords(pPed)
		local pNear = false
		local pNearData = {}

		for k,v in pairs(locations) do
			if #(v.pos - pCoords) < 3 then
				pNear = true
				pNearData = v
				if #(v.pos - pCoords) < 3 then
					Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ouvrir le ~b~Menu", 0)
					if IsControlJustReleased(1, 38) then
						OpenLocationMenu(v)
					end
				end

				break
			end
		end

		if pNear then
			Wait(1)
			DrawMarker(36, pNearData.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 50, 59, 232, 170, 0, 0, 2, 1, nil, nil, 0)
		else
			Wait(1000)
		end
	end
end)


local open = false
local menu = RageUI.CreateMenu("Location", "~b~Location de véhicule")
menu.Closed = function()
    open = false
end

function OpenLocationMenu(self)
	if open then
		open = false
		return
	else
		RageUI.Visible(menu, true)
		open = true
		Citizen.CreateThread(function()
			while open do
				RageUI.IsVisible(menu, function()
					RageUI.Separator("↓ Véhicule disponible ↓")
					for k,v in pairs(vehInLocation) do
						RageUI.Button(v.label..' [~g~'..v.price.."$~s~]", nil, {}, true, {
							onActive = function()
								UpdateCam(v.veh, self.preview.pos, self.preview.heading)
							end,
							onSelected = function()
								DeleteEntity(tempVeh)
								while DoesEntityExist(tempVeh) do Wait(1000) end
								SpawnLocationVehicle(v.veh, v.price, self.outPos)
								open = false
							end,
						});
					end
				end)
				Wait(1)
			end
			stopprevue()
		end)
	end
end


function SpawnLocationVehicle(veh, price, posPossible)
	----ESX.ShowNotification("Recherche de place pour sortir votre véhicule ...", 0, 0)
	local pos = nil
	local free = false
	local possible = #posPossible
	local count = 0
	while not free do
		local choosen = posPossible[math.random(1, #posPossible)]
		count = count + 1
		if ESX.Game.IsSpawnPointClear(choosen.pos, 2) then
			pos = choosen
			free = true
		end
		if count >= possible then
			ESX.ShowNotification("~r~Un vehicule est deja sorti!", 0, 0)
			return
		end
		Wait(1)
	end

	RequestModel(GetHashKey(veh))
	while not HasModelLoaded(GetHashKey(veh)) do
		Wait(1)
	end


	local veh = CreateVehicle(GetHashKey(veh), pos.pos, pos.heading, true, false)
	SetVehicleNumberPlateText(veh, "LOC-"..math.random(101,909))
	SetEntityAsMissionEntity(veh, 1, 1)

	TriggerServerEvent("foltoneloc:Buy", price)
	ESX.ShowNotification("Achat de : ~g~"..price.."$~g~ ~w~effectué!", 1)
	ESX.ShowNotification("~b~Véhicule sortie!", 1)
end

--------- PED & BLIPS -----------
DecorRegister("Yay", 4)
pedHash = "u_m_m_bankman"
zone = vector3(-490.9016418457, -670.20709228516, 31.881477355957)
Heading = 180.00
Ped = nil
Citizen.CreateThread(function()
    LoadModel(pedHash)
    Ped = CreatePed(2, GetHashKey(pedHash), zone, Heading, 0, 0)
    DecorSetInt(Ped, "Yay", 5431)
    FreezeEntityPosition(Ped, 1)
    TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_CLIPBOARD", 0, false)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, 1)
    end)
function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(zone)
	SetBlipSprite(blip, 227)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 29)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Location de véhicules")
    EndTextCommandSetBlipName(blip)
end)
