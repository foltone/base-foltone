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

function OpenTabacTraitement()
    local TabacTraitement = RageUI.CreateMenu("Traitement tabac", "Tabac")
    
    RageUI.Visible(TabacTraitement, not RageUI.Visible(TabacTraitement))
    
    while TabacTraitement do
        Citizen.Wait(0)
        RageUI.IsVisible(TabacTraitement, true, true, true, function()
                RageUI.ButtonWithStyle("Sécher le tabac", nil, {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RageUI.CloseAll()
                    traitementtabac()
                    end
                end)
        end)
    
        if not RageUI.Visible(TabacTraitement) then
            TabacTraitement = RMenu:DeleteType("TabacTraitement", true)
            end
        end
    end

local traitementpossible = false
Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        while true do
            local Timer = 500
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local playerCoords = GetEntityCoords(PlayerPedId())
            zoneDistance = GetDistanceBetweenCoords(playerCoords, tabac.pos.traitement.position.x, tabac.pos.traitement.position.y, tabac.pos.traitement.position.z)
                if IsEntityAtCoord(PlayerPedId(), 0.0, -0.0, -0.0, 1.5, 1.5, 1.5, 0, 1, 0) then 
                    Timer = 0
                        if IsControlJustPressed(1, 51) then
                            OpenTabacTraitement()
                        end
                    end
                    if zoneDistance ~= nil then
                        if zoneDistance > 1.5 then
                            traitementpossible = false
                        end
                    end
                Wait(Timer)
            end    
        end)

function traitementtabac()
    if not traitementpossible then
        traitementpossible = true
    while traitementpossible do
        Citizen.Wait(2000)
        TriggerServerEvent('tabacsec')
    end
    else
        traitementpossible = false
    end
end

Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tabac' then
        local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
        local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, tabac.pos.traitement.position.x, tabac.pos.traitement.position.y, tabac.pos.traitement.position.z)
        if dist3 <= 10.0 and tabac.jeveuxmarker then
            Timer = 0
            DrawMarker(20, tabac.pos.traitement.position.x, tabac.pos.traitement.position.y, tabac.pos.traitement.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 75, 0, 255, 0, 1, 2, 0, nil, nil, 0)
            end
            if dist3 <= 3.0 then
                Timer = 0   
                RageUI.Text({ message = "Appuyez sur ~y~[E]~s~ pour sécher le tabac", time_display = 1 })
                        if IsControlJustPressed(1,51) then           
                            OpenTabacTraitement()
                    end   
                end
            end 
        Citizen.Wait(Timer)
    end
end)