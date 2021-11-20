local doors = {}

local registeredDoors = {}
function LoockDoor(index, owner)
    local self = doors[index]
    if self.keys[pJob] ~= nil then
        if pGrade >= self.keys[pJob] then
            TriggerServerEvent("door:SyncDoorLock", index)
            TaskPlayAnim(PlayerPedId(), "anim@mp_player_intmenu@key_fob@", "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
        else
            ShowNotification("Les clés que tu possèdes ne marche pas ici.")
        end
    else
        ShowNotification("Tu ne possèdes pas les bonnes clés.")
    end
end

local inCooldown = false
local function DoorCooldown()
    Citizen.CreateThread(function()
        inCooldown = true
        Wait(2000)
        inCooldown = false
    end)
end

Citizen.CreateThread(function()
    TriggerServerEvent("door:GetFirstSync")
    while true do
        local pPed = PlayerPedId()
        local pCoords = GetEntityCoords(pPed)
        for k, v in pairs(doors) do
            local dst = GetDistanceBetweenCoords(pCoords, v.posToDisplay.xyz, true)
            while dst <= v.dstToDisplay do

                pCoords = GetEntityCoords(pPed)
                dst = GetDistanceBetweenCoords(pCoords, v.posToDisplay.xyz, true)
                DrawLine(pCoords, v.posToDisplay.xyz, 255, 255, 255, 255)

                if not inCooldown then
                    if v.status then
                        DrawText3D(v.posToDisplay, "Fermé", 0.7, 0)
                        if v.keys[pJob] ~= nil then
                            if pGrade <= v.keys[pJob] then
                                local pos = vector3(v.posToDisplay.x, v.posToDisplay.y, v.posToDisplay.z - 0.1)
                                DrawText3D(pos, "~o~Tu n'as pas les bonnes clés", 0.5, 0)
                            end
                        end
                    else
                        DrawText3D(v.posToDisplay, "Ouvert", 0.7, 0)
                    end
                else
                    DrawText3D(v.posToDisplay, "En attente ...", 0.7, 0)
                end

                if IsControlJustReleased(0, 38) and not inCooldown then
                    DoorCooldown()
                    LoockDoor(k, true)
                end

                Wait(1)
            end
        end
        Wait(500)
    end
end)

Citizen.CreateThread(function()
    while true do
        local pPed = PlayerPedId()
        local pCoords = GetEntityCoords(pPed)
        for k, v in pairs(doors) do
            for i, j in pairs(v.entityToLock) do
                local door = GetClosestObjectOfType(j.pos.xyz, 1.0, j.hash, false, false, false)
                FreezeEntityPosition(door, v.status)
            end
        end
        Wait(1000)
    end
end)

RegisterNetEvent("door:SyncDoorLock")
AddEventHandler("door:SyncDoorLock", function(index)

    local self = doors[index]
    self.status = not self.status
    for k, v in pairs(self.entityToLock) do
        local door = GetClosestObjectOfType(v.pos.xyz, 1.0, v.hash, false, false, false)

        if registeredDoors[v.hash] == nil then
            AddDoorToSystem(v.hash, v.hash, v.pos.xyz, 0, false, true)
        end

        FreezeEntityPosition(door, self.status)
        if self.status then
            SetEntityHeading(door, v.pos.w)
            SetEntityCoordsNoOffset(door, v.pos.xyz, 0.0, 0.0, 0.0)
            -- DoorSystemSetDoorState(v.hash, 1, true, true)
            -- DoorSystemSetOpenRatio(v.hash, 0.001, true, false)
        else
            -- DoorSystemSetDoorState(v.hash, 0, true, true)
            -- DoorSystemSetHoldOpen(v.hash, false)
            -- DoorSystemSetOpenRatio(v.hash, 0.0, true, false)
        end
    end
end)

RegisterNetEvent("door:GetFirstSync")
AddEventHandler("door:GetFirstSync", function(doorSync)
    doors = doorSync
end)