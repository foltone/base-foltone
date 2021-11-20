Player = {}
Player.group = "user"

function Player.ped()
    return PlayerPedId()
end

function Player.pos()
    return GetEntityCoords(Player.ped())
end

function Player.heading()
    return GetEntityHeading(Player.ped())
end

function Player.currentVeh()
    return GetVehiclePedIsIn(Player.ped(), false)
end

function Player.lastVeh()
    return GetVehiclePedIsIn(Player.ped(), true)
end

function Player.isInVeh()
    return IsPedInAnyVehicle(Player.ped(), false)
end

function Player.GetServerId()
    return GetPlayerServerId(GetPlayerIndex())
end

function Player.RefreshGroup()
    ESX.TriggerServerCallback('Sotek:AdmingetUsergroup', function(group)
        Player.group = group
    end)
end

function Player.isStaff()
    return Player.group ~= "superadmin"
end