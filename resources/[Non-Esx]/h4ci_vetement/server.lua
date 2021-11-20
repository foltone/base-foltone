ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('h4ci_vetement:verifsous', function(source, cb, prixtenu)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= prixtenu then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('h4ci_vetement:enregistretenu')
AddEventHandler('h4ci_vetement:enregistretenu', function(nom, contenu)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(150)
	MySQL.Async.execute('INSERT INTO h4ci_item (identifier, nom, contenu, type) VALUES (@identifier, @nom, @contenu, @type)', {
        ['@identifier'] = xPlayer.identifier,
        ['@nom'] = nom,
        ['@contenu'] = json.encode(contenu),
        ['@type'] = "Vetement"
    })

end)

ESX.RegisterServerCallback('h4ci_vetement:affichertenu', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local tenue = {}
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
