ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000)
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

function OpenTabacRecolte()
    local TabacRecolte = RageUI.CreateMenu("Recolte tabac", "Tabac")
    
    RageUI.Visible(TabacRecolte, not RageUI.Visible(TabacRecolte))
    
    while TabacRecolte do
        Citizen.Wait(0)
        RageUI.IsVisible(TabacRecolte, true, true, true, function()
                RageUI.ButtonWithStyle("Récolte de tabac", nil, {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RageUI.CloseAll()
                    recoltetabac()
                    end
                end)
        end)
    
        if not RageUI.Visible(TabacRecolte) then
            TabacRecolte = RMenu:DeleteType("TabacRecolte", true)
            end
        end
    end

local recoltepossible = false
Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        while true do
            local Timer = 500
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local playerCoords = GetEntityCoords(PlayerPedId())
            zoneDistance = GetDistanceBetweenCoords(playerCoords, tabac.pos.recolte.position.x, tabac.pos.recolte.position.y, tabac.pos.recolte.position.z)
                if IsEntityAtCoord(PlayerPedId(), 0.0, -0.0, -0.0, 1.5, 1.5, 1.5, 0, 1, 0) then 
                    Timer = 0
                        if IsControlJustPressed(1, 51) then
                            OpenTabacRecolte()
                        end
            end
            if zoneDistance ~= nil then
                if zoneDistance > 1.5 then
                    recoltepossible = false
                end
            end
        Wait(Timer)
    end    
end)

function recoltetabac()
    if not recoltepossible then
        recoltepossible = true
    while recoltepossible do
        Citizen.Wait(2000)
        TriggerServerEvent('tabac')
    end
    else
        recoltepossible = false
    end
end

Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tabac' then
        local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
        local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, tabac.pos.recolte.position.x, tabac.pos.recolte.position.y, tabac.pos.recolte.position.z)
        if dist3 <= 10.0 and tabac.jeveuxmarker then
            Timer = 0
            DrawMarker(20, tabac.pos.recolte.position.x, tabac.pos.recolte.position.y, tabac.pos.recolte.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 75, 0, 255, 0, 1, 2, 0, nil, nil, 0)
            end
            if dist3 <= 1.5 then
                Timer = 0   
                        RageUI.Text({ message = "Appuyez sur ~y~[E]~s~ pour récolter du tabac", time_display = 1 })
                        if IsControlJustPressed(1,51) then           
                            OpenTabacRecolte()
                    end   
                end
            end 
        Citizen.Wait(Timer)
    end
end)