World = {}

function World.isSpawnPointClea(pos, dst)
    local clear = true
    local vehicles = GetVehicles()
    for k, v in pairs(vehicles) do
        if GetDistanceBetweenCoords(GetEntityCoords(v), pos, true) <= dst then
            clear = false
            break
        end
    end
    return clear
end

local blips = {}
function World.AddBlip(name, pos, sprite, scale, color)
    local blip = AddBlipForCoord(pos)

    SetBlipSprite(blip, sprite)
    SetBlipScale(blip, scale)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(name)
    EndTextCommandSetBlipName(blip)
    blips[name] = blip
end

function World.RemoveBlip(name)
    if blips[name] ~= nil then
        RemoveBlip(blips[name])
        blips[name] = nil
    end
end