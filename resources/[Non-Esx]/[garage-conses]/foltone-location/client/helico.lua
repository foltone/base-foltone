ESX = nil



helicoptere = {
    {label = "Havok", vehe = "havok", price = 100},
    {label = "Maverick", vehe = "maverick", price = 200},
}

locationshelicoptere = {
    {
        pos = vector3(-725.26025390625, -1431.7448730469, 6.5),
        preview = {pos = vector3(-724.67205810547, -1444.1264648438, 5.0005226135254), headingel = 320.55},
        outPos = {
            {pos = vector3(-724.67205810547, -1444.1264648438, 5.0005226135254), headingel = 320.55},
            {pos = vector3(-724.67205810547, -1444.1264648438, 5.0005226135254), headingel = 320.55},
            {pos = vector3(-724.67205810547, -1444.1264648438, 5.0005226135254), headingel = 320.55},
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

		for k,v in pairs(locationshelicoptere) do
			if #(v.pos - pCoords) < 3 then
				pNear = true
				pNearData = v
				if #(v.pos - pCoords) < 3 then
					Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ouvrir le ~b~Menu", 0)
					if IsControlJustReleased(1, 38) then
						OpenLocationeMenu(v)
					end
				end

				break
			end
		end

		if pNear then
			Wait(1)
			DrawMarker(34, pNearData.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 50, 59, 232, 170, 0, 0, 2, 1, nil, nil, 0)
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


function OpenLocationeMenu(self)
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
					for k,v in pairs(helicoptere) do
						RageUI.Button(v.label..' [~g~'..v.price.."$~s~]", nil, {}, true, {
							onActive = function()
								UpdateCam(v.vehe, self.preview.pos, self.preview.headingel)
							end,
							onSelected = function()
								DeleteEntity(tempVeh)
								while DoesEntityExist(tempVeh) do Wait(1000) end
								SpawnLocationheli(v.vehe, v.price, self.outPos)
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


function SpawnLocationheli(vehe, price, posPossible)
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

	RequestModel(GetHashKey(vehe))
	while not HasModelLoaded(GetHashKey(vehe)) do
		Wait(1)
	end


	local veh = CreateVehicle(GetHashKey(vehe), pos.pos, pos.headingel, true, false)
	SetVehicleNumberPlateText(vehe, "LOC-"..math.random(101,909))
	SetEntityAsMissionEntity(vehe, 1, 1)

	TriggerServerEvent("foltoneloc:Buy", price)
	ESX.ShowNotification("Achat de : ~g~"..price.."$~g~ ~w~effectué!", 1)
	ESX.ShowNotification("~b~Véhicule sortie!", 1)
end

--------- PED & BLIPS -----------
DecorRegister("Yay", 4)
pedHashe = "mp_m_waremech_01"
zonee = vector3(-725.26025390625, -1431.7448730469, 4.0005164146423)
Headinge = 320.91
Pede = nil
Citizen.CreateThread(function()
    LoadModel(pedHashe)
    Pede = CreatePed(2, GetHashKey(pedHashe), zonee, Headinge, 0, 0)
    DecorSetInt(Pede, "Yay", 5431)
    FreezeEntityPosition(Pede, 1)
    TaskStartScenarioInPlace(Pede, "WORLD_HUMAN_CLIPBOARD", 0, false)
    SetEntityInvincible(Pede, true)
    SetBlockingOfNonTemporaryEvents(Pede, 1)
    end)
function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end
Citizen.CreateThread(function()
	local blih = AddBlipForCoord(zonee)
	SetBlipSprite(blih, 43)
    SetBlipScale(blih, 0.9)
    SetBlipColour(blih, 29)
    SetBlipAsShortRange(blih, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Location d'helicopteres")
    EndTextCommandSetBlipName(blih)
end)