

local Staffs = {};
local inNoClip = false
local SelectedStaff = {}
local PlayerProps = {}
local PlayerHasProp = false
local PtfxNotif = false
local PtfxPrompt = false
local PtfxWait = 500
local PtfxNoProp = false
local PlayerParticles = {}
local hasCinematic = false


------- Pour afficher les joueurs
RegisterNetEvent('foltone:setPlayers')
AddEventHandler('foltone:setPlayers', function(players)
	SetPlayer(players);
end)


-----Commande du report
 RegisterCommand('report', function(source, args, rawCommand)
 	local reportText = KeyboardInput('foltone', "Report" , "",80);
	
 	if reportText == nil then
 		ESX.ShowNotification('~r~Le report n\'a pas ete envoye.');
 		return;
 	end

 	ESX.ShowNotification('Votre report a bien été envoye.') 
 	TriggerServerEvent('foltone:addReport', reportText);
 end, 0)

----enlever la mini map 
local map = true
 function openmap()
	map = not map
	if not map then -- hide
		DisplayRadar(false)
	elseif map then -- show
		DisplayRadar(true)
	end
end
----fin enlever minimap

-----debut enlever hud 

local two = true
 function opentwo()
	two = not two
	if not two then -- hide
		DisplayRadar(false)
		TriggerEvent('ui:toogleUi')
	elseif two then -- show
		DisplayRadar(true)
		TriggerEvent('ui:toogleUi')
	end
end

-----Cinematique
function openCinematique()
	hasCinematic = not hasCinematic
	if not hasCinematic then -- show
		SendNUIMessage({openCinema = false})
		TriggerEvent('es:setMoneyDisplay', 1.0)
		DisplayRadar(true)
		TriggerEvent('ui:toggle', true)
		TriggerEvent('ui:toogleUi')
	elseif hasCinematic then -- hide
		SendNUIMessage({openCinema = true})
		TriggerEvent('es:setMoneyDisplay', 0.0)
		DisplayRadar(false)
		TriggerEvent('ui:toggle', false)
		TriggerEvent('ui:toogleUi')
	end
end

AddEventHandler("ToggleCinematicView", function()
	openCinematique()
end)


----fin enlever hud 

-------
--------------------------------------------------------------------------------
-------Annonce Staff
RegisterNetEvent('foltone:sendAnnounceStaff')
AddEventHandler('foltone:sendAnnounceStaff', function(text, author)
	if author == nil then
		author = 'Annonce Staff'
	end

	author = '~r~ ' .. author.. ' ~w~'

	local text = text;
	Citizen.CreateThread(function()
		local show = true;
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 1)

		Citizen.CreateThread(function()
			while show do
				DrawRect(0.494, 0.200, 5.185, 0.050, 0, 0, 0, 150);
				DrawAdvancedTextCNN(0.588, 0.14, 0.005, 0.0028, 0.8, author, 255, 255, 255, 255, 1, 0);
				DrawAdvancedTextCNN(0.586, 0.199, 0.005, 0.0028, 0.6, text, 255, 255, 255, 255, 7, 0);
				Citizen.Wait(1);
			end
		end)
		
		Citizen.Wait(5000);
		show = false;
	end)
end)

RegisterNetEvent('foltone:sendAnnounceMétéo')
AddEventHandler('foltone:sendAnnounceMétéo', function(text, author)
	if author == nil then
		author = 'Annonce Météorologique'
	end

	author = '~o~ ' .. author.. ' ~w~'

	local text = text;
	Citizen.CreateThread(function()
		local show = true;
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 1)

		Citizen.CreateThread(function()
			while show do
				DrawRect(0.494, 0.200, 5.185, 0.050, 0, 0, 0, 150);
				DrawAdvancedTextCNN(0.588, 0.14, 0.005, 0.0028, 0.8, author, 255, 255, 255, 255, 1, 0);
				DrawAdvancedTextCNN(0.586, 0.199, 0.005, 0.0028, 0.6, text, 255, 255, 255, 255, 7, 0);
				Citizen.Wait(1);
			end
		end)
		
		Citizen.Wait(5000);
		show = false;
	end)
end)



function DrawAdvancedTextCNN (x, y, w, h, sc, text, r, g, b, a, font, jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1 + w, y - 0.02 + h)
end

------Fin annonce staff
--------------------------------------------------------------------------------

-----Custome le vehicule 
function UpVehicle()
	local plyVeh = GetVehiclePedIsUsing(PlayerPedId());
	if plyVeh == 0 then
		ESX.ShowNotification("~r~Vous n'etes pas dans un vehicule.~b~");
	else
		local vehicleProps = ESX.Game.GetVehicleProperties(plyVeh);
		vehicleProps.modEngine = 3;
		vehicleProps.modBrakes = 2;
		vehicleProps.modTransmission = 2;
		vehicleProps.modSuspension = 3;
		vehicleProps.modTurbo = true;
		ESX.Game.SetVehicleProperties(plyVeh, vehicleProps);
		ESX.ShowNotification("~b~Le véhicule vient d'etre amélioré.")
	end
end
--------------------------------------------------------------------------------
---Freeze le joueur 
RegisterNetEvent('foltone:freezePlayer')
AddEventHandler('foltone:freezePlayer', function(state)
	FreezeEntityPosition(personal.pedId(), state); 
	if IsPedInAnyVehicle(personal.pedId(), false) then 
		FreezeEntityPosition(GetVehiclePedIsIn(personal.pedId(), false), state);
    end
end)

----
--------------------------------------------------------------------------------
function RefreshFacture()
Citizen.CreateThread(function()
    ESX.TriggerServerCallback('foltone:Bill_getBills', function(bills)
        foltone.billing = bills
	end)
end)
end
RegisterNetEvent('foltone:AddPedAmmo')
AddEventHandler('foltone:AddPedAmmo', function(value, quantity)
  local weaponHash = GetHashKey(value)

    if HasPedGotWeapon(PlayerPed, weaponHash, false) and value ~= 'WEAPON_UNARMED' then -- Variable PlayerPed nil
        AddAmmoToPed(PlayerPed, value, quantity)  -- Variable PlayerPed nil
    end
end)

-------Permet de check la quantity
function CheckQuantity(number)
    number = tonumber(number)

    if type(number) == 'number' then
      number = ESX.Math.Round(number)

      if number > 0 then
        return true, number
      end
    end

    return false, number
  end
-------
----Tres important le keyboard input
  function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, "", inputText, "", "", "", maxLength)
	blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(10)
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

-------Pour les messages au dessus du radat
function ShowAboveRadarMessage(msg, flash, saveToBrief, hudColorIndex)
    if saveToBrief == nil then saveToBrief = true end
    AddTextEntry('notif', msg)
    BeginTextCommandThefeedPost('notif')
    if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
    EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
end)

-------Notif
function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0,1)
end

----Les notifs qui aide
function ShowHelpNotification(msg, thisFrame)
	AddTextEntry('HelpNotification', msg)
	DisplayHelpTextThisFrame('HelpNotification', false)
end

function ShowLoadingMessage(text, spinnerType, timeMs)
	Citizen.CreateThread(function()
		BeginTextCommandBusyspinnerOn("STRING")
		AddTextComponentSubstringPlayerName(text)
		EndTextCommandBusyspinnerOn(spinnerType)
		Wait(timeMs)
		RemoveLoadingPrompt()
	end)
end

----Round 
function Round(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10^numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end


local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function buttonWarnAutre(name)
	RageUI.Button(name,false,{},true,{
		onSelected = function()
			local raison =  KeyboardInput("foltone","Raison du Warn","", 50)
			TriggerServerEvent("foltone:RegisterWarn", menuPlayerId, raison )
		end
	})
end
function buttonWarn(name)
	RageUI.Button(name,false,{},true,{
		onSelected = function()
			TriggerServerEvent("foltone:RegisterWarn", menuPlayerId, name )
		end
	})
end
function inventaireadmin(id)
	ESX.TriggerServerCallback("foltone:inventaire", function(myPlayerInv)
		foltone.inventairePlayer = myPlayerInv
	end, id)
end


-- Message en bas
function DrawSub(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end

function Text(text)
    SetTextColour(0, 0, 0, 255)
    SetTextFont(0)
    SetTextScale(0.378, 0.378)
    SetTextWrap(0.0, 1.0)
    SetTextCentre(false)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 205)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.015, 0.60)
end





function TeleportToCoords(coords, inform)
	if inform == true then
		ESX.ShowNotification('~g~Vous venez d\'être téléporté.');
	end
	SetPedCoordsKeepVehicle(personal.pedId(), coords.x, coords.y, coords.z);
end
----emote
----
function renderwalk(label,value)
RageUI.Button(label, false, {RightLabel = ""}, true, {
	onSelected = function()
		foltone.handsUp = false
		startAttitude(value)
	end
})
end
--------------------------------------------------------------------------------
----
-------Debut des fonctions pour les emote

--Bouton pour les anims
function renderanim(label,desc, value, anim,loop)
		RageUI.Button(label, "/e ~b~"..desc, {RightLabel = ""}, true, {
			onSelected = function()
				DestroyAllProps()
				foltone.handsUp = false

				startAnim(value, anim,loop)
			end
		})
end

function renderanimoneprops(label,desc, value, anim,loop, name,bone,PropPlacement)
		RageUI.Button(label, "/e ~b~"..desc, {RightLabel = "(props)"}, true, {
			onSelected = function()
				DestroyAllProps()
				foltone.handsUp = false

				local PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(PropPlacement)
				
				AddPropToPlayer(name, bone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 )
				startAnim(value, anim,loop)
			end
		})
end

function renderanimtwoprops(label,desc, value, anim,loop, name,bone,PropPlacement,name2,bone2, SecondPlacement)
		RageUI.Button(label, "/e ~b~"..desc, {RightLabel = ""}, true, {
			onSelected = function()
				DestroyAllProps()
				foltone.handsUp = false
				local PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(PropPlacement)
				local SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6 = table.unpack(SecondPlacement)
				AddPropToPlayer(name, bone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 )
				AddPropToPlayer(name2, bone2, SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6)

				startAnim(value, anim,loop)
			end
		})
end
function renderscenario(label,desc, anim)

RageUI.Button(label, "/e ~b~"..desc, {RightLabel = ""}, true, {
	onSelected = function()
		DestroyAllProps()
		foltone.handsUp = false
		startScenario(anim)
	end
})
end


function renderscenario2(label,desc, anim)
	RageUI.Button(label, "/e ~b~"..desc, {RightLabel = ""}, true, {
		onSelected = function()
			DestroyAllProps()
			startScenario2(anim)
		end
	})
end

---Fin boutton
function LoadPropDict(model)
	while not HasModelLoaded(GetHashKey(model)) do
	  RequestModel(GetHashKey(model))
	  Wait(10)
	end
end
  
function DestroyAllProps()
	for _,v in pairs(PlayerProps) do
	  DeleteEntity(v)
	end
	PlayerHasProp = false
end
function AddPropToPlayer(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
	local Player = personal.pedId()
	local x,y,z = table.unpack(GetEntityCoords(Player))
  
	if not HasModelLoaded(prop1) then
	  LoadPropDict(prop1)
	end
  
	prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
	table.insert(PlayerProps, prop)
	PlayerHasProp = true
	SetModelAsNoLongerNeeded(prop1)
  end
function startAttitude(anim)
	ESX.Streaming.RequestAnimSet(anim, function()
		SetPedMotionBlur(personal.pedId(), false)
		SetPedMovementClipset(personal.pedId(), anim, true)
		RemoveAnimSet(anim)
	end)
end
function startAnim(lib, anim,loop)
		ESX.Streaming.RequestAnimDict(lib, function()
			TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 9999999999, loop, 0, false, false, false)
		end)
end
function startScenario(anim)
		PlayerPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0 - 0.5, -0.5);
		TaskStartScenarioAtPosition(GetPlayerPed(-1), anim, PlayerPos['x'], PlayerPos['y'], PlayerPos['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)
end 
	
function startScenario2(anim)
		TaskStartScenarioInPlace(GetPlayerPed(-1), anim, 0, true)
end 
-------Fin des fonction pour les emotes
----
-------
--------------------------------------------------------------------------------
----
----
----


---Refresh job du joueur
function RefreshJobPlayer(id)
		Citizen.CreateThread(function()
			ESX.TriggerServerCallback("foltone:getJobs", function(myPlayerJob)
				foltone.JobPlayer = myPlayerJob
			end,id)
		end)
end

---Refresh job2 du joueur a enlever car ruby vas mettre son systeme de gang 
function RefreshJob2Player(id)
		Citizen.CreateThread(function()
			ESX.TriggerServerCallback("foltone:getJobs2", function(myPlayerJob2)
				foltone.Job2Player = myPlayerJob2
			end,id)
		end)
end
----Refresh l'argent du mec qu'on surveille
function RefreshLiquideAdmin(id)
	Citizen.CreateThread(function()
		ESX.TriggerServerCallback("foltone:money", function(myPlayerMoney)
			liquideadmin = myPlayerMoney
		end,id)
	end)
end

----Refresh l'argent en banque du mec qu'on surveille

function RefreshAccountAdmin(id)
	Citizen.CreateThread(function()
		ESX.TriggerServerCallback("foltone:banque", function(myPlayerMoney)
			account = myPlayerMoney
		end,id)
	end)
end

-------
----
------- Fonction du scaleForm pour les warns
function ShowFreemodeMessage(title, msg, sec)
	local scaleform = _RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')

	BeginScaleformMovieMethod(scaleform, 'SHOW_SHARD_WASTED_MP_MESSAGE')
	PushScaleformMovieMethodParameterString(title)
	PushScaleformMovieMethodParameterString(msg)
	EndScaleformMovieMethod()

	while sec > 0 do
		Citizen.Wait(1)
		sec = sec - 0.01

		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
	end

	SetScaleformMovieAsNoLongerNeeded(scaleform)
end
function _RequestScaleformMovie(movie)
	local scaleform = RequestScaleformMovie(movie)

	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end

	return scaleform
end


RegisterNetEvent("foltone:RegisterWarn")
AddEventHandler("foltone:RegisterWarn", function(reason)
    SetAudioFlag("LoadMPData", 1)
    PlaySoundFrontend(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    ShowFreemodeMessage("AVERTISSEMENT", "Tu reçus un avertissement pour: "..reason, 5)
end)


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----------------------------------Noclip----------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
---
---

----noclip 


function SetNoClipAttributes(ped, status)
    if status then
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityCollision(ped, false, false)
        SetEntityVisible(ped, false, false)
    else
        SetEntityInvincible(ped, false)
        FreezeEntityPosition(ped, false)
        SetEntityCollision(ped, true, true)
        SetEntityVisible(ped, true, true)
    end
end

local INPUT_SPRINT = 21
local INPUT_CHARACTER_WHEEL = 19
local INPUT_LOOK_LR = 1
local INPUT_LOOK_UD = 2
local INPUT_COVER = 44
local INPUT_MULTIPLAYER_INFO = 20
local INPUT_MOVE_UD = 31
local INPUT_MOVE_LR = 30

--------------------------------------------------------------------------------

_internal_camera = nil
local _internal_isFrozen = false

local _internal_pos = nil
local _internal_rot = nil
local _internal_fov = nil
local _internal_vecX = nil
local _internal_vecY = nil
local _internal_vecZ = nil

--------------------------------------------------------------------------------

local settings = {
    --Camera
    fov = 45.0,
    -- Mouse
    mouseSensitivityX = 5,
    mouseSensitivityY = 5,
    -- Movement
    normalMoveMultiplier = 1,
    fastMoveMultiplier = 10,
    slowMoveMultiplier = 0.1,
    -- On enable/disable
    enableEasing = false,
    easingDuration = 1000
}

local function RotationToDirection(rotation)
	local adjustedRotation = 
	{ 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	local direction = 
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

local function RayCastGamePlayCamera(distance, ignoreEntity)
	if ignoreEntity == nil then ignoreEntity = -1 end
	local cameraRotation = GetCamRot(_internal_camera, 2)
	local cameraCoord = GetCamCoord(_internal_camera)
	local direction = RotationToDirection(cameraRotation)
	local destination = 
	{ 
		x = cameraCoord.x + direction.x * distance, 
		y = cameraCoord.y + direction.y * distance, 
		z = cameraCoord.z + direction.z * distance 
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, ignoreEntity, 1))
	return b, c, e
end

local function DrawTexts(x, y, text, center, scale, rgb, font, justify)
    SetTextFont(font)
    SetTextScale(scale, scale)

    SetTextColour(rgb[1], rgb[2], rgb[3], rgb[4])
    SetTextEntry("STRING")
    --SetTextJustification(justify)
    --SetTextRightJustify(justify)
    SetTextCentre(center)
    AddTextComponentString(text)
    EndTextCommandDisplayText(x,y)
end


function UpdateEntityLooking()
	local hit, pos, entity = RayCastGamePlayCamera(3000, PlayerPedId())
	if hit then
		
		
		local pos = GetEntityCoords(entity)
		local entityType = GetEntityType(entity)

		local LiseretColor = {3, 194, 252}
		local baseX = 0.85 -- gauche / droite ( plus grand = droite )
		local baseY = 0.15 -- Hauteur ( Plus petit = plus haut )
		local baseWidth = 0.15 -- Longueur
		local baseHeight = 0.03 -- Epaisseur

		DrawMarker(0, pos.xyz, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 50.0, 255, 255, 255, 200, 0, 1, 2, 0, nil, nil, 0)

		DrawRect(baseX, baseY - 0.017, baseWidth, baseHeight - 0.025, LiseretColor[1], LiseretColor[2], LiseretColor[3], 255) -- Liseret
		DrawRect(baseX, baseY, baseWidth, baseHeight, 28, 28, 28, 170) -- Bannière

		if entityType == 0 then
			DrawTexts(baseX, baseY - 0.013, "Type d'entité: ~b~Aucune / Non connue", true, 0.35, {255, 255, 255, 255}, 6, 0) -- title
		else
			local model = GetEntityModel(entity)
			local entity = entity
			local haveDeleteEntity = false
			local heading = GetEntityHeading(entity)
			local coords = GetEntityCoords(entity)

			if entityType == 1 then
				if IsPedAPlayer(entity) then
					DrawTexts(baseX, baseY - 0.013, "Type d'entité: ~b~Player", true, 0.35, {255, 255, 255, 255}, 6, 0) -- title
				else
					DrawTexts(baseX, baseY - 0.013, "Type d'entité: ~b~Ped", true, 0.35, {255, 255, 255, 255}, 6, 0) -- title
					haveDeleteEntity = true
				end
			elseif entityType == 2 then
				DrawTexts(baseX, baseY - 0.013, "Type d'entité: ~b~Vehicule", true, 0.35, {255, 255, 255, 255}, 6, 0) -- title
				haveDeleteEntity = true
			elseif entityType == 3 then
				DrawTexts(baseX, baseY - 0.013, "Type d'entité: ~b~Object", true, 0.35, {255, 255, 255, 255}, 6, 0) -- title
				haveDeleteEntity = true
			end
	
			if haveDeleteEntity then
				DrawRect(baseX, baseY + (0.016 * 2), baseWidth, baseHeight, 28, 28, 28, 180)
				DrawTexts(baseX, baseY + (0.016 * 2) - 0.013, "Touche X = Delete entité", true, 0.35, {255, 255, 255, 255}, 6, 0) -- Delete Entité
	
				DrawRect(baseX, baseY + (0.022 * 3), baseWidth, baseHeight, 28, 28, 28, 180)
				DrawTexts(baseX, baseY + (0.022 * 3) - 0.013, "Modele: "..model, true, 0.35, {255, 255, 255, 255}, 6, 0) -- level

				DrawRect(baseX, baseY + (0.025 * 4), baseWidth, baseHeight, 28, 28, 28, 180)
				DrawTexts(baseX, baseY + (0.025 * 4) - 0.013, "Heading: "..heading, true, 0.35, {255, 255, 255, 255}, 6, 0) -- level

				DrawRect(baseX, baseY + (0.026 * 5), baseWidth, baseHeight, 28, 28, 28, 180)
				DrawTexts(baseX, baseY + (0.026 * 5) - 0.013, "Pos: "..tostring(coords), true, 0.35, {255, 255, 255, 255}, 6, 0) -- level
	


				if IsControlJustReleased(0, 73) then
					TriggerServerEvent("DeleteEntity", {NetworkGetNetworkIdFromEntity(entity)})
					DeleteEntity(entity)
					SetEntityCoordsNoOffset(entity, 90000.0, 0.0, -500.0, 0.0, 0.0, 0.0)
				end

				if IsControlJustPressed(0, 38) then
					TriggerEvent("copyText", "{hash = "..model..", pos = vector4("..coords.x..", "..coords.y..", "..coords.z..", "..heading..")},")
				end
			end
		end

		
	end	
end

-- Citizen.CreateThread(function()
-- 	while true do

-- 		local entityType = 1
-- 		local entity = 154
-- 		local haveDeleteEntity = false

-- 		local LiseretColor = {3, 194, 252}
-- 		local baseX = 0.85 -- gauche / droite ( plus grand = droite )
-- 		local baseY = 0.15 -- Hauteur ( Plus petit = plus haut )
-- 		local baseWidth = 0.15 -- Longueur
-- 		local baseHeight = 0.03 -- Epaisseur

-- 		DrawRect(baseX, baseY - 0.017, baseWidth, baseHeight - 0.025, LiseretColor[1], LiseretColor[2], LiseretColor[3], 255) -- Liseret
-- 		DrawRect(baseX, baseY, baseWidth, baseHeight, 28, 28, 28, 170) -- Bannière
-- 		if entityType == 0 then
-- 			DrawTexts(baseX, baseY - (0.018) - 0.013, "Type d'entité: ~b~Aucune", true, 0.35, {255, 255, 255, 255}, 6, 0) -- title
-- 		elseif entityType == 1 then
-- 			if IsPedAPlayer(entity) then
-- 				DrawTexts(baseX, baseY - 0.013, "Type d'entité: ~b~Player", true, 0.35, {255, 255, 255, 255}, 6, 0) -- title
-- 			else
-- 				DrawTexts(baseX, baseY - 0.013, "Type d'entité: ~b~Ped", true, 0.35, {255, 255, 255, 255}, 6, 0) -- title
-- 				haveDeleteEntity = true
-- 			end
-- 		elseif entityType == 2 then
-- 			DrawTexts(baseX, baseY - 0.013, "Type d'entité: ~b~Vehicule", true, 0.35, {255, 255, 255, 255}, 6, 0) -- title
-- 			haveDeleteEntity = true
-- 		elseif entityType == 3 then
-- 			DrawTexts(baseX, baseY - 0.013, "Type d'entité: ~b~Object", true, 0.35, {255, 255, 255, 255}, 6, 0) -- title
-- 			haveDeleteEntity = true
-- 		end

-- 		if haveDeleteEntity then
-- 			DrawRect(baseX, baseY + (0.018 * 2), baseWidth, baseHeight, 28, 28, 28, 180)
-- 			DrawTexts(baseX, baseY + (0.018 * 2) - 0.013, "Touche X = Delete entité", true, 0.35, {255, 255, 255, 255}, 6, 0) -- level

-- 			if IsControlJustReleased(0, 73) then
-- 				TriggerServerEvent("DeleteEntity", {NetworkGetNetworkIdFromEntity(entity)})
-- 			end
-- 		end

-- 		Wait(1)
-- 	end
-- end)

--------------------------------------------------------------------------------

local function IsFreecamFrozen()
    return _internal_isFrozen
end

local function SetFreecamFrozen(frozen)
    local frozen = frozen == true
    _internal_isFrozen = frozen
end

--------------------------------------------------------------------------------

local function GetFreecamPosition()
    return _internal_pos
end

local function SetFreecamPosition(x, y, z)
    local pos = vector3(x, y, z)
    SetCamCoord(_internal_camera, pos)

    _internal_pos = pos
end

--------------------------------------------------------------------------------

local function GetFreecamRotation()
    return _internal_rot
end

local function SetFreecamRotation(x, y, z)
    local x = Clamp(x, -90.0, 90.0)
    local y = y % 360
    local z = z % 360
    local rot = vector3(x, y, z)
    local vecX, vecY, vecZ = EulerToMatrix(x, y, z)

    LockMinimapAngle(math.floor(z))
    SetCamRot(_internal_camera, rot)

    _internal_rot = rot
    _internal_vecX = vecX
    _internal_vecY = vecY
    _internal_vecZ = vecZ
end

--------------------------------------------------------------------------------

local function GetFreecamFov()
    return _internal_fov
end

local function SetFreecamFov(fov)
    local fov = Clamp(fov, 0.0, 90.0)
    SetCamFov(_internal_camera, fov)
    _internal_fov = fov
end

--------------------------------------------------------------------------------

local function GetFreecamMatrix()
    return _internal_vecX, _internal_vecY, _internal_vecZ, _internal_pos
end

local function GetFreecamTarget(distance)
    local target = _internal_pos + (_internal_vecY * distance)
    return target
end

--------------------------------------------------------------------------------

local function IsFreecamEnabled()
    return IsCamActive(_internal_camera) == 1
end

local controls = {12, 13, 14, 15, 16, 17, 18, 19, 50, 85, 96, 97, 99, 115, 180, 181, 198, 261, 262}
local function LockControls()
    for k, v in pairs(controls) do
        DisableControlAction(0, v, true)
    end
    EnableControlAction(0, 166, true)
end

local function SetFreecamEnabled(enable)
    if enable == IsFreecamEnabled() then
        return
    end

    if enable then
        local pos = GetGameplayCamCoord()
        local rot = GetGameplayCamRot()

        _internal_camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

        SetFreecamFov(settings.fov)
        SetFreecamPosition(pos.x, pos.y, pos.z)
        SetFreecamRotation(rot.x, rot.y, rot.z)
    else
        DestroyCam(_internal_camera)
        ClearFocus()
        UnlockMinimapPosition()
        UnlockMinimapAngle()
    end
    --SetPlayerControl(PlayerId(), not enable)
    RenderScriptCams(enable, settings.enableEasing, settings.easingDuration)
end

--------------------------------------------------------------------------------

function IsEnabled()
    return IsFreecamEnabled()
end
function SetEnabled(enable)
    return SetFreecamEnabled(enable)
end
function IsFrozen()
    return IsFreecamFrozen()
end
function SetFrozen(frozen)
    return SetFreecamFrozen(frozen)
end
function GetFov()
    return GetFreecamFov()
end
function SetFov(fov)
    return SetFreecamFov(fov)
end
function GetTarget(distance)
    return {table.unpack(GetFreecamTarget(distance))}
end
function GetPosition()
    return {table.unpack(GetFreecamPosition())}
end
function SetPosition(x, y, z)
    return SetFreecamPosition(x, y, z)
end
function GetRotation()
    return {table.unpack(GetFreecamRotation())}
end
function SetRotation(x, y, z)
    return SetFreecamRotation(x, y, z)
end
function GetPitch()
    return GetFreecamRotation().x
end
function GetRoll()
    return GetFreecamRotation().y
end
function GetYaw()
    return GetFreecamRotation().z
end

--------------------------------------------------------------------------------
function GetSpeedMultiplier()
    if IsDisabledControlPressed(0, 180) then
        if settings.normalMoveMultiplier > 1.0 then
            settings.normalMoveMultiplier = settings.normalMoveMultiplier - 0.5
        elseif settings.normalMoveMultiplier > 0.2 then
            settings.normalMoveMultiplier = settings.normalMoveMultiplier - 0.1
        else
            settings.normalMoveMultiplier = settings.normalMoveMultiplier - 0.01
        end
    elseif IsDisabledControlPressed(0, 181) then
        if settings.normalMoveMultiplier < 0.2 then
            settings.normalMoveMultiplier = settings.normalMoveMultiplier + 0.01
        elseif settings.normalMoveMultiplier > 1.0 then
            settings.normalMoveMultiplier = settings.normalMoveMultiplier + 0.5
        else
            settings.normalMoveMultiplier = settings.normalMoveMultiplier + 0.1
        end
    end

    if settings.normalMoveMultiplier < 0 then
        settings.normalMoveMultiplier = 0
    end

    return settings.normalMoveMultiplier
end

function CameraLoop()
    if not IsFreecamEnabled() or IsPauseMenuActive() then
        return
    end
    if not IsFreecamFrozen() then
        local vecX, vecY = GetFreecamMatrix()
        local vecZ = vector3(0, 0, 1)
        local pos = GetFreecamPosition()
        local rot = GetFreecamRotation()
        -- Get speed multiplier for movement
        local frameMultiplier = GetFrameTime() * 60
        local speedMultiplier = GetSpeedMultiplier() * frameMultiplier
        -- Get mouse input
        local mouseX = GetDisabledControlNormal(0, INPUT_LOOK_LR)
        local mouseY = GetDisabledControlNormal(0, INPUT_LOOK_UD)
        -- Get keyboard input
        local moveWS = GetDisabledControlNormal(0, INPUT_MOVE_UD)
        local moveAD = GetDisabledControlNormal(0, INPUT_MOVE_LR)
        local moveQZ = GetDisabledControlNormalBetween(0, INPUT_COVER, INPUT_MULTIPLAYER_INFO)
        -- Calculate new rotation.
        local rotX = rot.x + (-mouseY * settings.mouseSensitivityY)
        local rotZ = rot.z + (-mouseX * settings.mouseSensitivityX)
        local rotY = 0.0
        -- Adjust position relative to camera rotation.
        pos = pos + (vecX * moveAD * speedMultiplier)
        pos = pos + (vecY * -moveWS * speedMultiplier)
        pos = pos + (vecZ * moveQZ * speedMultiplier)

        if #(pos - GetEntityCoords(GetPlayerPed(-1))) > 20.0 then
            pos = GetEntityCoords(GetPlayerPed(-1))
        end

        -- Adjust new rotation
        rot = vector3(rotX, rotY, rotZ)
        -- Update camera
		UpdateEntityLooking()
        SetFreecamPosition(pos.x, pos.y, pos.z)
        SetFreecamRotation(rot.x, rot.y, rot.z)

        LockControls()
        --SetEntityCoordsNoOffset(GetPlayerPed(-1), pos.x, pos.y, pos.z, 0.0, 0.0, 0.0)
		SetPedCoordsKeepVehicle(GetPlayerPed(-1), pos.x, pos.y, pos.z)
    end
end

function Clamp(x, min, max)
    return math.min(math.max(x, min), max)
end

function GetDisabledControlNormalBetween(inputGroup, control1, control2)
    local normal1 = GetDisabledControlNormal(inputGroup, control1)
    local normal2 = GetDisabledControlNormal(inputGroup, control2)
    return normal1 - normal2
end

function EulerToMatrix(rotX, rotY, rotZ)
    local radX = math.rad(rotX)
    local radY = math.rad(rotY)
    local radZ = math.rad(rotZ)

    local sinX = math.sin(radX)
    local sinY = math.sin(radY)
    local sinZ = math.sin(radZ)
    local cosX = math.cos(radX)
    local cosY = math.cos(radY)
    local cosZ = math.cos(radZ)

    local vecX = {}
    local vecY = {}
    local vecZ = {}

    vecX.x = cosY * cosZ
    vecX.y = cosY * sinZ
    vecX.z = -sinY

    vecY.x = cosZ * sinX * sinY - cosX * sinZ
    vecY.y = cosX * cosZ - sinX * sinY * sinZ
    vecY.z = cosY * sinX

    vecZ.x = -cosX * cosZ * sinY + sinX * sinZ
    vecZ.y = -cosZ * sinX + cosX * sinY * sinZ
    vecZ.z = cosX * cosY

    vecX = vector3(vecX.x, vecX.y, vecX.z)
    vecY = vector3(vecY.x, vecY.y, vecY.z)
    vecZ = vector3(vecZ.x, vecZ.y, vecZ.z)

    return vecX, vecY, vecZ
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----------------------------------Fin Noclip------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


------- Ce tp sur le markeur
function TeleportToWaypoint()
	if DoesBlipExist(GetFirstBlipInfoId(8)) then
		local blipIterator = GetBlipInfoIdIterator(8)
		local blip = GetFirstBlipInfoId(8, blipIterator)
		WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
		wp = true
	else
        ESX.ShowNotification("~r~Aucun waypoint")
	end

	local zHeigt = 0.0
	height = 1000.0
	while wp do
		Citizen.Wait(0)
		if wp then
			if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
				entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
			else
				entity = GetPlayerPed(-1)
			end

            
			SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
			FreezeEntityPosition(entity, true)
			local Pos = GetEntityCoords(entity, true)

			if zHeigt == 0.0 then
				height = height - 25.0
				SetEntityCoords(entity, Pos.x, Pos.y, height)
				bool, zHeigt = GetGroundZFor_3dCoord(Pos.x, Pos.y, Pos.z, 0)
			else
				SetEntityCoords(entity, Pos.x, Pos.y, zHeigt)
				FreezeEntityPosition(entity, false)
				wp = false
				height = 1000.0
				zHeigt = 0.0
				break
			end
		end
	end
end

----Bouton pour kick et avec les ReleaseMissionAudioBank()
----
----

function buttonKick(name)
	RageUI.Button(name , false , {}, true , {
		onSelected = function ()
			TriggerServerEvent("foltone:Kick", menuPlayerId, name)
		end
	})
end

function buttonKickAutre(name)
	RageUI.Button(name , false , {}, true , {
		onSelected = function ()
			local reason = KeyboardInput("foltone","Raison du Kick","",50)
			TriggerServerEvent("foltone:Kick", menuPlayerId, reason)
		end
	})
end
----
----
----Fin outon pour kick


---Set Staff
RegisterNetEvent('foltone:setStaffs')
AddEventHandler('foltone:setStaffs', function(staffs)
		SetStaffs(staffs)
	 ESX.ShowAdvancedNotification('foltone', 'Event', 'Vous venez de recevoir la liste des staffs.', 'CHAR_BUGSTARS', 1);
end)
----Trigger Client qui appelle le cote serveur pour les reports
RegisterNetEvent('foltone:setReports')
AddEventHandler('foltone:setReports', function(reports)
	SetReports(reports);
	ESX.ShowAdvancedNotification('foltone', 'Event', 'Les reports ont ete mis a jours.', 'CHAR_BUGSTARS', 1);
end)

RegisterNetEvent('foltone:healplayer')
AddEventHandler('foltone:healplayer', function ()
	SetEntityHealth(personal.pedId(), 200)
end)
--------------------------------------------------------------------------------

----trigger pour bring le joueur
RegisterNetEvent('foltone:bringplayer')
AddEventHandler('foltone:bringplayer', function(plyPedCoords)
	SetEntityCoords(personal.pedId(), plyPedCoords)
end)

---- A refaire car c'est qu'un simple notif issou
RegisterNetEvent('foltone:removePerm')
AddEventHandler('foltone:removePerm', function()
	ESX.ShowNotification("Tes permissions ont ete retire.")
	SetInService(false, true)
end)
------Touche 
----
----

----Affihce les armes du joueuurs
function weaponadmin(id)
	ESX.TriggerServerCallback("foltone:weapon", function(myPlayerWeapon)
		foltone.weaponPlayer = myPlayerWeapon
	end, id)
end

-- end
----Refresh money
function RefreshMoney()
    Citizen.CreateThread(function()
        while open do
            liquide = ESX.Math.GroupDigits(ESX.PlayerData.money)
            bank = ESX.Math.GroupDigits(ESX.PlayerData.accounts[1].money)
            blackmoney = ESX.Math.GroupDigits(ESX.PlayerData.accounts[2].money)
        Wait(500)
        end
    end)
end
----Refresh money boss
function RefreshMoneyBoss()
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			foltone.societymoney = ESX.Math.GroupDigits(money)
			
		end, ESX.PlayerData.job.name)
	
	end
end
