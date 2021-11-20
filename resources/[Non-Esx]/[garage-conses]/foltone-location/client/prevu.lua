tempVeh = nil
local tempModel = nil


function stopprevue()
    RenderScriptCams(0, 0, 500, 0, 0)
    TriggerEvent("InitCamModulePause", false)
    DeleteEntity(tempVeh)
    tempVeh = nil
    tempModel = nil
end

function UpdateCam(model, coords, heading)
    if model == tempModel then
        return
    else
        if tempVeh ~= nil then
            DeleteEntity(tempVeh)
            tempVeh = nil
        end

        RequestModel(GetHashKey(model))
        while not HasModelLoaded(GetHashKey(model)) do Wait(1) end
        
        tempModel = model
        tempVeh = CreateVehicle(GetHashKey(model), coords, heading, 0, 0)
        FreezeEntityPosition(tempVeh, true)
        SetEntityAlpha(tempVeh, 180, 180)

        local camCoords = GetOffsetFromEntityInWorldCoords(tempVeh, 3.0, 2.0, 2.0)
    end
end