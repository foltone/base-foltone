-- NShops created by Nehco, no sell !

ESX = nil 
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

RegisterNetEvent("NShops:BuyItems")
AddEventHandler("NShops:BuyItems", function(price, item, count, type)
    local xPlayer = ESX.GetPlayerFromId(source)
    if type == 1 then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem(item, count)
    else
        xPlayer.removeAccountMoney("bank", price)
        xPlayer.addInventoryItem(item, count)
    end
end)

ESX.RegisterServerCallback("NShops:CheckMoney", function(source, cb, price, type)
	local xPlayer = ESX.GetPlayerFromId(source)
    if type == 1 then
        if xPlayer.getMoney() >= price then
            cb(true)
        else
            cb(false)
        end
    else
        if xPlayer.getMoney("bank") >= price then
            cb(true)
        else
            cb(false)
        end
    end
end)
