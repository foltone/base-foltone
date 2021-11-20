ESX = nil
local ModsInService = {};
local Reports = {};
local Coords = {};
TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
end)
-----Debut de Get les joueurs et le staff
RegisterServerEvent('foltone:getPlayers')
AddEventHandler('foltone:getPlayers', function()
    local players = {};
    local _source = source;

    TriggerClientEvent('gMenu:teleportEffect', _source, GetEntityCoords(GetPlayerPed(_source)))

    for _, player in pairs(ESX.GetPlayers()) do
        if player ~= nil then
            table.insert(players, {
                serverId = player,
                name = GetPlayerName(player),
                label = ('[%s] %s'):format(player, GetPlayerName(player))
            });
        end
    end

    function compare(a, b)
        return a.serverId < b.serverId
    end

    table.sort(players, compare)

    TriggerClientEvent('foltone:setPlayers', _source, players);
end)

----SetInService
RegisterServerEvent('foltone:getStaffs')
AddEventHandler('foltone:getStaffs', function()
    local _source = source;
    TriggerClientEvent('foltone:setStaffs', _source, ModsInService);
end)

RegisterServerEvent('foltone:setInService')
AddEventHandler('foltone:setInService', function(state)
    local _source = source;

    if state == true then
        for i = 1, #ModsInService, 1 do
            TriggerClientEvent('esx:showNotification', "~b~" .. ModsInService[i].serverId,
                GetPlayerName(_source) .. ' ~s~ vient de commencer a moderer.');
        end

        table.insert(ModsInService, {
            serverId = _source,
            name = GetPlayerName(_source),
            label = ('[%s] %s'):format(_source, GetPlayerName(_source))
        });

        TriggerClientEvent('foltone:setReports', _source, Reports);
        TriggerClientEvent('foltone:setStaffs', _source, ModsInService);
    else
        for i = 1, #ModsInService, 1 do
            if ModsInService[i].serverId == _source then
                table.remove(ModsInService, i)
            end
        end

        for i = 1, #ModsInService, 1 do
            TriggerClientEvent('foltone:setStaffs', ModsInService[i].serverId, ModsInService);
        end
    end
end)

---- Fin de get les joueurs et le staff

---pseudo
----

----Le heal
RegisterServerEvent('foltone:heal')
AddEventHandler('foltone:heal', function(user, state)
    TriggerClientEvent('foltone:heal', user, state);
end)
----
----
------- Debut Sac a dos joueur
ESX.RegisterServerCallback("foltone:getJobs", function(source, cb, target)
    local xTarget = ESX.GetPlayerFromId(target)
    local myPlayerJob = xTarget.getJob()

    cb(myPlayerJob)

end)

ESX.RegisterServerCallback("foltone:getJobs2", function(source, cb, target)
    local xTarget = ESX.GetPlayerFromId(target)
    local myPlayerJob2 = xTarget.getJob2()

    cb(myPlayerJob2)

end)

ESX.RegisterServerCallback("foltone:money", function(source, cb, target)
    local xTarget = ESX.GetPlayerFromId(target)
    local myPlayerAccount = xTarget.getMoney()

    cb(myPlayerAccount)

end)

ESX.RegisterServerCallback("foltone:banque", function(source, cb, target)
    local xTarget = ESX.GetPlayerFromId(target)
    local myPlayerAccount = xTarget.getAccounts()
    cb(myPlayerAccount)
end)

ESX.RegisterServerCallback("foltone:inventaire", function(source, cb, target, minimal)
    local xTarget = ESX.GetPlayerFromId(target)
    local myPlayerInv = xTarget.getInventory(minimal)

    cb(myPlayerInv)

end)
-----Fin Sac a dos Jouer une emote
----
-------
----
-----Debut des actions avec le sac a dos du joeur
RegisterServerEvent('foltone:RemoveItem')
AddEventHandler('foltone:RemoveItem', function(id, item, count)
    local xPlayer = ESX.GetPlayerFromId(id)
    xPlayer.removeInventoryItem(item, count)
end)

ESX.RegisterServerCallback("foltone:weapon", function(source, cb, target, weaponName)
    local xTarget = ESX.GetPlayerFromId(target)
    local myPlayerWeapon = xTarget.getLoadout()

    cb(myPlayerWeapon)

end)

RegisterServerEvent('foltone:removeweapon')
AddEventHandler('foltone:removeweapon', function(id, weapon)
    local xPlayer = ESX.GetPlayerFromId(id)

    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end

    xPlayer.removeWeapon(weapon)
end)

RegisterServerEvent('foltone:removemoeney')
AddEventHandler('foltone:removemoeney', function(id, money)
    local xPlayer = ESX.GetPlayerFromId(id)

    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end

    xPlayer.removeMoney(money)
end)

RegisterServerEvent('foltone:removebanque')
AddEventHandler('foltone:removebanque', function(id, money)
    local xPlayer = ESX.GetPlayerFromId(id)

    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end

    xPlayer.removeAccountMoney('bank', money)
end)

RegisterServerEvent('foltone:removesale')
AddEventHandler('foltone:removesale', function(id, money)
    local xPlayer = ESX.GetPlayerFromId(id)

    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end

    xPlayer.removeAccountMoney('black_money', money)
end)

RegisterServerEvent("foltone:bringplayer")
AddEventHandler("foltone:bringplayer", function(plyId, plyPedCoords)

    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end

    TriggerClientEvent('foltone:bringplayer', plyId, plyPedCoords)
end)

RegisterServerEvent('foltone:ClearInventory')
AddEventHandler("foltone:ClearInventory", function(id)
    local xPlayer = ESX.GetPlayerFromId(id)

    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end

    for i = 1, #xPlayer.inventory, 1 do
        if xPlayer.inventory[i].count > 0 then
            xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
        end
    end
end)

RegisterServerEvent('foltone:ClearLoadout')
AddEventHandler('foltone:ClearLoadout', function(id)
    local xPlayer = ESX.GetPlayerFromId(id)

    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end

    for i = #xPlayer.loadout, 1, -1 do
        xPlayer.removeWeapon(xPlayer.loadout[i].name)
    end
end)

ESX.RegisterServerCallback('foltone:AdmingetUsergroup', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then
        local playerGroup = xPlayer.getGroup()

        if playerGroup ~= nil then
            cb(playerGroup)
        else
            cb(nil)
        end
    else
        cb(nil)
    end
end)

local warns = {}
RegisterNetEvent("foltone:RegisterWarn")
AddEventHandler("foltone:RegisterWarn", function(id, type)
    local steam = GetPlayerIdentifier(id, 0)
    local warnsGet = 0
    local found = false
    for k, v in pairs(warns) do
        if v.id == steam then
            found = true
            warnsGet = v.warns
            table.remove(warns, k)
            break
        end
    end
    if not found then
        table.insert(warns, {
            id = steam,
            warns = 1
        })
    else
        table.insert(warns, {
            id = steam,
            warns = warnsGet + 1
        })
    end
    print(warnsGet + 1)
    if warnsGet + 1 >= 3 then
        DropPlayer(id,
            "Vous avez dépassé la limite de warn. Vous avez été kick du serveur. Merci de lire le règlement.")
    else
        TriggerClientEvent("foltone:RegisterWarn", id, type)
        TriggerEvent("Logger:SendToDiscordIfPossible", "warn-staff", false, source, source, id, GetPlayerName(id), type)
    end
end)
RegisterServerEvent('foltone:freezePlayer')
AddEventHandler('foltone:freezePlayer', function(user, state)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end

    TriggerClientEvent('foltone:freezePlayer', user, state);
end)

-------Fin des actions avec le joueurs

RegisterNetEvent("foltone:Kick")
AddEventHandler("foltone:Kick", function(id, raison)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end
    TriggerEvent("Logger:SendToDiscordIfPossible", "kick-staff", false, source, source, id, GetPlayerName(id), raison)
    DropPlayer(id, raison)
end)

RegisterNetEvent("foltone:SendMsgToPlayer")
AddEventHandler("foltone:SendMsgToPlayer", function(id, msg)
    TriggerClientEvent('esx:showNotification', id, "~b~MESSAGE STAFF\n~w~" .. msg)
    TriggerEvent("Logger:SendToDiscordIfPossible", "sms-staff", false, source, source, id, GetPlayerName(id), msg)

end)

ESX.RegisterServerCallback('foltone:getPlayerCoords', function(source, cb, target)
    cb(GetEntityCoords(GetPlayerPed(target)));
end)

-----------Systeme Report
----
-------Commande Report
RegisterServerEvent('foltone:addReport')
AddEventHandler('foltone:addReport', function(reportText)
    local _source = source;
    local playerName = GetPlayerName(_source);
    local label = ('[%s] %s'):format(_source, playerName);
    local date = os.date("*t");

    table.insert(Reports, {
        serverId = _source,
        name = playerName,
        label = label,
        text = ('%sh%s: %s'):format(date.hour, date.min, reportText),
        taken = nil
    });

    TriggerEvent('Logger:SendToDiscordIfPossible', 'ticket-open', false, 0, _source, playerName, reportText);

    for i = 1, #ModsInService, 1 do
        TriggerClientEvent('esx:showNotification', ModsInService[i].serverId,
            ('~b~%s~s~ vient de faire un report pour ~r~%s~s~'):format(playerName, reportText));
        TriggerClientEvent('foltone:setReports', ModsInService[i].serverId, Reports);
    end
end)

----Prendre le Report
RegisterServerEvent('foltone:takeReport')
AddEventHandler('foltone:takeReport', function(serverId, text)
    for i = 1, #Reports, 1 do
        if Reports[i].serverId == serverId and Reports[i].text == text then
            Reports[i].taken = source;
            TriggerEvent('Logger:SendToDiscordIfPossible', 'ticket-taken', false, 0, source, GetPlayerName(source),
                Reports[i].serverId, Reports[i].name);
        end
    end

    for i = 1, #ModsInService, 1 do
        TriggerClientEvent('foltone:setReports', ModsInService[i].serverId, Reports);
    end
end)

-----Supprimer le report
RegisterServerEvent('foltone:removeReport')
AddEventHandler('foltone:removeReport', function(serverId, text)
    for i = 1, #Reports, 1 do
        if Reports[i].serverId == serverId and Reports[i].text == text then
            TriggerEvent('Logger:SendToDiscordIfPossible', 'ticket-close', false, 0, source, GetPlayerName(source),
                Reports[i].serverId, Reports[i].name);
            table.remove(Reports, i);
        end
    end

    for i = 1, #ModsInService, 1 do
        TriggerClientEvent('foltone:setReports', ModsInService[i].serverId, Reports);
    end
end)

----Enlever les perms
RegisterServerEvent('foltone:removePerm')
AddEventHandler('foltone:removePerm', function(staffId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end

    TriggerClientEvent('foltone:removePerm', staffId);
end)

----Heal le joueur
RegisterServerEvent("foltone:healplayer")
AddEventHandler("foltone:healplayer", function(plyId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end

    TriggerClientEvent('foltone:healplayer', plyId)
end)
-------
----
-------

----Debut des annonces disponible pour le staff
RegisterServerEvent('foltone:sendAnnounceStaff')
AddEventHandler('foltone:sendAnnounceStaff', function(target, text, author)
    if (author == nil and target ~= -1) then
        author = GetPlayerName(source);
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end
    TriggerEvent("Logger:SendToDiscordIfPossible", "announce-staff", false, source, source, text)

    TriggerClientEvent('foltone:sendAnnounceStaff', target, text, author);
end)

RegisterServerEvent('foltone:sendAnnounceMétéo')
AddEventHandler('foltone:sendAnnounceMétéo', function(target, text, author)
    if (author == nil and target ~= -1) then
        author = GetPlayerName(source);
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    if group == "user" then
        TriggerEvent("AC:Violations", 24, "Event: foltone:removeweapon Grade: " .. group, source)
        return
    end

    TriggerClientEvent('foltone:sendAnnounceMétéo', target, text, author);
end)

---- Fin des annonces disponible pour le staff
