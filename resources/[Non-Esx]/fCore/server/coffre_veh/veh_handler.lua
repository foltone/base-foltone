Citizen.CreateThread(function()
    local type = "veh_handler.lua"
    --print("FCore: Charge ["..type.."]")
end)




ESX = nil
local vehs_owned = {}
local veh_inventory = {}
local veh_openned = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function AddSourceToOpened(source, plate)
    if veh_openned[plate] == nil then
        veh_openned[plate] = {}
    end

    veh_openned[plate][source] = true
end

function RemoveSourceFromOpened(source, plate)
    if veh_openned[plate][source] ~= nil then
        veh_openned[plate][source] = nil
        SaveVehInventory(plate)
    end
end

function GetSourceOpened(plate)
    return veh_openned[plate]
end

function AddToVehInv(source, model, vClasse, plate, type, amount, item, label, comp, mun, ammoOnly)
    CreateVehInvIfDontExist(plate, vClasse, model)
    local xPlayer = ESX.GetPlayerFromId(source)
    if type == "money" then
        local money = xPlayer.getMoney()
        local _source = source
        if veh_inventory[plate].limit.total + (amount / 1000) <= veh_inventory[plate].limit.limit then
            if money >= amount then
                xPlayer.removeMoney(amount)
                veh_inventory[plate].money.money = math.floor(veh_inventory[plate].money.money + amount)
                TriggerEvent("Logger:SendToDiscordIfPossible", "veh", false, source, plate, type, "propre", amount)
            else
                --TriggerClientEvent("FeedM:showNotification", source, "~r~Erreur\nTu n'a pas assez d'argent!", 5000, "danger")
                TriggerClientEvent('esx:showNotification',  _source, "~r~Erreur\nTu n'a pas assez d'argent!")

            end
        else
            TriggerClientEvent('esx:showNotification',  _source, "~r~Erreur\nPas assez de place dans le coffre! ("..veh_inventory[plate].limit.total.."/"..veh_inventory[plate].limit.limit..")")
            --TriggerClientEvent("FeedM:showNotification", source, "~r~Erreur\nPas assez de place dans le coffre! ("..veh_inventory[plate].limit.total.."/"..veh_inventory[plate].limit.limit..")", 5000, "danger")
        end
    elseif type == "black_money" then
        local acc = xPlayer.getAccount("black_money")
        local money = acc.money
        local _source = source
        if veh_inventory[plate].limit.total + (amount / 1000) <= veh_inventory[plate].limit.limit then
            if money >= amount then
                xPlayer.removeAccountMoney("black_money", amount)
                veh_inventory[plate].money.black = math.floor(veh_inventory[plate].money.black + amount)
                TriggerEvent("Logger:SendToDiscordIfPossible", "veh", false, source, plate, type, "sale", amount)
            else
                --TriggerClientEvent("FeedM:showNotification", source, "~r~Erreur\nTu n'a pas assez d'argent!", 5000, "danger")
                TriggerClientEvent('esx:showNotification',  _source, "~r~Erreur\nTu n'a pas assez d'argent!")
            end
        else
            TriggerClientEvent('esx:showNotification',  _source, "~r~Erreur\nPas assez de place dans le coffre! ("..veh_inventory[plate].limit.total.."/"..veh_inventory[plate].limit.limit..")")
            --TriggerClientEvent("FeedM:showNotification", source, "~r~Erreur\nPas assez de place dans le coffre! ("..veh_inventory[plate].limit.total.."/"..veh_inventory[plate].limit.limit..")", 5000, "danger")
        end
    elseif type == "item" then
        local iInfo = xPlayer.getInventoryItem(item)
        local _source = source
        if iInfo.count > 0 and iInfo.count >= amount then
            if veh_inventory[plate].limit.total + amount <= veh_inventory[plate].limit.limit then
                xPlayer.removeInventoryItem(item, amount)
                if veh_inventory[plate].items[item] == nil then
                    veh_inventory[plate].items[item] = {item = item, label = label, count = amount}
                else
                    veh_inventory[plate].items[item].count = veh_inventory[plate].items[item].count + amount
                end
                TriggerEvent("Logger:SendToDiscordIfPossible", "veh", false, source, plate, type, item, amount)
            else
                TriggerClientEvent('esx:showNotification',  _source, "~r~Erreur\nPas assez de place dans le coffre! ("..veh_inventory[plate].limit.total.."/"..veh_inventory[plate].limit.limit..")")
                --TriggerClientEvent("FeedM:showNotification", source, "~r~Erreur\nPas assez de place dans le coffre! ("..veh_inventory[plate].limit.total.."/"..veh_inventory[plate].limit.limit..")", 5000, "danger")
            end
        else
            -- Erreur dans le montant
        end

    elseif type == "weapon" then
        local gotWeapon = xPlayer.hasWeapon(item)
        local _source = source
        if gotWeapon then

            if veh_inventory[plate].limit.total + 1 <= veh_inventory[plate].limit.limit then
                if not ammoOnly then
                    xPlayer.removeWeapon(item)
                    if veh_inventory[plate].weapons[item] == nil then
                        veh_inventory[plate].weapons[item] = {item = item, label = label, count = 1, ammo = mun, comp = comp}
                    else
                        veh_inventory[plate].weapons[item].count = veh_inventory[plate].weapons[item].count + 1
                        veh_inventory[plate].weapons[item].ammo = veh_inventory[plate].weapons[item].ammo + mun
                    end
                    TriggerEvent("Logger:SendToDiscordIfPossible", "veh", false, source, plate, type, item, amount)
                elseif ammoOnly then
                    if veh_inventory[plate].weapons[item] == nil then
                        veh_inventory[plate].weapons[item] = {item = item, label = label, count = 0, ammo = amount, comp = comp}
                    else
                        veh_inventory[plate].weapons[item].ammo = veh_inventory[plate].weapons[item].ammo + amount
                    end
                    TriggerEvent("Logger:SendToDiscordIfPossible", "veh", false, source, plate, type, "Munition de "..item, amount)
                end
            else
                TriggerClientEvent('esx:showNotification',  _source, "~r~Erreur\nPas assez de place dans le coffre! ("..veh_inventory[plate].limit.total.."/"..veh_inventory[plate].limit.limit..")")
                --TriggerClientEvent("FeedM:showNotification", source, "~r~Erreur\nPas assez de place dans le coffre! ("..veh_inventory[plate].limit.total.."/"..veh_inventory[plate].limit.limit..")", 5000, "danger")
            end
        else    
            -- Erreur, le joueur ne possède pas l'arme
        end
    end

    RefreshVehLimit(plate, vClasse, model)
    RefreshVehInventory(source, plate)
end

local waiting = false
function ScriptAddToVehInv(plate, amount, item, label)
    waiting = true
    CreateVehInvIfDontExist(plate)
    while waiting do Wait(1) end
    if veh_inventory[plate].items[item] == nil then
        veh_inventory[plate].items[item] = {item = item, label = label, count = amount}
    else
        veh_inventory[plate].items[item].count = veh_inventory[plate].items[item].count + amount
    end
end

function RemoveFromVehInv(source, model, vClasse, plate, type, amount, item, countSee, ammoSee, ammoOnly)
    local xPlayer = ESX.GetPlayerFromId(source)
    if type == "money" then
        if veh_inventory[plate].money.money == countSee then
            if veh_inventory[plate].money.money >= amount then
                veh_inventory[plate].money.money = veh_inventory[plate].money.money - amount
                xPlayer.addMoney(amount)
                TriggerEvent("Logger:SendToDiscordIfPossible", "veh", true, source, plate, type, "money", amount)
            end
        end
    elseif type == "black_money" then
        if veh_inventory[plate].money.black == countSee then
            if veh_inventory[plate].money.black >= amount then
                veh_inventory[plate].money.black = veh_inventory[plate].money.black - amount
                xPlayer.addAccountMoney("black_money", amount)
                TriggerEvent("Logger:SendToDiscordIfPossible", "veh", true, source, plate, type, "black_money", amount)
            end
        end
    elseif type == "item" then
        if veh_inventory[plate].items[item] ~= nil then
            if veh_inventory[plate].items[item].count == countSee then
                if veh_inventory[plate].items[item].count >= amount then
                    if xPlayer.getInventoryItem(item).count + amount <= xPlayer.getInventoryItem(item).limit then
                        if veh_inventory[plate].items[item].count - amount > 0 then
                            veh_inventory[plate].items[item].count = veh_inventory[plate].items[item].count - amount
                            xPlayer.addInventoryItem(item, amount)
                        else
                            veh_inventory[plate].items[item].count = veh_inventory[plate].items[item].count - amount
                            xPlayer.addInventoryItem(item, amount)
                            if veh_inventory[plate].items[item].count <= 0 then
                                veh_inventory[plate].items[item] = nil 
                            end
                        end
                        TriggerEvent("Logger:SendToDiscordIfPossible", "veh", true, source, plate, type, item, amount)
                    else
                        local _source = source
                        TriggerClientEvent('esx:showNotification',  _source, "~r~Erreur\nTu porte trop de chose (Limite: "..xPlayer.getInventoryItem(item).limit.." pour l'item demandé)")
                        --TriggerClientEvent("FeedM:showNotification", source, "~r~Erreur\nTu porte trop de chose (Limite: "..xPlayer.getInventoryItem(item).limit.." pour l'item demandé)", 5000, "danger")
                    end
                else    
                    -- Le joueur essaye de retiré un montant trop élevé
                end
            end
        end
    elseif type == "weapon" then
        if veh_inventory[plate].weapons[item] ~= nil then
            if veh_inventory[plate].weapons[item].count == countSee then
                if veh_inventory[plate].weapons[item].ammo == ammoSee then -- Anti duplication pour évité que deux joueur prenne un meme objets en meme temps

                    if not ammoOnly then -- On retire une arme avec des munitions
                        if veh_inventory[plate].weapons[item].ammo > 255 then
                            veh_inventory[plate].weapons[item].ammo = veh_inventory[plate].weapons[item].ammo - 255
                            veh_inventory[plate].weapons[item].count = veh_inventory[plate].weapons[item].count - 1
                            xPlayer.addWeapon(item, 255)
                            for k,v in pairs(veh_inventory[plate].weapons[item].comp) do -- Possible duplication des components si une arme avec comp est déposé et une arme sans juste après, mais je ne vois pas comment faire ou alors faudrait faire des grosse boucle et j'ai pas trop envie pour l'insant.
                                xPlayer.addWeaponComponent(item, v)
                            end
                        else
                            xPlayer.addWeapon(item, veh_inventory[plate].weapons[item].ammo)
                            for k,v in pairs(veh_inventory[plate].weapons[item].comp) do
                                xPlayer.addWeaponComponent(item, v)
                            end
                            veh_inventory[plate].weapons[item].ammo = 0
                            veh_inventory[plate].weapons[item].count = veh_inventory[plate].weapons[item].count - 1
                            if veh_inventory[plate].weapons[item].count <= 0 then -- Si le count est égal à zero alors on supprime l'arme de l'inventaire
                                veh_inventory[plate].weapons[item] = nil
                            end
                        end
                        TriggerEvent("Logger:SendToDiscordIfPossible", "veh", true, source, plate, type, item, amount)
                    else
                        local hasWeapon = xPlayer.hasWeapon(item)
                        if hasWeapon then
                            if veh_inventory[plate].weapons[item].ammo > amount then
                                veh_inventory[plate].weapons[item].ammo = veh_inventory[plate].weapons[item].ammo - amount
                                xPlayer.addWeaponAmmo(item, amount)
                                TriggerEvent("Logger:SendToDiscordIfPossible", "veh", true, source, plate, type, "Munition de "..item, amount)
                            elseif veh_inventory[plate].weapons[item].ammo == amount then
                                veh_inventory[plate].weapons[item].ammo = veh_inventory[plate].weapons[item].ammo - amount
                                xPlayer.addWeaponAmmo(item, amount)

                                if veh_inventory[plate].weapons[item].count == 0 and veh_inventory[plate].weapons[item].ammo == 0 then
                                    veh_inventory[plate].weapons[item] = nil
                                end
                                TriggerEvent("Logger:SendToDiscordIfPossible", "veh", true, source, plate, type, "Munition de "..item, amount)
                                
                            else
                                -- Erreur, le joueur essaye de retiré trop de munition
                            end
                            
                        else
                            -- Ne possède pas l'arme, si on donne les munitions sa sera donné dans le vide
                        end
                    end
                    
                end
            end
        end
    end

    RefreshVehLimit(plate, vClasse, model)
    RefreshVehInventory(source, plate)
end

function DoesItemExistInVehInv(plate, item, count)
    if veh_inventory[plate] ~= nil then
        if veh_inventory[plate].items[item] ~= nil then
            if veh_inventory[plate].items[item].count == count then
                veh_inventory[plate].items[item] = nil
                return true
            else
                return false
            end
        else
            return false
        end
    else
        return false
    end
end

function CreateVehInvIfDontExist(plate, class, model)
    if veh_inventory[plate] == nil then

        MySQL.Async.fetchAll('SELECT owned_vehicles.owner, owned_vehicles.inv FROM owned_vehicles WHERE plate = @plate', { ['@plate'] = plate }, function(result)
            

            if result[1] == nil then
                print("^5VEH-INV: ^7Inventaire de véhicule crée à partir de rien")
                veh_inventory[plate] = {}
                veh_inventory[plate].limit = {limit = 0, total = 0}
                veh_inventory[plate].money = {}
                veh_inventory[plate].money.money = 0
                veh_inventory[plate].money.black = 0
                veh_inventory[plate].items = {}
                veh_inventory[plate].weapons = {}
                veh_inventory[plate].toSave = false
            else
                
                print("^5VEH-INV: ^7Inventaire de véhicule crée à partir de la BDD")

                if result[1].inv == nil or result[1].inv == "{}" then
                    
                    veh_inventory[plate] = {}
                    veh_inventory[plate].limit = {limit = 0, total = 0}
                    veh_inventory[plate].money = {}
                    veh_inventory[plate].money.money = 0
                    veh_inventory[plate].money.black = 0
                    veh_inventory[plate].items = {}
                    veh_inventory[plate].weapons = {}
                    veh_inventory[plate].toSave = true
                    print("^5VEH-INV: ^7Inventaire généré")
                else
                    local inv = json.decode(result[1].inv)
                    print(inv)
                    if inv ~= nil then
                        veh_inventory[plate] = inv
                        veh_inventory[plate].toSave = true
                        print("^5VEH-INV: ^7Inventaire decodé de la BDD")
                    else
                        veh_inventory[plate] = {}
                        veh_inventory[plate].limit = {limit = 0, total = 0}
                        veh_inventory[plate].money = {}
                        veh_inventory[plate].money.money = 0
                        veh_inventory[plate].money.black = 0
                        veh_inventory[plate].items = {}
                        veh_inventory[plate].weapons = {}
                        veh_inventory[plate].toSave = true
                        print("^5VEH-INV: ^7Inventaire généré")
                    end
                end
            end

            if class ~= nil then
                RefreshVehLimit(plate, class, model)
            end
            RefreshVehInventory(nil, plate)
            waiting = false
        end)
    else
        waiting = false
    end
end

function RefreshVehLimit(plate, class, model)
    if veh_inventory[plate] == nil then return end
    local limit = GetVehClassValue(tonumber(class), model)
    veh_inventory[plate].limit.limit = limit

    local count = 0

    if veh_inventory[plate].money.money > 0 then
        count = count + (veh_inventory[plate].money.money / 1000)
    end
    if veh_inventory[plate].money.black > 0 then
        count = count + (veh_inventory[plate].money.black / 1000)
    end

    for k,v in pairs(veh_inventory[plate].items) do
        count = count + v.count
    end

    for k,v in pairs(veh_inventory[plate].weapons) do
        count = count + 1
    end

    veh_inventory[plate].limit.total = count
end

function SaveVehInventory(plate)
    if veh_inventory[plate].toSave then
        print("^5VEH-INV: ^7Saving vehicle inventory ["..plate.."]")
        local inv = json.encode(veh_inventory[plate])
        MySQL.Async.execute("UPDATE owned_vehicles SET inv = @inv WHERE plate = @plate",
        {['@plate'] = plate, ["@inv"] = inv },
        function(affectedRows)
        end)
    else
        print("^5VEH-INV: ^7Save skipped, vehicle not owned ["..plate.."]")
    end
end

function RefreshVehInventory(source, plate)
    local toRefresh = GetSourceOpened(plate)
    if toRefresh ~= nil then 
        for k,v in pairs(toRefresh) do
            TriggerClientEvent("veh:GetVehicleInventory", tonumber(k), veh_inventory[plate])
        end
    end
end

function AddOwnedVeh(plate)
    vehs_owned[plate] = {}
end

function IsVehOwned(plate)
    if vehs_owned[plate] ~= nil then
        return true
    else
        return false
    end
end

function GetVehicleInventory(plate, vClasse, model)
    if veh_inventory[plate] ~= nil then
        return veh_inventory[plate]
    else
        CreateVehInvIfDontExist(plate, vClasse, model)
        return veh_inventory[plate]
    end
end