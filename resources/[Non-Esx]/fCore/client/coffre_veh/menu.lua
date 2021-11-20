local vehInventory = {}
local vehPlate = ""
local veh = nil
ESX = nil
local vClasse = 0
local vModel = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent("veh:GetVehicleInventory")
AddEventHandler("veh:GetVehicleInventory", function(inv)
    vehInventory = inv
end)

local open = false
local coffre = RageUI.CreateMenu("Coffre", "Coffre du véhicule")
local inventaire =  RageUI.CreateSubMenu(coffre, "Coffre", "Coffre du véhicule")
local inventaire_veh =  RageUI.CreateSubMenu(coffre, "Coffre", "Coffre du véhicule")
coffre.Closed = function()
    RageUI.Visible(coffre, false)
    open = false
    TriggerServerEvent("veh:CloseVehicleInventory", vehPlate)
    
    SetVehicleDoorShut(veh, 5, 0)
    SetVehicleDoorShut(veh, 2, 0)
    SetVehicleDoorShut(veh, 3, 0)
end

function OpenVehicleInventory(plate, vehicle, posToCheck)
    if open then
        open = false
        RageUI.Visible(coffre, false)
        return
    else
        RageUI.Visible(coffre, true)
        open = true
        vehPlate = plate
        veh = vehicle
        local pInfo = ESX.GetPlayerData()
        local pInv = {}
        pInv.weapons = {}
        pInv.items = {}
        vClasse = GetVehicleClass(veh)
        vModel = GetEntityModel(veh)
        TriggerServerEvent("veh:GetVehicleInventory", plate, vClasse, vModel)

        if vClasse == 12 or vClasse == 17 or vClasse == 20 then
            SetVehicleDoorOpen(veh, 5, 0, 0)
            SetVehicleDoorOpen(veh, 2, 0, 0)
            SetVehicleDoorOpen(veh, 3, 0, 0)
        else
            SetVehicleDoorOpen(veh, 5, 0, 0)
        end

        Citizen.CreateThread(function()
            while open do
                local pPed = GetPlayerPed(-1)
                if IsPedInAnyVehicle(pPed, false) then
                    open = false
                    RageUI.Visible(coffre, false) 
                    TriggerServerEvent("veh:CloseVehicleInventory", vehPlate)
    
                    SetVehicleDoorShut(veh, 5, 0)
                    SetVehicleDoorShut(veh, 2, 0)
                    SetVehicleDoorShut(veh, 3, 0)
                elseif GetDistanceBetweenCoords(posToCheck, GetEntityCoords(pPed), true) > 2.0 then
                    open = false
                    RageUI.Visible(coffre, false)
                    TriggerServerEvent("veh:CloseVehicleInventory", vehPlate)
    
                    SetVehicleDoorShut(veh, 5, 0)
                    SetVehicleDoorShut(veh, 2, 0)
                    SetVehicleDoorShut(veh, 3, 0)
                end
                Wait(200)
            end
        end)

        Citizen.CreateThread(function()
            while open do
                pInv = {}
                pInv.weapons = {}
                pInv.items = {}

                pInfo = ESX.GetPlayerData()       
                for k,v in pairs(pInfo.inventory) do
                    table.insert(pInv.items, {item = v.name, label = v.label, count = v.count})
                end

                for k,v in pairs(pInfo.loadout) do
                    table.insert(pInv.weapons, {name = v.name, label = v.label, count = v.ammo, components = v.components})
                end

                Wait(150)
            end
        end)

        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(coffre, function()
                    RageUI.Button('Prendre du coffre', nil, {}, true, {}, inventaire_veh);
                    RageUI.Button('Déposer dans le coffre', nil, {}, true, {}, inventaire);
                end)

                RageUI.IsVisible(inventaire, function()
                    RageUI.Separator("↓ Portefeuille ↓")
                    RageUI.Button('Déposer argent', nil, {}, true, {
                        onSelected = function()
                            local amount = KeyboardAmount("Argent")
                            if amount ~= nil and amount > 0 then
                                TriggerServerEvent("veh:AddSomethingToInventory", vClasse, vModel, vehPlate, "money", tonumber(amount))
                            end
                        end,
                    })
                    RageUI.Button('Déposer argent sale', nil, {}, true, {
                        onSelected = function()
                            local amount = KeyboardAmount("Argent sale")
                            if amount ~= nil and amount > 0 then
                                TriggerServerEvent("veh:AddSomethingToInventory", vClasse, vModel, vehPlate, "black_money", tonumber(amount))
                            end
                        end,
                    })
                    RageUI.Separator("↓ Inventaire ↓")
                    for k,v in pairs(pInv.items) do
                        if v.count ~= 0 then
                            RageUI.Button(v.label.." [x~b~"..v.count.."~s~]", nil, {}, true, {
                                onSelected = function()
                                    local amount = KeyboardAmount("Nombre à déposer")
                                    if amount ~= nil and amount > 0 then
                                        print(vehPlate, "item", tonumber(v.count), v.item, v.label)
                                        TriggerServerEvent("veh:AddSomethingToInventory", vClasse, vModel, vehPlate, "item", math.floor(amount), v.item, v.label)
                                    end
                                end,
                            })
                        end
                    end
                    RageUI.Separator("↓ Armes ↓")
                    for k,v in pairs(pInv.weapons) do
                        RageUI.Button("[x~b~1~s~] "..v.label, nil, {}, true, {
                            onSelected = function()
                                table.remove(pInv.weapons, k)
                                TriggerServerEvent("veh:AddSomethingToInventory", vClasse, vModel, vehPlate, "weapon", 1, v.name, v.label, v.components or {}, v.count, false)
                            end,
                        })
                        RageUI.Button("[x~b~"..v.count.."~s~] Munition de "..v.label, nil, {}, true, {
                            onSelected = function()
                                local amount = KeyboardAmount("Nombre de munition")
                                if amount ~= nil and amount > 0 then
                                    if GetAmmoInPedWeapon(GetPlayerPed(-1), GetHashKey(v.name)) >= amount then
                                        pInv.weapons[k].count = pInv.weapons[k].count - amount
                                        TriggerServerEvent("veh:AddSomethingToInventory", vClasse, vModel, vehPlate, "weapon", amount, v.name, v.label, v.components or {}, v.count, true)
                                        SetPedAmmo(GetPlayerPed(-1), GetHashKey(v.name), pInv.weapons[k].count)
                                    end
                                end
                            end,
                        })
                    end
                end)

                RageUI.IsVisible(inventaire_veh, function()
                    RageUI.Separator("↓ Limite: ("..vehInventory.limit.total.."/~o~"..vehInventory.limit.limit.."~s~) ↓")
                    RageUI.Separator("↓ Boite à gants ↓")

                    RageUI.Button('Prendre argent ('..vehInventory.money.money..'$)', nil, {}, true, {
                        onSelected = function()
                            local amount = KeyboardAmount("Argent")
                            if amount ~= nil and amount > 0 then
                                TriggerServerEvent("veh:RemoveSomethingFromVeh", vClasse, vModel, vehPlate, "money", tonumber(amount), 0, vehInventory.money.money)
                            end
                        end,
                    })
                    RageUI.Button('Prendre argent sale ('..vehInventory.money.black..'$)', nil, {}, true, {
                        onSelected = function()
                            local amount = KeyboardAmount("Argent sale")
                            if amount ~= nil and amount > 0 then
                                TriggerServerEvent("veh:RemoveSomethingFromVeh", vClasse, vModel, vehPlate, "black_money", tonumber(amount), 0, vehInventory.money.black)
                            end
                        end,
                    })

                    RageUI.Separator("↓ Inventaire du véhicule ↓")
                    for k,v in pairs(vehInventory.items) do
                        RageUI.Button("[x~b~"..v.count.."~s~] "..v.label, nil, {}, true, {
                            onSelected = function()
                                local amount = KeyboardAmount("Nombre à prendre")
                                if amount ~= nil and amount > 0 then
                                    TriggerServerEvent("veh:RemoveSomethingFromVeh", vClasse, vModel, vehPlate, "item", math.floor(amount), v.item, v.count)
                                end
                            end,
                        })
                    end
                
                    RageUI.Separator("↓ Armes ↓")
                    for k,v in pairs(vehInventory.weapons) do
                        if v.count ~= 0 then
                            RageUI.Button("x"..v.count.." "..v.label.." avec [x~b~"..v.ammo.."~s~] munitions", nil, {}, true, {
                                onSelected = function()
                                    local amount = KeyboardAmount("Nombre à retirer")
                                    if amount ~= nil and amount > 0 then
                                        TriggerServerEvent("veh:RemoveSomethingFromVeh", vClasse, vModel, vehPlate, "weapon", amount, v.item, v.count, v.ammo, false)
                                    end
                                end,
                            })
                        else
                            RageUI.Button("[x~b~"..v.ammo.."~s~] munitions de "..v.label, nil, {}, true, {
                                onSelected = function()
                                    local amount = KeyboardAmount("Nombre à retirer")
                                    if amount ~= nil and amount > 0 then
                                        TriggerServerEvent("veh:RemoveSomethingFromVeh", vClasse, vModel, vehPlate, "weapon", amount, v.item, v.count, v.ammo, true)
                                    end
                                end,
                            })
                        end
                    end
                end)

                Wait(1)
            end
        end)
    end
end
