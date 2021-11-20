ESX = nil



bateaux = {
    {label = "Dinghy", vehb = "dinghy4", price = 100},
    {label = "Jet-Ski", vehb = "seashark3", price = 200},
}

locationsbateau = {
    {
        pos = vector3(-719.60455322266, -1325.8153076172, 3.0),
        preview = {pos = vector3(-722.97955322266, -1327.2263183594, -0.47481167316437), headingba = 225.36},
        outPos = {
            {pos = vector3(-722.97955322266, -1327.2263183594, -0.47481167316437), headingba = 225.36},
            {pos = vector3(-722.97955322266, -1327.2263183594, -0.47481167316437), headingba = 225.36},
            {pos = vector3(-722.97955322266, -1327.2263183594, -0.47481167316437), headingba = 225.36},
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

		for k,v in pairs(locationsbateau) do
			if #(v.pos - pCoords) < 3 then
				pNear = true
				pNearData = v
				if #(v.pos - pCoords) < 3 then
					Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ouvrir le ~b~Menu", 0)
					if IsControlJustReleased(1, 38) then
						OpenLocationbMenu(v)
					end
				end

				break
			end
		end

		if pNear then
			Wait(1)
			DrawMarker(35, pNearData.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 50, 59, 232, 170, 0, 0, 2, 1, nil, nil, 0)
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


function OpenLocationbMenu(self)
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
					for k,v in pairs(bateaux) do
						RageUI.Button(v.label..' [~g~'..v.price.."$~s~]", nil, {}, true, {
							onActive = function()
								UpdateCam(v.vehb, self.preview.pos, self.preview.headingba)
							end,
							onSelected = function()
								DeleteEntity(tempVeh)
								while DoesEntityExist(tempVeh) do Wait(1000) end
								SpawnLocationBateau(v.vehb, v.price, self.outPos)
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


function SpawnLocationBateau(vehb, price, posPossible)
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

	RequestModel(GetHashKey(vehb))
	while not HasModelLoaded(GetHashKey(vehb)) do
		Wait(1)
	end


	local veh = CreateVehicle(GetHashKey(vehb), pos.pos, pos.headingba, true, false)
	SetVehicleNumberPlateText(vehb, "LOC-"..math.random(101,909))
	SetEntityAsMissionEntity(vehb, 1, 1)

	TriggerServerEvent("foltoneloc:Buy", price)
	ESX.ShowNotification("Achat de : ~g~"..price.."$~g~ ~w~effectué!", 1)
	ESX.ShowNotification("~b~Véhicule sortie!", 1)
end

--------- PED & BLIPS -----------
DecorRegister("Yay", 4)
pedHashb = "s_m_y_uscg_01"
zoneb = vector3(-719.60455322266, -1325.8153076172, 0.596288561821)
Headingb = 55.00
Pedb = nil
Citizen.CreateThread(function()
    LoadModel(pedHashb)
    Pedb = CreatePed(2, GetHashKey(pedHashb), zoneb, Headingb, 0, 0)
    DecorSetInt(Pedb, "Yay", 5431)
    FreezeEntityPosition(Pedb, 1)
    TaskStartScenarioInPlace(Pedb, "WORLD_HUMAN_CLIPBOARD", 0, false)
    SetEntityInvincible(Pedb, true)
    SetBlockingOfNonTemporaryEvents(Pedb, 1)
    end)
function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end
Citizen.CreateThread(function()
	local blipb = AddBlipForCoord(zoneb)
	SetBlipSprite(blipb, 427)
    SetBlipScale(blipb, 0.9)
    SetBlipColour(blipb, 29)
    SetBlipAsShortRange(blipb, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Location de bateaux")
    EndTextCommandSetBlipName(blipb)
end)