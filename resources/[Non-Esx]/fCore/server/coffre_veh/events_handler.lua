Citizen.CreateThread(function()
    local type = "event_handler.lua"
    --print("FCore: Charge ["..type.."]")
end)

RegisterNetEvent("veh:MarkVehAsOwnedToServer")
AddEventHandler("veh:MarkVehAsOwnedToServer", function(plate)
    AddOwnedVeh(plate)
end)

RegisterNetEvent("veh:GetVehicleInventory")
AddEventHandler("veh:GetVehicleInventory", function(plate, vClasse, model)
    RefreshVehLimit(plate, vClasse, model)
    local inv = GetVehicleInventory(plate, vClasse, model)
    AddSourceToOpened(source, plate)
    TriggerClientEvent("veh:GetVehicleInventory", source, inv)
end)

RegisterNetEvent("veh:CloseVehicleInventory")
AddEventHandler("veh:CloseVehicleInventory", function(plate)
    RemoveSourceFromOpened(source, plate)
end)

RegisterNetEvent("veh:AddSomethingToInventory")
AddEventHandler("veh:AddSomethingToInventory", function(vClasse, model, plate, type, amount, item, label, comp, mun, ammoOnly)
    AddToVehInv(source, model, vClasse, plate, type, amount, item, label, comp, mun, ammoOnly)
end)

RegisterNetEvent("veh:ScriptAddItemToVehInv")
AddEventHandler("veh:ScriptAddItemToVehInv", function(plate, amount, item, label)
    ScriptAddToVehInv(plate, amount, item, label)
end)

RegisterNetEvent("veh:RemoveSomethingFromVeh")
AddEventHandler("veh:RemoveSomethingFromVeh", function(vClasse, model, plate, type, amount, item, countSee, ammoSee, ammoOnly)
    RemoveFromVehInv(source, model, vClasse, plate, type, amount, item, countSee, ammoSee, ammoOnly)
end)