Vehicle = {}

function Vehicle.OpenHood(entity)
    TriggerServerEvent("mecano:OpenDoor", GetAllPlayersInArea(Player.pos()), VehToNet(entity), true, 4)
end

function Vehicle.CloseHood(entity)
    TriggerServerEvent("mecano:OpenDoor", GetAllPlayersInArea(Player.pos()), VehToNet(entity), false, 4)
end