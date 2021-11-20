local vehWeapons = {
	GetHashKey("weapon_pumpshotgun"), -- ShotGun
	GetHashKey("weapon_carbinerifle"), -- Carbine
	GetHashKey("weapon_sniperrifle"), -- Sniper
	GetHashKey("weapon_pistol"), -- pistol
}

local hasBeenInPoliceVehicle = false
local alreadyHaveWeapon = {}

local VehToCheck = {
	[GetHashKey("sheriff2")] = true,
	[GetHashKey("sheriff")] = true,
	[GetHashKey("pranger")] = true,
	[GetHashKey("policet")] = true,
	[GetHashKey("policeb")] = true,
	[GetHashKey("police4")] = true,
	[GetHashKey("ambulance")] = true,
	[GetHashKey("police3")] = true,
	[GetHashKey("skodapn")] = true,
	[GetHashKey("partnerpn")] = true,
	[GetHashKey("megpolvir")] = true,
	[GetHashKey("polmav")] = true,
	[GetHashKey("RenaultMeg04")] = true,
	[GetHashKey("police2")] = true,
	[GetHashKey("police")] = true,
	[GetHashKey("5008pn")] = true,
	[GetHashKey("riot")] = true,
	[GetHashKey("clio5bana")] = true,
	[GetHashKey("1200rtpn")] = true,
	[GetHashKey("lguard")] = true,
	[GetHashKey("firetruk")] = true,
	[GetHashKey("fbi2")] = true,
	[GetHashKey("fbi")] = true,
	[GetHashKey("dust17")] = true,
	[GetHashKey("dust171")] = true,
	[GetHashKey("Helicopompier")] = true,
	[GetHashKey("b429")] = true,
	[GetHashKey("stockade")] = true,
	[GetHashKey("g6perennial")] = true,
	[GetHashKey("g6buffalos")] = true,
	[GetHashKey("g6speedo")] = true,
	[GetHashKey("g6stockade")] = true,
}

Citizen.CreateThread(function()
	while true do
		Wait(3000)
		if IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) or VehToCheck[GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false))] ~= nil then
			if not hasBeenInPoliceVehicle then
				hasBeenInPoliceVehicle = true
			end
		else
			if hasBeenInPoliceVehicle then
				for i,k in pairs(vehWeapons) do
					if not alreadyHaveWeapon[i] then
						RemoveWeaponFromPed(GetPlayerPed(-1), k)
					end
				end
				hasBeenInPoliceVehicle = false
			end
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
			for i=1,#vehWeapons do
				if HasPedGotWeapon(GetPlayerPed(-1), vehWeapons[i], false) == 1 then
					alreadyHaveWeapon[i] = true
				else
					alreadyHaveWeapon[i] = false
				end
			end
		end
		Citizen.Wait(3000)
	end
end)
Citizen.CreateThread(function()
	while true do
		ClearPlayerWantedLevel(PlayerPedId())
		Wait(3000)
	end
end)


Citizen.CreateThread(function()
	for i = 1, 20 do 
		EnableDispatchService(i, false) 
	end

	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_HILLBILLY"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_BALLAS"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MEXICAN"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_FAMILY"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MARABUNTE"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_SALVA"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("GANG_1"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("GANG_2"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("GANG_9"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("GANG_10"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("FIREMAN"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("MEDIC"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("COP"), GetHashKey('PLAYER'))

    while true do
        Citizen.Wait(3000)
		
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.

		SetVehicleModelIsSuppressed(GetHashKey("frogger"), true)
		SetVehicleModelIsSuppressed(GetHashKey("buzzard2"), true)
		SetVehicleModelIsSuppressed(GetHashKey("frogger2"), true)
		SetVehicleModelIsSuppressed(GetHashKey("polmav"), true)
		SetVehicleModelIsSuppressed(GetHashKey("stunt"), true)



			SetPedDensityMultiplierThisFrame(0.0)
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			SetVehicleDensityMultiplierThisFrame(0.0)
			SetAmbientVehicleRangeMultiplierThisFrame(0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3000)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
end)