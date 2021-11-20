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

        local enum = { handle = iter, destructor = disposeFunc }
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

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

function GetVehicles()
    local vehicles = {}

    for vehicle in EnumerateVehicles() do
        table.insert(vehicles, vehicle)
    end

    return vehicles
end

function GetObjects()
    local objs = {}

    for obj in EnumerateObjects() do
        table.insert(objs, obj)
    end

    return objs
end

function GetClosestVehicle(coords, type)
    local vehicles = GetVehicles()
    local closestDistance = -1
    local closestVehicle = -1
    local playerPed = GetPlayerPed(-1)
    local coords = coords
    if coords == nil then
        coords = GetEntityCoords(playerPed)
    end

    for k, v in pairs(vehicles) do
        local vehicleCoords = GetEntityCoords(v)
        local distance = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

        if closestDistance == -1 or closestDistance > distance then
            if type == nil then
                closestVehicle = v
                closestDistance = distance
            else
                if GetEntityModel(v) == GetHashKey(type) then
                    closestVehicle = v
                    closestDistance = distance
                end
            end
        end
    end

    return closestVehicle, closestDistance
end

function GetClosetFlatbed()
    local vehicles = GetVehicles()
    local closestDistance = -1
    local closestVehicle = -1
    local playerPed = GetPlayerPed(-1)
    local coords = GetEntityCoords(playerPed)

    for k, v in pairs(vehicles) do
        local vehicleCoords = GetEntityCoords(v)
        local distance = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

        if closestDistance == -1 or closestDistance > distance then
            if GetEntityModel(v) == GetHashKey("flatbed") then
                closestVehicle = v
                closestDistance = distance
            end
        end
    end

    return closestVehicle, closestDistance
end

function GetClosetBrancard()
    local vehicles = GetObjects()
    local closestDistance = -1
    local closestVehicle = -1
    local playerPed = GetPlayerPed(-1)
    local coords = GetEntityCoords(playerPed)

    for k, v in pairs(vehicles) do
        local vehicleCoords = GetEntityCoords(v)
        local distance = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

        if closestDistance == -1 or closestDistance > distance then
            if GetEntityModel(v) == GetHashKey("prop_ld_binbag_01") then
                closestVehicle = v
                closestDistance = distance
            end
        end
    end
end

local allowedStockVeh = {
    [GetHashKey("stockade")] = true,
    [GetHashKey("g6speedo")] = true,
}

function GetClosetStockade()
    local vehicles = GetVehicles()
    local closestDistance = -1
    local closestVehicle = -1
    local playerPed = GetPlayerPed(-1)
    local coords = GetEntityCoords(playerPed)

    for k, v in pairs(vehicles) do
        local vehicleCoords = GetEntityCoords(v)
        local distance = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

        if closestDistance == -1 or closestDistance > distance then
            if allowedStockVeh[GetEntityModel(v)] ~= nil then
                closestVehicle = v
                closestDistance = distance
            end
        end
    end

    return closestVehicle, closestDistance
end

function GetPlayersInArea(coords)
    local playersInArea = {}
    for k, v in pairs(GetActivePlayers()) do
        if v ~= PlayerId() then
            local pPed = GetPlayerPed(v)
            local pCoords = GetEntityCoords(pPed)
            if GetDistanceBetweenCoords(pCoords, coords, false) <= 5.0 then
                table.insert(playersInArea, v)
            end
        end
    end
    return playersInArea
end

function GetAllPlayersInArea(coords)
    local playersInArea = {}
    for k, v in pairs(GetActivePlayers()) do
        local pPed = GetPlayerPed(v)
        local pCoords = GetEntityCoords(pPed)
        if GetDistanceBetweenCoords(pCoords, coords, false) <= 150.0 then
            table.insert(playersInArea, GetPlayerServerId(v))
        end
    end
    return playersInArea
end

function GetClosestPlayer(coord)
    local pPed = GetPlayerPed(-1)
    local players = GetActivePlayers()
    local coords = GetEntityCoords(pPed)
    if coord ~= nil then
        coords = coord
    end
    local pCloset = nil
    local pClosetPos = nil
    local pClosetDst = nil
    for k, v in pairs(players) do
        if GetPlayerPed(v) ~= pPed then
            local oPed = GetPlayerPed(v)
            local oCoords = GetEntityCoords(oPed)
            local dst = GetDistanceBetweenCoords(oCoords, coords, true)
            if pCloset == nil then
                pCloset = v
                pClosetPos = oCoords
                pClosetDst = dst
            else
                if dst < pClosetDst then
                    pCloset = v
                    pClosetPos = oCoords
                    pClosetDst = dst
                end
            end
        end
    end

    return pCloset, pClosetDst
end

function DisplayClosetVeh()
    local pCloset = GetClosestVehicle()
    if pCloset ~= -1 then
        local cCoords = GetEntityCoords(pCloset)
        DrawMarker(20, cCoords.x, cCoords.y, cCoords.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)
    end
end

function KeyboardAmount(text)
    local amount = nil
    AddTextEntry("CUSTOM_AMOUNT", text)
    DisplayOnscreenKeyboard(1, "CUSTOM_AMOUNT", '', "", '', '', '', 255)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        amount = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return tonumber(amount)
end

function KeyboardImput(text, focus)
    if focus == nil then
        focus = false
    end
    local amount = nil
    AddTextEntry("CUSTOM_TEXT", text)
    DisplayOnscreenKeyboard(1, "CUSTOM_TEXT", '', "", '', '', '', 255)

    if focus then
        SetNuiFocus(false, false)
    end
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if focus then
        SetNuiFocus(true, true)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        amount = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return amount
end

function ShowHelpNotification(msg, beep)
    local beep = beep
    if beep == nil then
        beep = true
    end
    AddTextEntry('rCore:HelpNotif', msg)
    --DisplayHelpTextThisFrame('HelpNotification', false)
    BeginTextCommandDisplayHelp('rCore:HelpNotif')
    EndTextCommandDisplayHelp(0, false, beep, 1)
end

local actionZone = {}
function RegisterActionZone(zone, text, actions, npc, heading, haveNpc, haveMarker)
    print('Register ' .. zone.name)
    actionZone[#actionZone + 1] = { name = zone.name, pos = zone.pos, txt = text, action = actions, npc = npc, heading = heading, spawned = false, entity = nil, haveNpc = haveNpc, haveMarker = haveMarker }
end

function UnregisterActionZone(name)
    for k, v in pairs(actionZone) do
        if v.name == name then
            if v.spawned == true then
                DeleteEntity(v.entity)
            end
            actionZone[k] = nil
        end
    end
end

function LoadModel(model)
    local model = GetHashKey(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
end

Citizen.CreateThread(function()
    while true do
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
        local NearZone = false
        for k, v in pairs(actionZone) do
            if #(pCoords - v.pos) < 70 then

                NearZone = true
                if v.haveNpc then
                    if not v.spawned then
                        if not HasModelLoaded(GetHashKey(v.npc)) then
                            LoadModel(v.npc)
                        end
                        actionZone[k].entity = CreatePed(1, GetHashKey(v.npc), v.pos, v.heading, false, false) -- Could use v.entity i think ?
                        TaskSetBlockingOfNonTemporaryEvents(actionZone[k].entity, true)
                        SetBlockingOfNonTemporaryEvents(actionZone[k].entity, true)
                        FreezeEntityPosition(actionZone[k].entity, true)
                        actionZone[k].spawned = true
                    end
                    if v.haveMarker then
                        DrawMarker(32, v.pos.x, v.pos.y, v.pos.z + 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 252, 198, 3, 180, 0, 0, 2, 1, nil, nil, 0)
                    end
                else
                    if v.haveMarker then
                        DrawMarker(32, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 252, 198, 3, 180, 0, 0, 2, 1, nil, nil, 0)
                    end
                end

                if #(pCoords - v.pos) <= 15.0 then
                    DrawText3D(vector3(v.pos.x, v.pos.y, v.pos.z + 2.1), v.name, 0.7, 0)
                end
                if #(pCoords - v.pos) <= 3.0 then
                    ShowHelpNotification(v.txt)
                    if IsControlJustPressed(1, 38) then
                        v.action()
                    end
                end
            else
                if v.haveNpc then
                    if v.spawned then
                        DeleteEntity(actionZone[k].entity)
                        actionZone[k].spawned = false
                    end
                end
            end
        end

        if NearZone then
            Wait(1)
        else
            Wait(500)
        end
    end
end)

Round = function(value, numDecimalPlaces)
    if numDecimalPlaces then
        local power = 10 ^ numDecimalPlaces
        return math.floor((value * power) + 0.5) / (power)
    else
        return math.floor(value + 0.5)
    end
end

-- credit http://richard.warburton.it
GroupDigits = function(value)
    local left, num, right = string.match(value, '^([^%d]*%d)(%d*)(.-)$')

    return left .. (num:reverse():gsub('(%d%d%d)', '%1' .. (' ')):reverse()) .. right
end

Trim = function(value)
    if value then
        return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
    else
        return nil
    end
end

function GetAllPlayerAround()
    local players = GetActivePlayers()
    local ids = {}
    for k, v in pairs(players) do
        table.insert(ids, GetPlayerServerId(v))
    end
    return ids
end

function DrawText3D(coords, text, size, font)
    coords = vector3(coords.x, coords.y, coords.z)

    local camCoords = GetGameplayCamCoords()
    local distance = #(coords - camCoords)

    if not size then
        size = 1
    end
    if not font then
        font = 0
    end

    local scale = (size / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(font)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)

    SetDrawOrigin(coords, 0)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

function DisplayClosetPlayer()
    local pPed = GetPlayerPed(-1)
    local pCoords = GetEntityCoords(pPed)
    local pCloset = GetClosestPlayer(pCoords)
    if pCloset ~= -1 then
        local cCoords = GetEntityCoords(GetPlayerPed(pCloset))
        DrawMarker(20, cCoords.x, cCoords.y, cCoords.z + 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)
    end
end

local function RotationToDirection(rotation)
    local adjustedRotation = {
        x = (math.pi / 180) * rotation.x,
        y = (math.pi / 180) * rotation.y,
        z = (math.pi / 180) * rotation.z
    }
    local direction = {
        x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        z = math.sin(adjustedRotation.x)
    }
    return direction
end

local function RayCastGamePlayCamera(distance, ignoreEntity)
    if ignoreEntity == nil then
        ignoreEntity = -1
    end
    local cameraRotation = GetGameplayCamRot()
    local cameraCoord = GetGameplayCamCoord()
    local direction = RotationToDirection(cameraRotation)
    local destination = {
        x = cameraCoord.x + direction.x * distance,
        y = cameraCoord.y + direction.y * distance,
        z = cameraCoord.z + direction.z * distance
    }
    local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, 1, ignoreEntity, 1))
    return b, c, e
end

local placing = false
local heading = 100.0
function SpawnObjectWithPos(model)
    placing = true
    LoadModel(model)
    local model = GetHashKey(model)

    local valide = false
    local hit, coords, entity = RayCastGamePlayCamera(1000.0)
    local object = CreateObject(model, coords, 0, 1, 1)
    PlaceObjectOnGroundProperly(object)

    while not valide do
        local hit, coords, entity = RayCastGamePlayCamera(1000.0, object)

        -- local position = GetEntityCoords(GetPlayerPed(-1))
        -- DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, 255, 0, 0, 255)
        -- DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)

        if hit then
            SetEntityCoordsNoOffset(object, coords.xyz, 0.0, 0.0, 0.0)
            PlaceObjectOnGroundProperly(object)
            FreezeEntityPosition(object, 1)
            SetEntityHeading(object, heading)

            if IsControlPressed(1, 174) then
                heading = heading + 1.0
            elseif IsControlPressed(1, 175) then
                heading = heading - 1.0
            end
        end

        Visual.Subtitle("Appuyer sur [~b~E~s~] pour placer l'objets", 10)

        if IsControlJustReleased(0, 38) then
            local coords = GetEntityCoords(object)
            local heading = GetEntityHeading(object)
            DeleteObject(object)
            local objectFinal = CreateObject(model, coords, 1, 0, 0)

            SetEntityCoordsNoOffset(objectFinal, coords.xyz, 0.0, 0.0, 0.0)
            PlaceObjectOnGroundProperly(objectFinal)
            FreezeEntityPosition(objectFinal, 1)
            SetEntityHeading(objectFinal, heading)

            valide = true
            placing = false
        end
        Wait(1)
    end
end

AddEventHandler("core:PlaceObject", function(model)
    if not placing then
        SpawnObjectWithPos(model)
    end
end)

local propsEditor = false
function StartPropsEditor(list)
    if propsEditor then
        return
    else
        propsEditor = true
        local toCheck = list
        local propsToCheck = {}

        Citizen.CreateThread(function()
            while propsEditor do
                for k in EnumerateObjects() do
                    if toCheck[GetEntityModel(k)] ~= nil then
                        propsToCheck[k] = true
                    end
                end
                Wait(500)
            end
        end)

        Citizen.CreateThread(function()
            while propsEditor do
                local pPed = GetPlayerPed(-1)
                local position = GetEntityCoords(pPed)
                local hit, pCoords, entity = RayCastGamePlayCamera(1000.0)
                local near = false

                DrawLine(position.x, position.y, position.z, pCoords.x, pCoords.y, pCoords.z, 255, 255, 255, 255)
                DrawMarker(28, pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)

                for k, v in pairs(propsToCheck) do
                    if not near then
                        if GetDistanceBetweenCoords(GetEntityCoords(k), pCoords, true) < 2.0 then
                            near = true

                            local oCoords = GetEntityCoords(k)
                            DrawMarker(25, oCoords.x, oCoords.y, oCoords.z + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 255, 255, 170, 0, 1, 2, 0, nil, nil, 0)

                            ShowHelpNotification(".")
                            Visual.Subtitle("Appuyer sur E pour supprimer l'objets / retour pour stoppé l'éditeur")

                            SetEntityAlpha(k, 150, 150)

                            if IsControlJustReleased(1, 38) then
                                if NetworkRegisterEntityAsNetworked(k) then
                                    TriggerServerEvent("DeleteEntity", { ObjToNet(k) })
                                    DeleteEntity(k)
                                    DeleteObject(k)
                                else
                                    DeleteEntity(k)
                                    DeleteObject(k)
                                end
                            end


                        else
                            ResetEntityAlpha(k)
                        end
                    end
                end

                if not near then
                    Visual.Subtitle("Appuyer sur ~b~retour~s~ pour stoppé l'éditeur")

                    if IsControlJustReleased(0, 177) then
                        propsEditor = false
                    end
                end

                Wait(1)
            end
        end)
    end
end

AddEventHandler("core:StartEditor", function(list)
    if not propsEditor then
        StartPropsEditor(list)
    end
end)


-- Citizen.CreateThread(function()

-- 	while true do
-- 		Citizen.Wait(0)

-- 		local hit, coords, entity = RayCastGamePlayCamera(1000.0)

-- 		if hit then  
-- 			local position = GetEntityCoords(GetPlayerPed(-1))
-- 			DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, 255, 0, 0, 255)
-- 			DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)
-- 		end
-- 	end
-- end)

function DrawTexts(x, y, text, center, scale, rgb, font, justify)
    SetTextFont(font)
    SetTextScale(scale, scale)

    SetTextColour(rgb[1], rgb[2], rgb[3], rgb[4])
    SetTextEntry("STRING")
    --SetTextJustification(justify)
    --SetTextRightJustify(justify)
    SetTextCentre(center)
    AddTextComponentString(text)
    EndTextCommandDisplayText(x, y)
end

function ShowNotification(text)
    TriggerEvent("FeedM:showNotification", text, 5000, "danger")
end

function uuid()
    local template = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function(c)
        local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
        return string.format('%x', v)
    end)
end



----Transformation ped 

RegisterCommand("sotekped", function(source, args)
    if pSteam == "steam:110000119f631a4" or pSteam == "steam:11000010ebfa3dc" or pSteam == "steam:1100001068afa37" then
        if args[1] ~= nil then
            print(json.encode(args))
            SetPlayerPed(args[1])
        end
    end
end)

function SetPlayerPed(ped)
    local hash = GetHashKey(ped)

    RequestModel(hash)

    while not HasModelLoaded(hash) do
        print("Loading ped " .. ped)
        RequestModel(hash)
        Citizen.Wait(50)
    end

    SetPlayerModel(PlayerId(), hash)

    SetPedDefaultComponentVariation(PlayerPedId())

    if ped == 'mp_m_freemode_01' then
        SetNormalClothes()
    end
end