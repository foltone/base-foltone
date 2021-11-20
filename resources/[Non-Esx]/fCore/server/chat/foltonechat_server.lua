ESX = nil


function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			permission_level = identity['permission_level']
		}
	else
		return nil
	end
end

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local xPlayers	= ESX.GetPlayers()

RegisterCommand('twt', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{0}:<br> {1}</div>',
        args = { fal, msg }
    })
end, false)


RegisterCommand('ano', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(60, 60, 60, 60); border-radius: 3px;"><i class="fas fa-globe"></i> Anonyme :<br> {1}</div>',
        args = { fal, msg }
    })
end, false)

--[[
RegisterCommand('twt', function(source, args, rawCommand)
    local src = source
	local msg = rawCommand:sub(5)
	local args = msg
    if player ~= false then
        local name = GetPlayerName(source)
        local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', name.firstname, 'Twitter', ''..name..'', ''..msg..'', 'saveToBrief', 0)
        end
    end
end, false)

RegisterCommand('ano', function(source, args, rawCommand)
    local src = source
	local msg = rawCommand:sub(5)
	local args = msg
    if player ~= false then
        local name = GetPlayerName(source)
        local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Dark-chat', 'Anonyme', ''..msg..'', 'CHAR_ARTHUR', 0)
            PerformHttpRequest('https://discord.com/api/webhooks', function(err, text, headers) end, 'POST', json.encode({username = "", content = GetPlayerName(source) .. " à envoyé " .. msg}), { ['Content-Type'] = 'application/json' })
        end
    end
end, false)]]