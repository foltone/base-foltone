ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'concess', 'alerte concess', true, true)

TriggerEvent('esx_society:registerSociety', 'concess', 'Concessionnaire', 'society_concess', 'society_concess', 'society_concess', {type = 'public'})

ESX.RegisterServerCallback('h4ci_concess:recuperercategorievehicule', function(source, cb)
    local catevehi = {}

    MySQL.Async.fetchAll('SELECT * FROM vehicle_categories', {}, function(result)
        for i = 1, #result, 1 do
            table.insert(catevehi, {
                name = result[i].name,
                label = result[i].label
            })
        end
        cb(catevehi)
    end)
end)
ESX.RegisterServerCallback('h4ci_concess:recupererlistevehicule', function(source, cb, categorievehi)
    local catevehi = categorievehi
    local listevehi = {}
    MySQL.Async.fetchAll('SELECT * FROM vehicles WHERE category = @category', {
        ['@category'] = catevehi
    }, function(result)
        for i = 1, #result, 1 do
            table.insert(listevehi, {
                name = result[i].name,
                model = result[i].model,
                price = result[i].price
            })
        end
        cb(listevehi)
    end)
end)
ESX.RegisterServerCallback('h4ci_concess:verifierplaquedispo', function (source, cb, plate)
    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function (result)
        cb(result[1] ~= nil)
    end)
end)
RegisterServerEvent('h4ci_concess:vendrevoiturejoueur')
AddEventHandler('h4ci_concess:vendrevoiturejoueur', function (playerId, vehicleProps, prix)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_concess', function (account)
            account.removeMoney(prix)
    end)
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
    {
        ['@owner']   = xPlayer.identifier,
        ['@plate']   = vehicleProps.plate,
        ['@vehicle'] = json.encode(vehicleProps)
    }, function (rowsChanged)
    --TriggerClientEvent('esx:showNotification', xPlayer, "Tu as re??u la voiture ~g~"..nom.."~s~ immatricul?? ~g~"..plaque.." pour ~g~" ..prix.. "$")
    end)
end)
RegisterServerEvent('shop:vehicule')
AddEventHandler('shop:vehicule', function(vehicleProps, prix)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_concess', function (account)
        xPlayer.removeMoney(prix)
end)
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
        ['@owner']   = xPlayer.identifier,
        ['@plate']   = vehicleProps.plate,
        ['@vehicle'] = json.encode(vehicleProps)
    }, function(rowsChange)
        --TriggerClientEvent('esx:showNotification', xPlayer, "Tu as re??u la voiture ~g~"..nom.."~s~ immatricul?? ~g~"..plaque.." pour ~g~" ..prix.. "$")
        --TriggerClientEvent('esx:showNotification', xPlayer, "Tu as re??u la voiture ~g~"..json.encode(vehicleProps).."~s~ immatricul?? ~g~"..vehicleProps.plate.." pour ~g~" ..prix.. "$")
    end)
end)

ESX.RegisterServerCallback('h4ci_concess:verifsousconcess', function(source, cb, prixvoiture)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_concess', function (account)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer.getMoney() >= prixvoiture then
            cb(true)
        else
            cb(false)
        end
    end)
end)
