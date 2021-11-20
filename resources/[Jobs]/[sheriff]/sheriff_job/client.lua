ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}
local service = false
local bouclier = false

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

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)

Citizen.CreateThread(function()
    local sheriffmap = AddBlipForCoord(Config.pos.blips.position.x, Config.pos.blips.position.y, Config.pos.blips.position.z)
    SetBlipSprite(sheriffmap, 60)
    SetBlipColour(sheriffmap, 46)
    SetBlipScale(sheriffmap, 0.9)
    SetBlipAsShortRange(sheriffmap, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("sheriff")
    EndTextCommandSetBlipName(sheriffmap)
end)

function Menuf6sheriff()
    local rsherifff5 = RageUI.CreateMenu("sheriff", "Interactions")
    local rsherifff5Renfort = RageUI.CreateSubMenu(rsherifff5, "sheriff", "Renfort")
    local rsherifff5Soutien = RageUI.CreateSubMenu(rsherifff5, "sheriff", "Soutien")
    local rsherifff5Chien = RageUI.CreateSubMenu(rsherifff5, "sheriff", "Chien")
    RageUI.Visible(rsherifff5, not RageUI.Visible(rsherifff5))
    while rsherifff5 do
        Citizen.Wait(0)
            RageUI.IsVisible(rsherifff5, true, true, true, function()

                RageUI.Checkbox("Prendre/Quitter son service",nil, service,{},function(Hovered,Ative,Selected,Checked)
                    if Selected then

                        service = Checked

                        if Checked then
                            etatservice = true
                            RageUI.Popup({message = "Vous avez pris votre service !"})
                            TriggerServerEvent('rsheriff:prisedeservice')
                        else
                            etatservice = false
                            RageUI.Popup({message = "Vous avez quitter votre service !"})
                            TriggerServerEvent('rsheriff:quitteleservice')
                        end
                    end
                end)

                if etatservice then

                RageUI.Separator("~r~"..ESX.PlayerData.job.grade_label.." - "..GetPlayerName(PlayerId()))


                RageUI.ButtonWithStyle("Facture / Amende",nil, {RightLabel = "→"}, true, function(_,_,s)
                    local player, distance = ESX.Game.GetClosestPlayer()
                    if s then
                        local raison = ""
                        local montant = 0
                        AddTextEntry("FMMC_MPM_NA", "Objet de la facture")
                        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Donnez le motif de la facture :", "", "", "", "", 30)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0)
                            Wait(0)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            local result = GetOnscreenKeyboardResult()
                            if result then
                                raison = result
                                result = nil
                                AddTextEntry("FMMC_MPM_NA", "Montant de la facture")
                                DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Indiquez le montant de la facture :", "", "", "", "", 30)
                                while (UpdateOnscreenKeyboard() == 0) do
                                    DisableAllControlActions(0)
                                    Wait(0)
                                end
                                if (GetOnscreenKeyboardResult()) then
                                    result = GetOnscreenKeyboardResult()
                                    if result then
                                        montant = result
                                        result = nil
                                        if player ~= -1 and distance <= 3.0 then
                                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_sheriff', ('sheriff'), montant)
                                            TriggerEvent('esx:showAdvancedNotification', 'Fl~g~ee~s~ca ~g~Bank', 'Facture envoyée : ', 'Vous avez envoyé une facture d\'un montant de : ~g~'..montant.. '$ ~s~pour cette raison : ~b~' ..raison.. '', 'CHAR_BANK_FLEECA', 9)
                                        else
                                            ESX.ShowNotification("~r~Probleme~s~: Aucuns joueurs proche")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)

            RageUI.ButtonWithStyle("Interagir avec le citoyen",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then                
                    TriggerEvent('fellow:MenuFouille')
                    RageUI.CloseAll()
                end
            end)

    if ESX.PlayerData.job.grade_name == 'boss' then
        RageUI.ButtonWithStyle("Donner le PPA", "Pour donner le permis port d'arme à quelqu'un", {RightLabel = "→"}, true, function(Hovered, Active, Selected)
            if (Selected) then
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 3.0 then
                    TriggerServerEvent('esx_license:addLicense', GetPlayerServerId(closestPlayer), 'weapon')
                    ESX.ShowNotification('Vous avez donner le ppa')
             else
                ESX.ShowNotification('Aucun joueurs à proximité')
            end
        end
        end)
    end
                  RageUI.Separator('~r~↓ Intéractions sur véhicules ↓')

            RageUI.ButtonWithStyle("Mettre véhicule en fourriere",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                        local playerPed = PlayerPedId()

                        if IsPedSittingInAnyVehicle(playerPed) then
                            local vehicle = GetVehiclePedIsIn(playerPed, false)
            
                            if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                                ESX.ShowNotification('la voiture a été mis en fourrière')
                                ESX.Game.DeleteVehicle(vehicle)
                               
                            else
                                ESX.ShowNotification('Mais toi place conducteur, ou sortez de la voiture.')
                            end
                        else
                            local vehicle = ESX.Game.GetVehicleInDirection()
            
                            if DoesEntityExist(vehicle) then
                                TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CLIPBOARD', 0, true)
                                Citizen.Wait(5000)
                                ClearPedTasks(playerPed)
                                ESX.ShowNotification('La voiture à été placer en fourriere.')
                                ESX.Game.DeleteVehicle(vehicle)
            
                            else
                                ESX.ShowNotification('Aucune voitures autour')
                            end
                        end
                        end
                    end)

                    RageUI.ButtonWithStyle("Rechercher une plaque",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local numplaque = KeyboardInput("Combien ?", "", 10)
                            local length = string.len(numplaque)
                            if not numplaque or length < 2 or length > 8 then
                                ESX.ShowNotification("Ce n'est ~r~pas~s~ un ~y~numéro d'enregistrement valide~s~")
                            else
                                Rechercherplaquevoiture(numplaque)
                                RageUI.CloseAll()
                            end
                        end
                    end)


                RageUI.ButtonWithStyle("Poser/Prendre Radar",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        RageUI.CloseAll()       
                        TriggerEvent('sheriff:sheriff_radar')
                    end
                end)

                  RageUI.Separator('~r~↓ Autres ↓')

                  RageUI.Checkbox("Bouclier",nil, bouclier,{},function(Hovered,Ative,Selected,Checked)
                    if Selected then
    
                        bouclier = Checked
    
    
                        if Checked then
                            EnableShield()
                            
                        else
                            DisableShield()
                        end
                    end
                end)


                RageUI.ButtonWithStyle("Menu Chien", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, rsherifff5Chien)

                  RageUI.ButtonWithStyle("Menu Props",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            ExecuteCommand('props')
                            RageUI.CloseAll()
                        end
                    end)
				
		          RageUI.ButtonWithStyle("Demande de renfort", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                  end, rsherifff5Renfort)
                  
                 -- RageUI.ButtonWithStyle("Soutien sheriff", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                  --end, rsherifff5Soutien)
                end

                end, function() 
                end)

                RageUI.IsVisible(rsherifff5Renfort, true, true, true, function()

                    RageUI.ButtonWithStyle("Petite demande",nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local raison = 'petit'
                            local elements  = {}
                            local playerPed = PlayerPedId()
                            local coords  = GetEntityCoords(playerPed)
                            local name = GetPlayerName(PlayerId())
                        TriggerServerEvent('renfort', coords, raison)
                    end
                end)
            
                RageUI.ButtonWithStyle("Moyenne demande",nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                    if Selected then
                        local raison = 'importante'
                        local elements  = {}
                        local playerPed = PlayerPedId()
                        local coords  = GetEntityCoords(playerPed)
                        local name = GetPlayerName(PlayerId())
                    TriggerServerEvent('renfort', coords, raison)
                end
            end)
            
            RageUI.ButtonWithStyle("Grosse demande",nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                if Selected then
                    local raison = 'omgad'
                    local elements  = {}
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    local name = GetPlayerName(PlayerId())
                TriggerServerEvent('renfort', coords, raison)
            end
            end)
            
                end, function()
                end)

                RageUI.IsVisible(rsherifff5Soutien, true, true, true, function()

                    RageUI.ButtonWithStyle("Émeute de sécurité",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            SpawnVehicle1()
                        end
                        end)
            
                    RageUI.ButtonWithStyle("Moto de sécurité",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            SpawnVehicle2()
                        end
                        end)
                    RageUI.ButtonWithStyle("Camion de sécurité",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            SpawnVehicle3()
                        end
                        end)
                    RageUI.ButtonWithStyle("Vélo de sécurité",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            SpawnVehicle4()
                        end
                        end)
            
                    RageUI.ButtonWithStyle("Sécurité Hélico",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then 
                        SpawnVehicle5()
                    end
                    end)
            
                    RageUI.ButtonWithStyle("Donne des armes",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                        GiveWeaponToPed(chasePed, Config.weapon1, 250, false, true)
                        GiveWeaponToPed(chasePed2, Config.weapon2, 250, false, true)
                        GiveWeaponToPed(chasePed3, Config.weapon3, 250, false, true)
                        GiveWeaponToPed(chasePed4, Config.weapon4, 250, false, true)
                    end
                end)
            
                RageUI.ButtonWithStyle("Attaque le joueur le plus proche",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then 
                        closestPlayer = ESX.Game.GetClosestPlayer()
                        target = GetPlayerPed(closestPlayer)
                        TaskShootAtEntity(chasePed, target, 60, 0xD6FF6D61);
                        TaskCombatPed(chasePed, target, 0, 16)
                        SetEntityAsMissionEntity(chasePed, true, true)
                        SetPedHearingRange(chasePed, 15.0)
                        SetPedSeeingRange(chasePed, 15.0)
                        SetPedAlertness(chasePed, 15.0)
                        SetPedFleeAttributes(chasePed, 0, 0)
                        SetPedCombatAttributes(chasePed, 46, true)
                        SetPedFleeAttributes(chasePed, 0, 0)
                        TaskShootAtEntity(chasePed2, target, 60, 0xD6FF6D61);
                        TaskCombatPed(chasePed2, target, 0, 16)
                        SetEntityAsMissionEntity(chasePed2, true, true)
                        SetPedHearingRange(chasePed2, 15.0)
                        SetPedSeeingRange(chasePed2, 15.0)
                        SetPedAlertness(chasePed2, 15.0)
                        SetPedFleeAttributes(chasePed2, 0, 0)
                        SetPedCombatAttributes(chasePed2, 46, true)
                        SetPedFleeAttributes(chasePed2, 0, 0) 
                        TaskShootAtEntity(chasePed3, target, 60, 0xD6FF6D61);
                        TaskCombatPed(chasePed3, target, 0, 16)
                        SetEntityAsMissionEntity(chasePed3, true, true)
                        SetPedHearingRange(chasePed3, 15.0)
                        SetPedSeeingRange(chasePed3, 15.0)
                        SetPedAlertness(chasePed3, 15.0)
                        SetPedFleeAttributes(chasePed3, 0, 0)
                        SetPedCombatAttributes(chasePed3, 46, true)
                        SetPedFleeAttributes(chasePed3, 0, 0)  
                        TaskShootAtEntity(chasePed4, target, 60, 0xD6FF6D61);
                        TaskCombatPed(chasePed4, target, 0, 16)
                        SetEntityAsMissionEntity(chasePed4, true, true)
                        SetPedHearingRange(chasePed4, 15.0)
                        SetPedSeeingRange(chasePed4, 15.0)
                        SetPedAlertness(chasePed4, 15.0)
                        SetPedFleeAttributes(chasePed4, 0, 0)
                        SetPedCombatAttributes(chasePed4, 46, true)
                        SetPedFleeAttributes(chasePed4, 0, 0)
                end
            end)
            
                RageUI.ButtonWithStyle("Suivez-moi",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then 
                        local playerPed = PlayerPedId()
                        TaskVehicleFollow(chasePed, chaseVehicle, playerPed, 50.0, 1, 5)
                        TaskVehicleFollow(chasePed2, chaseVehicle2, playerPed, 50.0, 1, 5)
                        TaskVehicleFollow(chasePed3, chaseVehicle3, playerPed, 50.0, 1, 5)
                        TaskVehicleFollow(chasePed4, chaseVehicle4, playerPed, 50.0, 1, 5)
                        TaskVehicleFollow(chasePed5, chaseVehicle5, playerPed, 50.0, 1, 5)
                        PlayAmbientSpeech1(chasePed, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
                        PlayAmbientSpeech1(chasePed2, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
                        PlayAmbientSpeech1(chasePed3, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
                        PlayAmbientSpeech1(chasePed4, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
                        PlayAmbientSpeech1(chasePed5, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
                end
            end)
            
                RageUI.ButtonWithStyle("Supprimer",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then 
                        local playerPed = PlayerPedId()
                        DeleteVehicle(chaseVehicle)
                        DeletePed(chasePed)
                        DeleteVehicle(chaseVehicle2)
                        DeletePed(chasePed2)
                        DeleteVehicle(chaseVehicle3)
                        DeletePed(chasePed3)
                        DeleteVehicle(chaseVehicle4)
                        DeletePed(chasePed4)
                        DeleteVehicle(chaseVehicle5)
                        DeletePed(chasePed5)
                end
            end)
            
            end, function()
            end)


            RageUI.IsVisible(rsherifff5Chien, true, true, true, function()

                RageUI.ButtonWithStyle("Sortir/Rentrer le chien",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        if not DoesEntityExist(sheriffDog) then
                            RequestModel(351016938)
                            while not HasModelLoaded(351016938) do Wait(0) end
                            sheriffDog = CreatePed(4, 351016938, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -0.98), 0.0, true, false)
                            SetEntityAsMissionEntity(sheriffDog, true, true)
                            ESX.ShowNotification('~g~Chien Spawn')
                        else
                            ESX.ShowNotification('~r~Chien Rentrer')
                            DeleteEntity(sheriffDog)
                        end
                    end
                end)

                RageUI.ButtonWithStyle("Assis",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        if DoesEntityExist(sheriffDog) then
                            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(sheriffDog), true) <= 5.0 then
                                if IsEntityPlayingAnim(sheriffDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 3) then
                                    ClearPedTasks(sheriffDog)
                                else
                                    loadDict('rcmnigel1c')
                                    TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 120, 0, false, false, false)
                                    Wait(2000)
                                    loadDict("creatures@rottweiler@amb@world_dog_sitting@base")
                                    TaskPlayAnim(sheriffDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
                                end
                            else
                                ESX.ShowNotification('~r~Le chien est trop loin de vous !')
                            end
                        else
                            ESX.ShowNotification('~r~Vous n\'avez pas de chien !')
                        end
                    end
                end)

                RageUI.ButtonWithStyle("Dire d'attaquer",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        if DoesEntityExist(sheriffDog) then
                            if not IsPedDeadOrDying(sheriffDog) then
                                if GetDistanceBetweenCoords(GetEntityCoords(sheriffDog), GetEntityCoords(PlayerPedId()), true) <= 3.0 then
                                    local player, distance = ESX.Game.GetClosestPlayer()
                                    if distance ~= -1 then
                                        if distance <= 3.0 then
                                            local playerPed = GetPlayerPed(player)
                                            if not IsPedInCombat(sheriffDog, playerPed) then
                                                if not IsPedInAnyVehicle(playerPed, true) then
                                                    TaskCombatPed(sheriffDog, playerPed, 0, 16)
                                                end
                                            else
                                                ClearPedTasksImmediately(sheriffDog)
                                            end
                                        end
                                    else
                                        ESX.ShowNotification("~r~Probleme~s~: Aucuns joueurs proche")
                                    end
                                else
                                    ESX.ShowNotification('~r~Le chien est trop loin de vous !')
                                end
                            else
                                ESX.ShowNotification('Votre chien est mort !')
                            end
                        else
                            ESX.ShowNotification('~r~Vous n\'avez pas de chien')
                    end
                end
            end)
        

            RageUI.ButtonWithStyle("Monter/sortir du véhicule",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    if DoesEntityExist(sheriffDog) then
                    if not IsPedInAnyVehicle(sheriffDog, false) then
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(sheriffDog)) <= 10.0 then
                            local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 7.5, 0, 70)
                            print(vehicle)
                            if DoesEntityExist(vehicle) then
                                for i = 0, GetVehicleMaxNumberOfPassengers(vehicle) do
                                    if IsVehicleSeatFree(vehicle, i) then
                                        TaskEnterVehicle(sheriffDog, vehicle, 15.0, i, 1.0, 1, 0)
                                        break
                                    end
                                end
                            else
                                ESX.ShowNotification('~r~vous n\'avez pas de véhicule !')
                            end
                        else
                            ESX.ShowNotification('~r~Le chien est trop loin de vous !')
                        end
                    else
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(sheriffDog)) <= 5.0 then
                            TaskLeaveVehicle(sheriffDog, GetVehiclePedIsIn(sheriffDog, false), 0)
                        else
                            ESX.ShowNotification('~r~Le chien est trop loin de vous !')
                        end
                    end
                else
                    ESX.ShowNotification('~r~Vous n\'avez pas de chien !')
                end
                end
            end)

            RageUI.ButtonWithStyle("Suis-moi",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    local playerPed = PlayerPedId()
                    if DoesEntityExist(sheriffDog) then
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(sheriffDog), true) <= 5.0 then
                            TaskGoToEntity(sheriffDog, playerPed, -1, 1.0, 10.0, 1073741824, 1)
                        else
                            ESX.ShowNotification('~r~Le chien est trop loin de vous !')
                        end
                    else
                        ESX.ShowNotification('~r~Vous n\'avez pas de chien !')
                    end
                end
            end)
            end, function()
            end)
                if not RageUI.Visible(rsherifff5) and not RageUI.Visible(rsherifff5Renfort) and not RageUI.Visible(rsherifff5Soutien) and not RageUI.Visible(rsherifff5Chien) then
                    rsherifff5 = RMenu:DeleteType("sheriff", true)
        end
    end
end


Keys.Register('F6', 'sheriff', 'Ouvrir le menu sheriff', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sheriff' then
    	Menuf6sheriff()
	end
end)

function Rechercherplaquevoiture(plaquerechercher)
    local PlaqueMenu = RageUI.CreateMenu("plaque d'immatriculation", "Informations")
    ESX.TriggerServerCallback('rsheriff:getVehicleInfos', function(retrivedInfo)
    RageUI.Visible(PlaqueMenu, not RageUI.Visible(PlaqueMenu))
        while PlaqueMenu do
            Citizen.Wait(0)
                RageUI.IsVisible(PlaqueMenu, true, true, true, function()
                    local hashvoiture = retrivedInfo.vehicle.model
                    local nomvoituremodele = GetDisplayNameFromVehicleModel(hashvoiture)
                    local nomvoituretexte  = GetLabelText(nomvoituremodele)
                            RageUI.ButtonWithStyle("Numéro de plaque : ", nil, {RightLabel = retrivedInfo.plate}, true, function(Hovered, Active, Selected)
                                if Selected then
                                end
                            end)

                            if not retrivedInfo.owner then
                                RageUI.ButtonWithStyle("Propriétaire : ", nil, {RightLabel = "Inconnu"}, true, function(Hovered, Active, Selected)
                                    if Selected then
                                    end
                                end)
                            else
                                RageUI.ButtonWithStyle("Propriétaire : ", nil, {RightLabel = retrivedInfo.owner}, true, function(Hovered, Active, Selected)
                                    if Selected then
                                    end
                                end)
                                
                                RageUI.ButtonWithStyle("Modèle du véhicule : ", nil, {RightLabel = nomvoituretexte}, true, function(Hovered, Active, Selected)
                                    if Selected then
                                    end
                                end)
                            end
                end, function()
                end)
            if not RageUI.Visible(PlaqueMenu) then
            PlaqueMenu = RMenu:DeleteType("plaque d'immatriculation", true)
        end
    end
end, plaquerechercher)
end



function Coffresheriff()
    local Csheriff = RageUI.CreateMenu("Coffre", "sheriff")
        RageUI.Visible(Csheriff, not RageUI.Visible(Csheriff))
            while Csheriff do
            Citizen.Wait(0)
            RageUI.IsVisible(Csheriff, true, true, true, function()

                RageUI.Separator("~y~↓ Objet ↓")

                    RageUI.ButtonWithStyle("Retirer",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            FRetirerobjet()
                            RageUI.CloseAll()
                        end
                    end)
                    
                    RageUI.ButtonWithStyle("Déposer",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            ADeposerobjet()
                            RageUI.CloseAll()
                        end
                    end)
                end, function()
                end)
            if not RageUI.Visible(Csheriff) then
            Csheriff = RMenu:DeleteType("Csheriff", true)
        end
    end
end

Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sheriff' then
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, Config.pos.coffre.position.x, Config.pos.coffre.position.y, Config.pos.coffre.position.z)
            if jobdist <= 10.0 and Config.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Config.pos.coffre.position.x, Config.pos.coffre.position.y, Config.pos.coffre.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 0, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if jobdist <= 1.0 then
                    Timer = 0
                        RageUI.Text({ message = "Appuyez sur ~b~[E]~s~ pour accéder au coffre", time_display = 1 })
                        if IsControlJustPressed(1,51) then
                        Coffresheriff()
                    end   
                end
            end 
        Citizen.Wait(Timer)   
    end
end)


--- vestiaire


function vestiairesheriff()
    local Vsheriff = RageUI.CreateMenu("Vestiaire", "sheriff")
        RageUI.Visible(Vsheriff, not RageUI.Visible(Vsheriff))
            while Vsheriff do
            Citizen.Wait(0)
            RageUI.IsVisible(Vsheriff, true, true, true, function()
                RageUI.Separator("~y~↓ Votre Tenue ↓")
                    if ESX.PlayerData.job.grade_name == 'recruit' then
                    RageUI.ButtonWithStyle("Tenue Recrue",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            tenuerecrue()
                            RageUI.CloseAll()
                        end
                    end)
                end
                    if ESX.PlayerData.job.grade_name == 'officer' then
                    RageUI.ButtonWithStyle("Tenue Officier",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            tenueofficier()
                            RageUI.CloseAll()
                        end
                    end)
                end
                    if ESX.PlayerData.job.grade_name == 'sergeant' then
                    RageUI.ButtonWithStyle("Tenue Sergent",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            tenuesergeant()
                            RageUI.CloseAll()
                        end
                    end)
                end
                    if ESX.PlayerData.job.grade_name == 'lieutenant' then
                    RageUI.ButtonWithStyle("Tenue Lieutenant",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            tenuelieutenant()
                            RageUI.CloseAll()
                        end
                    end)
                end
                    if ESX.PlayerData.job.grade_name == 'boss' then
                    RageUI.ButtonWithStyle("Tenue Commandant",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            tenueboss()
                            RageUI.CloseAll()
                        end
                    end)
                end

                    RageUI.ButtonWithStyle("Remettre sa tenue",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            vcivil()
                            RageUI.CloseAll()
                        end
                    end)

            RageUI.Separator("~g~↓ Gilet par balle ↓")

            RageUI.ButtonWithStyle("Mettre",nil, {nil}, true, function(Hovered, Active, Selected)
                if Selected then
                    mettrebullet_wear()
                    SetPedArmour(GetPlayerPed(-1), 100)
                end
            end)

            RageUI.ButtonWithStyle("Enlever",nil, {nil}, true, function(Hovered, Active, Selected)
                if Selected then
                    enleverbullet_wear()
                    SetPedArmour(GetPlayerPed(-1), 0)
                end
            end)
                end, function()
                end)
            if not RageUI.Visible(Vsheriff) then
            Vsheriff = RMenu:DeleteType("Vestiaire", true)
        end
    end
end

function tenuerecrue()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.Uniforms.recruit.male
        else
            uniformObject = Config.Uniforms.recruit.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenueofficier()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.Uniforms.officer.male
        else
            uniformObject = Config.Uniforms.officer.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuesergeant()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.Uniforms.sergeant.male
        else
            uniformObject = Config.Uniforms.sergeant.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuelieutenant()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.Uniforms.lieutenant.male
        else
            uniformObject = Config.Uniforms.lieutenant.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenueboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.Uniforms.boss.male
        else
            uniformObject = Config.Uniforms.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function mettrebullet_wear()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.Uniforms.bullet_wear.male
        else
            uniformObject = Config.Uniforms.bullet_wear.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function enleverbullet_wear()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.Uniforms.bullet_wearno.male
        else
            uniformObject = Config.Uniforms.bullet_wearno.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end


function vcivil()
ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
TriggerEvent('skinchanger:loadSkin', skin)
end)
end


Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sheriff' then
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, Config.pos.vestiaire.position.x, Config.pos.vestiaire.position.y, Config.pos.vestiaire.position.z)
            if jobdist <= 10.0 and Config.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Config.pos.vestiaire.position.x, Config.pos.vestiaire.position.y, Config.pos.vestiaire.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 0, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if jobdist <= 1.0 then
                    Timer = 0
                        RageUI.Text({ message = "Appuyez sur ~b~[E]~s~ pour accéder au vestiaire", time_display = 1 })
                        if IsControlJustPressed(1,51) then
                        vestiairesheriff()
                    end   
                end
            end 
        Citizen.Wait(Timer)   
    end
end)


--- fin



-- Garage

function Garagesheriff()
  local Gsheriff = RageUI.CreateMenu("Garage", "sheriff")
    RageUI.Visible(Gsheriff, not RageUI.Visible(Gsheriff))
        while Gsheriff do
            Citizen.Wait(0)
                RageUI.IsVisible(Gsheriff, true, true, true, function()
                    RageUI.ButtonWithStyle("Ranger la voiture", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                        local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                        if dist4 < 4 then
                            DeleteEntity(veh)
                            end 
                        end
                    end) 

                    for k,v in pairs(Gsheriffvoiture) do
                    RageUI.ButtonWithStyle(v.nom, nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                        if (Selected) then
                        Citizen.Wait(1)  
                            spawnuniCarsheriff(v.modele)
                            RageUI.CloseAll()
                            end
                        end)
                    end
                end, function()
                end)
            if not RageUI.Visible(Gsheriff) then
            Gsheriff = RMenu:DeleteType("Garage", true)
        end
    end
end

Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sheriff' then
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Config.pos.garage.position.x, Config.pos.garage.position.y, Config.pos.garage.position.z)
            if dist3 <= 10.0 and Config.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Config.pos.garage.position.x, Config.pos.garage.position.y, Config.pos.garage.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 0, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist3 <= 3.0 then
                Timer = 0   
                    RageUI.Text({ message = "Appuyez sur ~b~[E]~s~ pour accéder au garage", time_display = 1 })
                    if IsControlJustPressed(1,51) then           
                        Garagesheriff()
                    end   
                end
            end 
        Citizen.Wait(Timer)
     end
end)

function spawnuniCarsheriff(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, Config.pos.spawnvoiture.position.x, Config.pos.spawnvoiture.position.y, Config.pos.spawnvoiture.position.z, Config.pos.spawnvoiture.position.h, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "AZPTQ"..math.random(1,9)
    SetVehicleNumberPlateText(vehicle, plaque) 
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
end

function Helisheriff()
    local Hsheriff = RageUI.CreateMenu("Garage", "sheriff")
      RageUI.Visible(Hsheriff, not RageUI.Visible(Hsheriff))
          while Hsheriff do
              Citizen.Wait(0)
                  RageUI.IsVisible(Hsheriff, true, true, true, function()
                      RageUI.ButtonWithStyle("Ranger le hélicoptère", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                          if (Selected) then   
                          local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                          if dist4 < 4 then
                              DeleteEntity(veh)
                              RageUI.CloseAll()
                              end 
                          end
                      end) 
  
                      for k,v in pairs(Hsheriffheli) do
                      RageUI.ButtonWithStyle(v.nom, nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                          if (Selected) then
                          Citizen.Wait(1)  
                            spawnuniCarheli(v.modele)
                              RageUI.CloseAll()
                              end
                          end)
                      end
                  end, function()
                  end)
              if not RageUI.Visible(Hsheriff) then
              Hsheriff = RMenu:DeleteType("Garage", true)
          end
      end
end
  
Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sheriff' then
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Config.pos.garageheli.position.x, Config.pos.garageheli.position.y, Config.pos.garageheli.position.z)
            if dist3 <= 10.0 and Config.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Config.pos.garageheli.position.x, Config.pos.garageheli.position.y, Config.pos.garageheli.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 0, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist3 <= 3.0 then
                Timer = 0   
                    RageUI.Text({ message = "Appuyez sur ~b~[E]~s~ pour accéder au garage des hélicoptères", time_display = 1 })
                    if IsControlJustPressed(1,51) then           
                        Helisheriff()
                    end   
                end
            end 
        Citizen.Wait(Timer)
    end
end)
  
function spawnuniCarheli(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, Config.pos.spawnheli.position.x, Config.pos.spawnheli.position.y, Config.pos.spawnheli.position.z, Config.pos.spawnheli.position.h, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "AZPTQ"..math.random(1,9)
    SetVehicleNumberPlateText(vehicle, plaque) 
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
end

itemstock = {}
function FRetirerobjet()
    local Stocksheriff = RageUI.CreateMenu("Coffre", "sheriff")
    ESX.TriggerServerCallback('rsheriff:getStockItems', function(items) 
    itemstock = items
   
    RageUI.Visible(Stocksheriff, not RageUI.Visible(Stocksheriff))
        while Stocksheriff do
            Citizen.Wait(0)
                RageUI.IsVisible(Stocksheriff, true, true, true, function()
                        for k,v in pairs(itemstock) do 
                            if v.count > 0 then
                            RageUI.ButtonWithStyle(v.label, nil, {RightLabel = v.count}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local count = KeyboardInput("Combien ?", "", 2)
                                    TriggerServerEvent('rsheriff:getStockItem', v.name, tonumber(count))
                                    FRetirerobjet()
                                end
                            end)
                        end
                    end
                end, function()
                end)
            if not RageUI.Visible(Stocksheriff) then
            Stocksheriff = RMenu:DeleteType("Coffre", true)
        end
    end
     end)
end



function ADeposerobjet()
    local StockPlayer = RageUI.CreateMenu("Coffre", "sheriff")
    ESX.TriggerServerCallback('rsheriff:getPlayerInventory', function(inventory)
        RageUI.Visible(StockPlayer, not RageUI.Visible(StockPlayer))
    while StockPlayer do
        Citizen.Wait(0)
            RageUI.IsVisible(StockPlayer, true, true, true, function()
                for i=1, #inventory.items, 1 do
                    if inventory ~= nil then
                         local item = inventory.items[i]
                            if item.count > 0 then
                                        RageUI.ButtonWithStyle(item.label, nil, {RightLabel = item.count}, true, function(Hovered, Active, Selected)
                                            if Selected then
                                            local count = KeyboardInput("Combien ?", '' , 8)
                                            TriggerServerEvent('rsheriff:putStockItems', item.name, tonumber(count))
                                            ADeposerobjet()
                                        end
                                    end)
                            end
                    end
                end
                    end, function()
                    end)
                if not RageUI.Visible(StockPlayer) then
                StockPlayer = RMenu:DeleteType("Coffre", true)
            end
        end
    end)
end



function plaintesheriff()
    local Psheriff = RageUI.CreateMenu("Plainte", "sheriff")
        RageUI.Visible(Psheriff, not RageUI.Visible(Psheriff))
            while Psheriff do
            Citizen.Wait(0)
            RageUI.IsVisible(Psheriff, true, true, true, function()

                    RageUI.ButtonWithStyle("Porter plainte",nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local Msg = KeyboardInput("Message", '' , 50)
                            TriggerServerEvent('gaming:plainte',Msg)
                            RageUI.CloseAll()
                        end
                    end)
                end, function()
                end)
            if not RageUI.Visible(Psheriff) then
            Psheriff = RMenu:DeleteType("Psheriff", true)
        end
    end
end


Citizen.CreateThread(function()
        while true do
            local Timer = 500
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, Config.pos.plainte.position.x, Config.pos.plainte.position.y, Config.pos.plainte.position.z)
            if jobdist <= 10.0 and Config.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Config.pos.plainte.position.x, Config.pos.plainte.position.y, Config.pos.plainte.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 0, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if jobdist <= 1.0 then
                    Timer = 0
                        RageUI.Text({ message = "Appuyez sur ~b~[E]~s~ pour porter plainte", time_display = 1 })
                        if IsControlJustPressed(1,51) then
                        plaintesheriff()   
                end
            end 
        Citizen.Wait(Timer)   
    end
end)

RegisterNetEvent('renfort:setBlip')
AddEventHandler('renfort:setBlip', function(coords, raison)
	if raison == 'petit' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowAdvancedNotification('sheriff INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-2\n~w~Importance: ~g~Légère.', 'char_stretch3', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 2
	elseif raison == 'importante' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowAdvancedNotification('sheriff INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-3\n~w~Importance: ~o~Importante.', 'char_stretch3', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 47
	elseif raison == 'omgad' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
		ESX.ShowAdvancedNotification('sheriff INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-99\n~w~Importance: ~r~URGENTE !\nDANGER IMPORTANT', 'char_stretch3', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
		color = 1
	end
	local blipId = AddBlipForCoord(coords)
	SetBlipSprite(blipId, 161)
	SetBlipScale(blipId, 1.2)
	SetBlipColour(blipId, color)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Demande renfort')
	EndTextCommandSetBlipName(blipId)
	Wait(80 * 1000)
	RemoveBlip(blipId)
end)

RegisterNetEvent('sheriff:InfoService')
AddEventHandler('sheriff:InfoService', function(service, nom)
	if service == 'prise' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('sheriff INFORMATIONS', '~b~Prise de service', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-8\n~w~Information: ~g~Prise de service.', 'char_stretch3', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'fin' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('sheriff INFORMATIONS', '~b~Fin de service', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-10\n~w~Information: ~g~Fin de service.', 'char_stretch3', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'pause' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('sheriff INFORMATIONS', '~b~Pause de service', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-6\n~w~Information: ~g~Pause de service.', 'char_stretch3', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'standby' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('sheriff INFORMATIONS', '~b~Mise en standby', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-12\n~w~Information: ~g~Standby, en attente de dispatch.', 'char_stretch3', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'control' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('sheriff INFORMATIONS', '~b~Control routier', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-48\n~w~Information: ~g~Control routier en cours.', 'char_stretch3', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'refus' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('sheriff INFORMATIONS', '~b~Refus d\'obtemperer', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-30\n~w~Information: ~g~Refus d\'obtemperer / Delit de fuite en cours.', 'char_stretch3', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'crime' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('sheriff INFORMATIONS', '~b~Crime en cours', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-31\n~w~Information: ~g~Crime en cours / poursuite en cours.', 'char_stretch3', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	end
end)

local shieldActive = false
local shieldEntity = nil

-- ANIM
local animDict = "combat@gestures@gang@pistol_1h@beckon"
local animName = "0"

local prop = "prop_ballistic_shield"

function EnableShield()
    shieldActive = true
    local ped = GetPlayerPed(-1)
    local pedPos = GetEntityCoords(ped, false)
    
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(250)
    end

    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)

    RequestModel(GetHashKey(prop))
    while not HasModelLoaded(GetHashKey(prop)) do
        Citizen.Wait(250)
    end

    local shield = CreateObject(GetHashKey(prop), pedPos.x, pedPos.y, pedPos.z, 1, 1, 1)
    shieldEntity = shield
    AttachEntityToEntity(shieldEntity, ped, GetEntityBoneIndexByName(ped, "IK_L_Hand"), 0.0, -0.05, -0.10, -30.0, 180.0, 40.0, 0, 0, 1, 0, 0, 1)
    SetWeaponAnimationOverride(ped, GetHashKey("Gang1H"))
    SetEnableHandcuffs(ped, true)
end

function DisableShield()
    local ped = GetPlayerPed(-1)
    DeleteEntity(shieldEntity)
    ClearPedTasksImmediately(ped)
    SetWeaponAnimationOverride(ped, GetHashKey("Default"))
    SetEnableHandcuffs(ped, false)
    shieldActive = false
end

Citizen.CreateThread(function()
    while true do
        if shieldActive then
            local ped = GetPlayerPed(-1)
            if not IsEntityPlayingAnim(ped, animDict, animName, 1) then
                RequestAnimDict(animDict)
                while not HasAnimDictLoaded(animDict) do
                    Citizen.Wait(100)
                end
            
                TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)
            end
        end
        Citizen.Wait(500)
    end
end)


----- Soutien sheriff

function SpawnVehicle1()
	local playerPed = PlayerPedId()
	local PedPosition = GetEntityCoords(playerPed)
	hashKey = GetHashKey(Config.ped1)
	pedType = GetPedType(hashKey)
	RequestModel(hashKey)
	while not HasModelLoaded(hashKey) do
	  RequestModel(hashKey)
	  Citizen.Wait(100)
	end
	chasePed = CreatePed(pedType, hashKey, PedPosition.x + 2,  PedPosition.y,  PedPosition.z, 250.00, 1, 1)
	ESX.Game.SpawnVehicle(Config.vehicle1, {
	  x = PedPosition.x + 10 ,
	  y = PedPosition.y,
	  z = PedPosition.z
	},120, function(callback_vehicle)
	  chaseVehicle = callback_vehicle
	  local vehicle = GetVehiclePedIsIn(PlayerPed, true)
	  SetVehicleUndriveable(chaseVehicle, false)
	  SetVehicleEngineOn(chaseVehicle, true, true)
	  while not chasePed do Citizen.Wait(100) end;
	  PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
	  TaskWarpPedIntoVehicle(chasePed, chaseVehicle, -1)
	  TaskVehicleFollow(chasePed, chaseVehicle, playerPed, 50.0, 1, 5)
	  SetDriveTaskDrivingStyle(chasePed, 786468)
	  SetVehicleSiren(chaseVehicle, true)
	end)
end

function SpawnVehicle2()
local playerPed = PlayerPedId()
local PedPosition = GetEntityCoords(playerPed)
hashKey2 = GetHashKey(Config.ped2)
pedType2 = GetPedType(hashKey)
RequestModel(hashKey2)
while not HasModelLoaded(hashKey2) do
    RequestModel(hashKey2)
    Citizen.Wait(100)
end
chasePed2 = CreatePed(pedType2, hashKey2, PedPosition.x + 4,  PedPosition.y,  PedPosition.z, 250.00, 1, 1)
ESX.Game.SpawnVehicle(Config.vehicle2, {
    x = PedPosition.x + 15 ,
    y = PedPosition.y,
    z = PedPosition.z
},120, function(callback_vehicle2)
    chaseVehicle2 = callback_vehicle2
    local vehicle = GetVehiclePedIsIn(PlayerPed, true)
    SetVehicleUndriveable(chaseVehicle2, false)
    SetVehicleEngineOn(chaseVehicle2, true, true)
    while not chasePed2 do Citizen.Wait(100) end;
    while not chaseVehicle2 do Citizen.Wait(100) end;
    PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
    TaskWarpPedIntoVehicle(chasePed2, chaseVehicle2, -1)
    TaskVehicleFollow(chasePed2, chaseVehicle2, playerPed, 50.0, 1, 5)
    SetDriveTaskDrivingStyle(chasePed2, 786468)
    SetVehicleSiren(chaseVehicle2, true)
end)
end

function SpawnVehicle3()
local playerPed = PlayerPedId()
local PedPosition = GetEntityCoords(playerPed)
hashKey3 = GetHashKey(Config.ped3)
pedType3 = GetPedType(hashKey)
RequestModel(hashKey3)
while not HasModelLoaded(hashKey3) do
    RequestModel(hashKey3)
    Citizen.Wait(100)
end
chasePed3 = CreatePed(pedType3, hashKey3, PedPosition.x + 2,  PedPosition.y,  PedPosition.z, 250.00, 1, 1)
ESX.Game.SpawnVehicle(Config.vehicle3, {
    x = PedPosition.x + 10 ,
    y = PedPosition.y,
    z = PedPosition.z
},120, function(callback_vehicle3)
    chaseVehicle3 = callback_vehicle3
    local vehicle = GetVehiclePedIsIn(PlayerPed, true)
    SetVehicleUndriveable(chaseVehicle3, false)
    SetVehicleEngineOn(chaseVehicle3, true, true)
    while not chasePed3 do Citizen.Wait(100) end;
    while not chaseVehicle3 do Citizen.Wait(100) end;
    PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
    TaskWarpPedIntoVehicle(chasePed3, chaseVehicle3, -1)
    TaskVehicleFollow(chasePed3, chaseVehicle3, playerPed, 50.0, 1, 5)
    SetDriveTaskDrivingStyle(chasePed3, 786468)
    SetVehicleSiren(chaseVehicle3, true)
end)
end

function SpawnVehicle4()
local playerPed = PlayerPedId()
local PedPosition = GetEntityCoords(playerPed)
hashKey4 = GetHashKey(Config.ped4)
pedType4 = GetPedType(hashKey)
RequestModel(hashKey4)
while not HasModelLoaded(hashKey4) do
    RequestModel(hashKey4)
    Citizen.Wait(100)
end
chasePed4 = CreatePed(pedType4, hashKey4, PedPosition.x + 2,  PedPosition.y,  PedPosition.z, 250.00, 1, 1)
ESX.Game.SpawnVehicle(Config.vehicle4, {
    x = PedPosition.x + 10 ,
    y = PedPosition.y,
    z = PedPosition.z
},120, function(callback_vehicle4)
    chaseVehicle4 = callback_vehicle4
    local vehicle = GetVehiclePedIsIn(PlayerPed, true)
    SetVehicleUndriveable(chaseVehicle4, false)
    SetVehicleEngineOn(chaseVehicle4, true, true)
    while not chasePed4 do Citizen.Wait(100) end;
    while not chaseVehicle4 do Citizen.Wait(100) end;
    PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
    TaskWarpPedIntoVehicle(chasePed4, chaseVehicle4, -1)
    TaskVehicleFollow(chasePed4, chaseVehicle4, playerPed, 50.0, 1, 5)
    SetDriveTaskDrivingStyle(chasePed4, 786468)
    SetVehicleSiren(chaseVehicle4, true)
end)
end

function SpawnVehicle5()
local playerPed = PlayerPedId()
local PedPosition = GetEntityCoords(playerPed)
hashKey5 = GetHashKey(Config.ped5)
pedType5 = GetPedType(hashKey)
RequestModel(hashKey5)
while not HasModelLoaded(hashKey5) do
    RequestModel(hashKey5)
    Citizen.Wait(100)
end
chasePed5 = CreatePed(pedType5, hashKey5, PedPosition.x + 2,  PedPosition.y,  PedPosition.z, 250.00, 1, 1)
ESX.Game.SpawnVehicle(Config.vehicle5, {
    x = PedPosition.x + 10 ,
    y = PedPosition.y,
    z = PedPosition.z
},120, function(callback_vehicle5)
    chaseVehicle5 = callback_vehicle5
    local vehicle = GetVehiclePedIsIn(PlayerPed, true)
    SetVehicleUndriveable(chaseVehicle5, false)
    SetVehicleEngineOn(chaseVehicle5, true, true)
    while not chasePed5 do Citizen.Wait(100) end;
    while not chaseVehicle5 do Citizen.Wait(100) end;
    PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
    TaskWarpPedIntoVehicle(chasePed5, chaseVehicle5, freeSeat)
    TaskVehicleFollow(chasePed5, chaseVehicle5, playerPed, 50.0, 1, 5)
    SetDriveTaskDrivingStyle(chasePed5, 786468)
    SetVehicleSiren(chaseVehicle5, false)
end)
end


loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end



-------armurerie

RMenu.Add('armurerielssd', 'main', RageUI.CreateMenu("Armurerie", " "))
RMenu:Get("armurerielssd", "main").Closed = function()
    armulssd = false
end

function openarmulssd()
    if armulssd then
        armulssd = false
        RageUI.CloseAll()
    else
        armulssd = true
        RageUI.Visible(RMenu:Get("armurerielssd","main"), true)
        Citizen.CreateThread(function()
            while armulssd do
                Citizen.Wait(1)
        RageUI.IsVisible(RMenu:Get('armurerielssd', 'main'), true, true, true, function()   

            RageUI.ButtonWithStyle("Déposer les armes",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                RemoveServiceWeapons()
            end
        end)
        

            RageUI.ButtonWithStyle("Equipement de base", nil, { },true, function(Hovered, Active, Selected)
                if (Selected) then   
                    TriggerServerEvent('equipementbase')
                end
            end)


            --[[if ESX.PlayerData.job.grade_name == 'officer' then --Gardien de la paix
                for k,v in pairs(Config.armurerieofficer) do
                RageUI.ButtonWithStyle(v.nom, nil, { },true, function(Hovered, Active, Selected)
                    if (Selected) then   
                        TriggerServerEvent('armurerie', v.arme, v.prix)
                    end
                end)
            end
        end]]

            if ESX.PlayerData.job.grade_name == 'officer' then
                for k,v in pairs(Config.armurerieofficer) do
                RageUI.ButtonWithStyle(v.nom, nil, { },true, function(Hovered, Active, Selected)
                    if (Selected) then   
                        TriggerServerEvent('armurerie', v.arme, v.prix)
                    end
                end)
            end
        end

            if ESX.PlayerData.job.grade_name == 'sergeant' then
                for k,v in pairs(Config.armureriesergeant) do
                RageUI.ButtonWithStyle(v.nom, nil, { },true, function(Hovered, Active, Selected)
                    if (Selected) then   
                        TriggerServerEvent('armurerie', v.arme, v.prix)
                    end
                end)
            end
        end
        

            if ESX.PlayerData.job.grade_name == 'lieutenant' then
                for k,v in pairs(Config.armurerielieutenant) do
                RageUI.ButtonWithStyle(v.nom, nil, { },true, function(Hovered, Active, Selected)
                    if (Selected) then   
                        TriggerServerEvent('armurerie', v.arme, v.prix)
                    end
                end)
            end
        end

            if ESX.PlayerData.job.grade_name == 'boss' then
                for k,v in pairs(Config.armurerieboss) do
                RageUI.ButtonWithStyle(v.nom, nil, { },true, function(Hovered, Active, Selected)
                    if (Selected) then   
                        TriggerServerEvent('armurerie', v.arme, v.prix)
                    end
                end)
            end
        end



    
    end, function()
    end, 1)
end
end)
Citizen.Wait(0)
end
end

Citizen.CreateThread(function()
        while true do
            local wait = 750
                local plyCoords2 = GetEntityCoords(GetPlayerPed(-1), false)
                local dist2 = Vdist(plyCoords2.x, plyCoords2.y, plyCoords2.z, Config.pos.armurerie.position.x, Config.pos.armurerie.position.y, Config.pos.armurerie.position.z)
                if dist2 <= 5.0 then
                    wait = 0
                DrawMarker(20, Config.pos.armurerie.position.x, Config.pos.armurerie.position.y, Config.pos.armurerie.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 0, 255, 0, 1, 2, 0, nil, nil, 0)    
            end
		    if dist2 <= 1.0 then
                wait = 0
		    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sheriff' then 	
                RageUI.Text({ message = "Appuyez sur ~b~[E]~s~ pour accéder à l'arsenal", time_display = 1 })
                if IsControlJustPressed(1,51) then           
                    openarmulssd()
                end     
                end
            end
        Citizen.Wait(wait) 
    end
end)
function RemoveServiceWeapons()
	local pPed = GetPlayerPed(-1)
	for k,v in pairs(config.serviceWeapons) do
		RemoveWeaponFromPed(pPed, GetHashKey(v))
	end
end

