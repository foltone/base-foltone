local self

personal = {
    pedId = function()
        return PlayerPedId()
    end,

    headingped = function()
        return GetEntityHeading(personal.pedId())
    end,

    coordped = function()
        return GetEntityCoords(personal.pedId())
    end,

    invincibleplayer = function(boolean)
        return SetEntityInvincible(vehicle.ped(),boolean)
    end,


    invisibleplayer = function(boolean)
        return SetEntityVisible(vehicle.ped(),boolean,false)
    end,

    freeze = function(label,boolean)
        FreezeEntityPosition(label, boolean); 
        if IsPedInAnyVehicle(label, false) then 
            FreezeEntityPosition(GetVehiclePedIsIn(label, false), boolean);
        end
    end

}

utils = {
    loadModel = function(model)
        local model = GetHashKey(model)
        if IsModelInCdimage(model) then
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(0)
            end
            SetModelAsNoLongerNeeded(model) -- On le décharge de la mémoire, il sera réellement supprimé plus tard automatiquement par le jeu
            return true
        else
            -- TODO: Faire une notification d'erreur
            return false
        end
    end,
}
vehicle = {

    ped = function()
        return GetPlayerPed(-1)
    end,

    currentVehicle = function()
        return GetVehiclePedIsIn(GetPlayerPed(-1), false)
    end,

    Temp = function ()
         return GetVehicleEngineTemperature(vehicle.currentVehicle())
    end,

    Health = function ()
        return GetVehicleEngineHealth(vehicle.currentVehicle())
    end,

    vehicleOn = function ()
        return SetVehicleEngineOn(vehicle.currentVehicle(), true, false, true)
    end,
    
    vehicleOff = function ()
        return SetVehicleEngineOn(vehicle.currentVehicle(), false, false, true)
    end,

    Oil = function ()
        return GetVehicleOilLevel(vehicle.currentVehicle())
    end,

    vehicleengine = function ()
        return GetIsVehicleEngineRunning(vehicle.currentVehicle())
    end,
    

    pedinvehicle = function()
        return  IsPedSittingInAnyVehicle( vehicle.ped() )
    end,

    angledoor = function(arg)
        return GetVehicleDoorAngleRatio(vehicle.currentVehicle(), arg) > 0.0
        
    end,

    opendoor = function(arg)
        return SetVehicleDoorOpen(vehicle.currentVehicle(), arg, false)
    end,

    closedoor = function(arg)
        return SetVehicleDoorShut(vehicle.currentVehicle(), arg, false)
    end,

    downwindo = function(arg)
          window = RollDownWindow(vehicle.currentVehicle(),arg) 
    end,

    upwindo = function(arg)
        return RollUpWindow(vehicle.currentVehicle(),arg)
    end,

    getvehicledirection = function()
        return ESX.Game.GetVehicleInDirection()
    end,

    createVehicle = function(model)
        ESX.Game.SpawnVehicle(model, personal.coordped(), personal.headingped(), function(vehicle)
            TaskWarpPedIntoVehicle(personal.pedId(),  vehicle, -1)
        end)
    end,

    clothestVeh = function(coord)
        return GetClosestVehicle(coord,10.0,0,70)
    end,

    delete = function()
        local player = personal.pedId()
        local vehicle   = vehicle.getvehicledirection()
        if IsPedInAnyVehicle(player, true) then
            vehicle = GetVehiclePedIsIn(player, false)
        end
    
        if DoesEntityExist(vehicle) then
            ESX.Game.DeleteVehicle(vehicle)
        end
    end,

    kmh = function()
        return DecorGetFloat(vehicle.currentVehicle(), "VEH_KM")

    end,

    createVehicle = function(model, pos, heading)
        utils.loadModel(model)
        local veh = CreateVehicle(GetHashKey(model), pos.xyz, heading, true, false)
        SetVehicleOnGroundProperly(veh)
        TaskWarpPedIntoVehicle(vehicle.ped(), veh, -1)
        return veh
    end,
    createVehicleLocal = function(model, pos, heading)
        utils.loadModel(model)
        local veh = CreateVehicle(GetHashKey(model), pos.xyz, heading, false, false)
        SetVehicleOnGroundProperly(veh)
        TaskWarpPedIntoVehicle(vehicle.ped(), veh, -1)
        return veh
    end,
    DeleteEntity = function(entity)
        TriggerServerEvent("DeleteEntity", NetworkGetNetworkIdFromEntity(entity))
    end

}

