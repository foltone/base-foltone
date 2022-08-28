ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function GetProperty(name)
	for i=1, #Config.Properties, 1 do
		if Config.Properties[i].name == name then
			return Config.Properties[i]
		end
	end
end

function SetPropertyOwned(name, price, rented, owner)
	MySQL.Async.execute('INSERT INTO owned_properties (name, price, rented, owner) VALUES (@name, @price, @rented, @owner)', {
		['@name']   = name,
		['@price']  = price,
		['@rented'] = (rented and 1 or 0),
		['@owner']  = owner
	}, function(rowsChanged)
		local xPlayer = ESX.GetPlayerFromIdentifier(owner)

		if xPlayer then
			TriggerClientEvent('esx_property:setPropertyOwned', xPlayer.source, name, true)

			if rented then
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('rented_for', ESX.Math.GroupDigits(price)))
			else
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('purchased_for', ESX.Math.GroupDigits(price)))
			end
		end
	end)
end

function RemoveOwnedProperty(name, owner)
	MySQL.Async.execute('DELETE FROM owned_properties WHERE name = @name AND owner = @owner', {
		['@name']  = name,
		['@owner'] = owner
	}, function(rowsChanged)
		local xPlayer = ESX.GetPlayerFromIdentifier(owner)

		if xPlayer then
			TriggerClientEvent('esx_property:setPropertyOwned', xPlayer.source, name, false)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('made_property'))
		end
	end)
end

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM properties', {}, function(properties)

		for i=1, #properties, 1 do
			local entering  = nil
			local exit      = nil
			local inside    = nil
			local outside   = nil
			local isSingle  = nil
			local isRoom    = nil
			local isGateway = nil
			local roomMenu  = nil

			if properties[i].entering ~= nil then
				entering = json.decode(properties[i].entering)
			end

			if properties[i].exit ~= nil then
				exit = json.decode(properties[i].exit)
			end

			if properties[i].inside ~= nil then
				inside = json.decode(properties[i].inside)
			end

			if properties[i].outside ~= nil then
				outside = json.decode(properties[i].outside)
			end

			if properties[i].is_single == 0 then
				isSingle = false
			else
				isSingle = true
			end

			if properties[i].is_room == 0 then
				isRoom = false
			else
				isRoom = true
			end

			if properties[i].is_gateway == 0 then
				isGateway = false
			else
				isGateway = true
			end

			if properties[i].room_menu ~= nil then
				roomMenu = json.decode(properties[i].room_menu)
			end

			table.insert(Config.Properties, {
				name      = properties[i].name,
				label     = properties[i].label,
				entering  = entering,
				exit      = exit,
				inside    = inside,
				outside   = outside,
				ipls      = json.decode(properties[i].ipls),
				gateway   = properties[i].gateway,
				isSingle  = isSingle,
				isRoom    = isRoom,
				isGateway = isGateway,
				roomMenu  = roomMenu,
				price     = properties[i].price
			})
		end

		TriggerClientEvent('esx_property:sendProperties', -1, Config.Properties)
	end)
end)

ESX.RegisterServerCallback('esx_property:getProperties', function(source, cb)
	cb(Config.Properties)
end)

AddEventHandler('esx_ownedproperty:getOwnedProperties', function(cb)
	MySQL.Async.fetchAll('SELECT * FROM owned_properties', {}, function(result)
		local properties = {}

		for i=1, #result, 1 do
			table.insert(properties, {
				id     = result[i].id,
				name   = result[i].name,
				label  = GetProperty(result[i].name).label,
				price  = result[i].price,
				rented = (result[i].rented == 1 and true or false),
				owner  = result[i].owner
			})
		end

		cb(properties)
	end)
end)

AddEventHandler('esx_property:setPropertyOwned', function(name, price, rented, owner)
	SetPropertyOwned(name, price, rented, owner)
end)

AddEventHandler('esx_property:removeOwnedProperty', function(name, owner)
	RemoveOwnedProperty(name, owner)
end)


RegisterServerEvent('esx_property:rentProperty')
AddEventHandler('esx_property:rentProperty', function(propertyName)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local property = GetProperty(propertyName)
	local rent     = ESX.Math.Round(property.price / 200)

	SetPropertyOwned(propertyName, rent, true, xPlayer.identifier)
end)

RegisterServerEvent('esx_property:buyProperty')
AddEventHandler('esx_property:buyProperty', function(propertyName)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local property = GetProperty(propertyName)

	if property.price <= xPlayer.getMoney() then
		xPlayer.removeMoney(property.price)
		SetPropertyOwned(propertyName, property.price, false, xPlayer.identifier)
	else
		TriggerClientEvent('esx:showNotification', source, _U('not_enough'))
	end
end)

RegisterServerEvent('esx_property:removeOwnedProperty')
AddEventHandler('esx_property:removeOwnedProperty', function(propertyName)
	local xPlayer  = ESX.GetPlayerFromId(source)
	RemoveOwnedProperty(propertyName, xPlayer.identifier)
end)

AddEventHandler('esx_property:removeOwnedPropertyIdentifier', function(propertyName, identifier)
	RemoveOwnedProperty(propertyName, identifier)
end)

RegisterServerEvent('esx_property:saveLastProperty')
AddEventHandler('esx_property:saveLastProperty', function(property)
	local xPlayer  = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET last_property = @last_property WHERE identifier = @identifier', {
		['@last_property'] = property,
		['@identifier']    = xPlayer.identifier
	})
end)

RegisterServerEvent('esx_property:deleteLastProperty')
AddEventHandler('esx_property:deleteLastProperty', function()
	local xPlayer  = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET last_property = NULL WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	})
end)

RegisterServerEvent('property:getStockItem')
AddEventHandler('property:getStockItem', function(type, itemName, count, name, ammo)
		local _source = source
		local xPlayer  = ESX.GetPlayerFromId(source)
		local sourceItem = xPlayer.getInventoryItem(itemName)
	   if type == 'item_standard' then
		TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayer.identifier, function(inventory)
			local inventoryItem = inventory.getItem(itemName)
	
			if count > 0 and inventoryItem.count >= count then
				if true then
					inventory.removeItem(itemName, count)
					xPlayer.addInventoryItem(itemName, count)
					TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~COFFRE :\n ~b~Retrait : ~s~'..count..' '..inventoryItem.label..'')			

				else
					TriggerClientEvent('esx:showNotification', _source, 'Quantité Invalide')
				end
			else
				TriggerClientEvent('esx:showNotification', _source, 'Quantité Invalide')
			end
		end)
	   elseif type == 'item_account' then
		TriggerEvent('esx_addonaccount:getAccount', 'property_' .. itemName, xPlayer.identifier, function(account)
			if account.money >= count then
				account.removeMoney(count)
				xPlayer.addAccountMoney(itemName, count)
				TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~COFFRE :\n ~b~Retrait : ~s~'..count..'$~b~ d\'Argent Sale')			
			else
				TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité Invalide')
			end
		end)
	   elseif type == 'item_weapon' then
		TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}
			local weapon = storeWeapons[count] 
	
			if weapon then
				if xPlayer.hasWeapon(itemName) then
				else 
					table.remove(storeWeapons, count)
					store.set('weapons', storeWeapons)
	
					xPlayer.addWeapon(weapon.name, weapon.ammo)		
					local weaponName = itemName
					local name = 'olololo'
					TriggerClientEvent('property:getWeaponTrue', -1, name, weaponName)
				end
			end
		  end)
	   end
	end)

RegisterServerEvent('property:putStockItems')
AddEventHandler('property:putStockItems', function(type, itemName, count)
	local _source = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)
   if type == 'item_standard' then
	TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayer.identifier, function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~COFFRE :\n ~b~Dépot : ~s~'..count..' '..inventoryItem.label..'')			
		else
			TriggerClientEvent('esx:showNotification', _source, '~r~Quantité Invalide')
		end
	end)
   elseif type == 'item_account' then
	if xPlayer.getAccount(itemName).money >= count and count > 0 then
		xPlayer.removeAccountMoney(itemName, count)
		TriggerEvent('esx_addonaccount:getAccount', 'property_' .. itemName, xPlayerOwner.identifier, function(account)
			account.addMoney(count)
		end)
		TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~COFFRE :\n ~b~Dépot : ~s~'..count..'$ d\'Argent Sale')			
	else
		TriggerClientEvent('esx:showNotification', _source, '~r~Quantité Invalide')
	end
   elseif type == 'item_weapon' then
	if xPlayer.hasWeapon(itemName) then				
		local weaponName = itemName
		local name = 'test'
		xPlayer.removeWeapon(itemName)
		TriggerEvent('esx_datastore:getDataStore', 'property', xPlayerOwner.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}

			table.insert(storeWeapons, {
				name = itemName,
				ammo = count
			})

			store.set('weapons', storeWeapons)
		end)	
	end
   end
end)



ESX.RegisterServerCallback('property:getPlayerInventory', function(source, cb)
	local xPlayer      = ESX.GetPlayerFromId(source)
	local blackMoney = xPlayer.getAccount('black_money').money
	local items = xPlayer.inventory
	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = xPlayer.getLoadout()
	})
end)

ESX.RegisterServerCallback('esx_property:getPropertyInventory', function(source, cb, owner)
	local xPlayer    = ESX.GetPlayerFromIdentifier(owner)
	local blackMoney = 0
	local items      = {}
	local weapons    = {}

	TriggerEvent('esx_addonaccount:getAccount', 'property_black_money', xPlayer.identifier, function(account)
		blackMoney = account.money
	end)

	TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayer.identifier, function(inventory)
		items = inventory.items
	end)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		weapons = store.get('weapons') or {}
	end)

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = weapons
	})
end)

ESX.RegisterServerCallback('property:getStockItems', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local blackMoney = 0
	local weapons    = {}

	TriggerEvent('esx_addonaccount:getAccount', 'property_black_money', xPlayer.identifier, function(account)
		blackMoney = account.money
	end)

	TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayer.identifier, function(inventory)
		items = inventory.items
	end)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		weapons = store.get('weapons') or {}
	end)

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = weapons
	})
end)


ESX.RegisterServerCallback('esx_property:getOwnedProperties', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_properties WHERE owner = @owner', {
		['@owner'] = xPlayer.identifier
	}, function(ownedProperties)
		local properties = {}

		for i=1, #ownedProperties, 1 do
			table.insert(properties, ownedProperties[i].name)
		end

		cb(properties)
	end)
end)

ESX.RegisterServerCallback('esx_property:getLastProperty', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT last_property FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(users)
		cb(users[1].last_property)
	end)
end)

ESX.RegisterServerCallback('esx_property:getPropertyInventory', function(source, cb, owner)
	local xPlayer    = ESX.GetPlayerFromIdentifier(owner)
	local blackMoney = 0
	local items      = {}
	local weapons    = {}

	TriggerEvent('esx_addonaccount:getAccount', 'property_black_money', xPlayer.identifier, function(account)
		blackMoney = account.money
	end)

	TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayer.identifier, function(inventory)
		items = inventory.items
	end)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		weapons = store.get('weapons') or {}
	end)

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = weapons
	})
end)

ESX.RegisterServerCallback('esx_property:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local blackMoney = xPlayer.getAccount('black_money').money
	local items      = xPlayer.inventory

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = xPlayer.getLoadout()
	})
end)

ESX.RegisterServerCallback('esx_property:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local count  = store.count('dressing')
		local labels = {}

		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)



function PayRent(d, h, m)
	MySQL.Async.fetchAll('SELECT * FROM owned_properties WHERE rented = 1', {}, function (result)
		for i=1, #result, 1 do
			local xPlayer = ESX.GetPlayerFromIdentifier(result[i].owner)

			-- message player if connected
			if xPlayer then
				xPlayer.removeAccountMoney('bank', result[i].price)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('paid_rent', ESX.Math.GroupDigits(result[i].price)))
			else -- pay rent either way
				MySQL.Sync.execute('UPDATE users SET bank = bank - @bank WHERE identifier = @identifier', {
					['@bank']       = result[i].price,
					['@identifier'] = result[i].owner
				})
			end

			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_realestateagent', function(account)
				account.addMoney(result[i].price)
			end)
		end
	end)
end

--TriggerEvent('cron:runAt', 22, 0, PayRent)


--######################################################################################################################################################
--######################################################################################################################################################
--######################################################################################################################################################
--######################################################################################################################################################
--######################################################################################################################################################

ESX.RegisterServerCallback('h4ci_vetement:affichertenu', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local tenue = {}
    xPlayer.removeMoney(50)
    MySQL.Async.fetchAll('SELECT * FROM h4ci_item WHERE (identifier = @identifier and type = @type)', {
        ['@identifier'] = xPlayer.identifier,
        ['@type'] = "Vetement"
    }, function(result)
      for i = 1, #result, 1 do
      table.insert(tenue, {
      	id = result[i].id,
        nom = result[i].nom,
        contenu = result[i].contenu
      })
    end
    cb(tenue)

    end)
end)

RegisterServerEvent('h4ci_vetement:renommertenu')
AddEventHandler('h4ci_vetement:renommertenu', function (nouveaunom, id)
  	if id ~= nil then
  		MySQL.Async.execute(
			'UPDATE h4ci_item SET nom = @nomnouveau WHERE id = @id',
			{
				['@nomnouveau'] = nouveaunom,
				['@id'] = id
			}
		)
		TriggerClientEvent('esx:showNotification', source, "La tenue a été renommer, si la modification n'apparaît pas, relancer le menu")
  	else
  		TriggerClientEvent('esx:showNotification', source, "La tenue est introuvable")
  	end

end)

RegisterServerEvent('h4ci_vetement:supprimertenu')
AddEventHandler('h4ci_vetement:supprimertenu', function (id)
  	if id ~= nil then
  		MySQL.Async.execute(
			'DELETE FROM h4ci_item WHERE id = @id',
			{
				['@id'] = id
			}
		)
		TriggerClientEvent('esx:showNotification', source, "Suppresion de la tenue ok!")
  	else
  		TriggerClientEvent('esx:showNotification', source, "La tenue est introuvable")
  	end

end)

RegisterServerEvent('h4ci_vetement:donnertenu')
AddEventHandler('h4ci_vetement:donnertenu', function (idtenu, deuxiemejoueur, nom)
  local _source = source
  local id = deuxiemejoueur
  local xPlayer = ESX.GetPlayerFromId(_source)
  local xPlayer2 = ESX.GetPlayerFromId(id)
  local tenuid = idtenu

  	if tenuid ~= nil then
  		MySQL.Async.execute(
			'UPDATE h4ci_item SET identifier = @identifier WHERE id = @id',
			{
				['@identifier'] = xPlayer2.identifier,
				['@id'] = tenuid
			}
		)
		TriggerClientEvent('esx:showNotification', _source, "Vous avez donné la tenue avec le nom suivant ~o~" .. nom)
  		TriggerClientEvent('esx:showNotification', id, "Vous avez recu la tenue avec le nom suivant ~o~" .. nom)
  	else
  		TriggerClientEvent('esx:showNotification', _source, "La tenue est introuvable")
  	end

end)