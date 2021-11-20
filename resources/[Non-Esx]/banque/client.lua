ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Menu --
local open = false 
local MenuBank = RageUI.CreateMenu("Banque", "INTERACTION")
MenuBank.Display.Header = true 
MenuBank.Closed = function()
  open = false
end

local argentsolde = 0
local argentsoldebank = 0

function OpenMenuBank() 
    if open then 
        open = false
        RageUI.Visible(MenuBank, false)
        return
    else
        open = true
        RageUI.Visible(MenuBank, true)
        Citizen.CreateThread(function()
            while open do 
                RageUI.IsVisible(MenuBank, function()
                    RageUI.Separator("- ~g~Argent Liquide: ~s~"..argentsolde.."$")
                    RageUI.Separator("- ~b~Argent Banque: ~s~"..argentsoldebank.."$")
                    RageUI.Button("Déposer", nil, {RightLabel = "~y~→→→"}, true, {
                        onSelected = function() 
                            local DepotMontant = KeyboardInput("Entrée le montant à déposer", "", 15)
                            if DepotMontant ~= nil then
                                if tonumber(DepotMontant) then
                                    TriggerServerEvent('dpr_Bank:Depot', tonumber(DepotMontant))
                                    RefreshArgent()
                                    RefreshArgentBank()
                                else
                                    return 
                                end
                            end
                        end
                    })
                    RageUI.Button("Retirer", nil, {RightLabel = "~y~→→→"}, true, {
                        onSelected = function() 
                            local RetraitMontant = KeyboardInput("Entrée le montant à retiré", "", 15)
                            if RetraitMontant ~= nil then
                                if tonumber(RetraitMontant) then 
                                    TriggerServerEvent('dpr_Bank:Retrait', tonumber(RetraitMontant))
                                    RefreshArgent()
                                    RefreshArgentBank()
                                else
                                    return
                                end
                            end
                        end
                    })
                    RageUI.Separator("↓     ~r~Fermeture     ~s~↓")
                    RageUI.Button("~r~Fermer", nil, {RightLabel = "~y~→→"}, true, {
                        onSelected = function()
                            RageUI.CloseAll()
                        end
                    })
                end)
            Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
		local wait = 750

			for k in pairs(Configb.Bank.position) do
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local pos = Configb.Bank.position
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
			if dist <= 2.0 then
                wait = 0
                Visual.Subtitle(Configb.Text, 1)
                if IsControlJustPressed(1,51) then
                    RefreshArgent()
                    RefreshArgentBank()
                    OpenMenuBank()
                end
		    end
		end
    Wait(wait)
    end
end)

Citizen.CreateThread(function()
    while true do
		local wait = 750
			for k in pairs(Configb.positionb) do
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local pos = Configb.positionb
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
            if dist <= Configb.MarkerDistance then
                wait = 0
                DrawMarker(Configb.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Configb.MarkerSizeLargeur, Configb.MarkerSizeEpaisseur, Configb.MarkerSizeHauteur, Configb.MarkerColorR, Configb.MarkerColorG, Configb.MarkerColorB, Configb.MarkerOpacite, Configb.MarkerSaute, true, p19, Configb.MarkerTourne)  
            end
			if dist <= 2.0 then
                wait = 0
		    end
		end
    Wait(wait)
    end
end)

function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(1.0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        return result
    else
        Wait(500)
        return nil
    end
end

RegisterNetEvent("dpr_Bank:RefreshArgent")
AddEventHandler("dpr_Bank:RefreshArgent", function(money, cash)
    argentsolde = tonumber(money)
end)

RegisterNetEvent("dpr_Bank:RefreshArgentBank")
AddEventHandler("dpr_Bank:RefreshArgentBank", function(money, cash)
    argentsoldebank = tonumber(money)
end)

function RefreshArgent()
    TriggerServerEvent("dpr_Bank:Argent", action)
end

function RefreshArgentBank()
    TriggerServerEvent("dpr_Bank:ArgentBank", action)
end

-- Blips --
Citizen.CreateThread(function()
    if Configb.BlipBank then
        for k, v in pairs(Configb.positionb) do
            local blipBank = AddBlipForCoord(v.x, v.y, v.z)

            SetBlipSprite(blipBank, Configb.BlipBankId)
            SetBlipScale (blipBank, Configb.BlipBankTaille)
            SetBlipColour(blipBank, Configb.BlipBankCouleur)
            SetBlipAsShortRange(blipBank, Configb.BlipBankRange)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(Configb.BlipBankName)
            EndTextCommandSetBlipName(blipBank)
        end
    end
end)