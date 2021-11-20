ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--------------------------------------------------

function CheckLicense(source, type, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier

	MySQL.Async.fetchAll('SELECT COUNT(*) as count FROM user_licenses WHERE type = @type AND owner = @owner', {
		['@type']  = type,
		['@owner'] = identifier
	}, function(result)
		if tonumber(result[1].count) > 0 then
			cb(true)
		else
			cb(false)
		end

	end)
end

ESX.RegisterServerCallback('e_weaponshop:checkLicense', function(source, cb, type)
    CheckLicense(source, 'weapon', cb)
end)

----------------------------------------------------

RegisterServerEvent('Eweapon:addppa')
AddEventHandler('Eweapon:addppa', function(weapon)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 50000 then
    MySQL.Async.execute('INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)', {
        ['@type'] = weapon,
        ['@owner'] = xPlayer.identifier
    })
	xPlayer.removeMoney(50000)
	TriggerClientEvent('esx:showNotification', source, "~g~Achat réussis !")
	else
		TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez !")
	end
end)

-------------------------------------------------------

RegisterServerEvent('weaponshops:giveWeapon')
AddEventHandler('weaponshops:giveWeapon', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getMoney()
    if playerMoney >= (item.Price) then
        if not xPlayer.hasWeapon(item.Value) then
        xPlayer.addWeapon(item.Value, 20)
        xPlayer.removeMoney(item.Price)
        else
            TriggerClientEvent('esx:showNotification', source, '~r~Vous avez déjà cette arme')
        end

    else
		TriggerClientEvent('esx:showNotification', source, 'Vous ne pouvez pas acheter ~g~1x ' .. item.Label .. '~s~' .. ' il vous manque ' .. '~r~' .. item.Price - playerMoney .. '$')
    end
end)

RegisterNetEvent('item:acheter')
AddEventHandler('item:acheter', function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= (item.Price) then
		xPlayer.addInventoryItem(item.Value, 1)
		xPlayer.removeMoney(item.Price)
	else
		TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez !")
	end
end)