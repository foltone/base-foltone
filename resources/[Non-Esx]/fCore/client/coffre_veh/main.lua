
function CheckIfCloseToVeh()
    local pPed = GetPlayerPed(-1)
    local pCoords = GetEntityCoords(pPed)
    local isInVeh = IsPedInAnyVehicle(pPed, false)

    if not isInVeh then

        local veh, dst = GetClosestVehicle()
        if GetVehicleDoorLockStatus(veh) ~= 2 then

            local vDim, _ = GetModelDimensions(GetEntityModel(veh))
            local vPos = GetOffsetFromEntityInWorldCoords(veh, 0.0, vDim.y + -0.8, 0.0)
            
            local dst = GetDistanceBetweenCoords(pCoords, vPos, true)
            if dst < 1.5 then
                OpenVehicleInventory(GetVehicleNumberPlateText(veh), veh, vPos)
            else
                ESX.ShowNotification("Tu n'est pas proche d'un coffre de véhicule")
                --exports.FeedM:ShowNotification("Tu n'est pas proche d'un coffre de véhicule", 2000, "danger")
                if dst < 10.0 then
                    Citizen.CreateThread(function()
                        local count = 0
                        while count <= 300 do
                            count = count + 1
                            DrawMarker(27, vPos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 150, 0, 0, 2, 1, nil, nil, 0)
                            Wait(0)
                        end 
                    end)
                end
            end
        else
            ESX.ShowNotification("Le véhicule est ~r~fermé.")

            --exports.FeedM:ShowNotification("Le véhicule est ~r~fermé.", 2000, "danger")
        end
    end
end

Keys.Register('L', 'L', 'Ouvrir le coffre du véhicule', function()
    CheckIfCloseToVeh()
end)