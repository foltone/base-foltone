-- Settings
--local color = { r = 102, g = 0, b = 51, alpha = 255 } -- Color of the text 
local color = { r = 125, g = 125, b = 125, alpha = 255 } -- Color of the text 
local font = 7 -- Font of the text
local time = 7000 -- Duration of the display of the text : 1000ms = 1sec
local background = {
    enable = true,
    color = { r = 35, g = 35, b = 35, alpha = 200 },
}
local chatMessage = false
local dropShadow = true

-- Don't touch
local nbrDisplaying = 0.80

RegisterCommand('me', function(source, args)
    local text = '~o~La personne: ~g~' -- edit here if you want to change the language : EN: the person / FR: la personne
    for i = 1,#args do
        text = text .. ' ' .. args[i]
    end
    text = text .. ''

    local players = {}
    for k,v in pairs(GetActivePlayers()) do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(GetPlayerPed(v)), true) < 100.0 then
            table.insert(players, GetPlayerServerId(v))
        end
    end

    TriggerServerEvent('3dme:shareDisplay', text, players)
end)

RegisterNetEvent('3dme:AddMe')
AddEventHandler('3dme:AddMe', function(text)
    local text = text

    local players = {}
    for k,v in pairs(GetActivePlayers()) do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(GetPlayerPed(v)), true) < 100.0 then
            table.insert(players, GetPlayerServerId(v))
        end
    end

    TriggerServerEvent('3dme:shareDisplay', text, players)
end)


RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source)
    local offset = nbrDisplaying + 0.14
    Display(GetPlayerFromServerId(source), text, offset)
end)

function Display(mePlayer, text, offset)
    local displaying = true

    -- Chat message
    if chatMessage then
        local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
        local coords = GetEntityCoords(PlayerPedId(), false)
        local dist = Vdist2(coordsMe, coords)
        if dist < 2500 then
            TriggerEvent('chat:addMessage', {
                color = { color.r, color.g, color.b },
                multiline = true,
                args = { text}
            })
        end
    end

    Citizen.CreateThread(function()
        Wait(time)
        displaying = false
    end)
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 0.14
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 2500 then
                DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset, text)
            end
        end
        nbrDisplaying = nbrDisplaying - 0.14
    end)
end

function DrawText3D(x,y,z, text)
	coords = vector3(x, y, z)

	local camCoords = GetGameplayCamCoords()
	local distance = #(coords - camCoords)

	if not size then size = 1 end
	if not font then font = 0 end

	local scale = (size / distance) * 2
	local fov = (1 / GetGameplayCamFov()) * 100
	scale = scale * fov

	SetTextScale(0.0 * scale, 0.55 * scale)
	SetTextFont(font)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	SetDrawOrigin(coords, 0)
	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.0, 0.0)
	ClearDrawOrigin()
end
