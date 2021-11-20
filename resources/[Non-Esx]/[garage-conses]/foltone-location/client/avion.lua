ESX = nil



avion = {
    {label = "Alphaz1", veha = "alphaz1", price = 100},
    {label = "Stunt", veha = "stunt", price = 200},
}

locationsavion = {
    {
        pos = vector3(-1104.3565673828, -2943.2658691406, 15.2),
        preview = {pos = vector3(-1114.9061279297, -2942.8972167969, 13.945165634155), headingav = 325.5},
        outPos = {
            {pos = vector3(-1114.9061279297, -2942.8972167969, 13.945165634155), headingav = 325.5},
            {pos = vector3(-1114.9061279297, -2942.8972167969, 13.945165634155), headingav = 325.5},
            {pos = vector3(-1114.9061279297, -2942.8972167969, 13.945165634155), headingav = 325.5},
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

		for k,v in pairs(locationsavion) do
			if #(v.pos - pCoords) < 3 then
				pNear = true
				pNearData = v
				if #(v.pos - pCoords) < 3 then
					Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ouvrir le ~b~Menu", 0)
					if IsControlJustReleased(1, 38) then
						OpenLocationaMenu(v)
					end
				end
				break
			end
		end

		if pNear then
			Wait(1)
			DrawMarker(33, pNearData.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 50, 59, 232, 170, 0, 0, 2, 1, nil, nil, 0)
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


function OpenLocationaMenu(self)
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
					for k,v in pairs(avion) do
						RageUI.Button(v.label..' [~g~'..v.price.."$~s~]", nil, {}, true, {
							onActive = function()
								UpdateCam(v.veha, self.preview.pos, self.preview.headingav)
							end,
							onSelected = function()
								DeleteEntity(tempVeh)
								while DoesEntityExist(tempVeh) do Wait(1000) end
								SpawnLocationAvion(v.veha, v.price, self.outPos)
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


function SpawnLocationAvion(veha, price, posPossible)
	--ESX.ShowNotification("Recherche de place pour sortir votre véhicule ...", 0, 0)
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

	RequestModel(GetHashKey(veha))
	while not HasModelLoaded(GetHashKey(veha)) do
		Wait(1)
	end


	local veh = CreateVehicle(GetHashKey(veha), pos.pos, pos.headingav, true, false)
	SetVehicleNumberPlateText(veha, "LOC-"..math.random(101,909))
	SetEntityAsMissionEntity(veha, 1, 1)

	TriggerServerEvent("foltoneloc:Buy", price)
	ESX.ShowNotification("Achat de : ~g~"..price.."$~g~ ~w~effectué!", 1)
	ESX.ShowNotification("~b~Véhicule sortie!", 1)
end

--------- PED & BLIPS -----------
DecorRegister("Yay", 4)
pedHasha = "s_m_m_pilot_01"
zonea = vector3(-1104.3565673828, -2943.2658691406, 12.94523525238)
Headinga = 245.00
Peda = nil
Citizen.CreateThread(function()
    LoadModel(pedHasha)
    Peda = CreatePed(2, GetHashKey(pedHasha), zonea, Headinga, 0, 0)
    DecorSetInt(Peda, "Yay", 5431)
    FreezeEntityPosition(Peda, 1)
    TaskStartScenarioInPlace(Peda, "WORLD_HUMAN_CLIPBOARD", 0, false)
    SetEntityInvincible(Peda, true)
    SetBlockingOfNonTemporaryEvents(Peda, 1)
    end)
function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end
Citizen.CreateThread(function()
	local blipa = AddBlipForCoord(zonea)
	SetBlipSprite(blipa, 307)
    SetBlipScale(blipa, 0.9)
    SetBlipColour(blipa, 29)
    SetBlipAsShortRange(blipa, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Location d'avions")
    EndTextCommandSetBlipName(blipa)
end)