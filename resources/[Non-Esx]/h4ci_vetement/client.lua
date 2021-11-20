ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(500)
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

local magasinvetementop = false

vetementbg = {}
vetementbg.DrawDistance = 10
vetementbg.DrawDistance2 = 2
vetementbg.Size = { x = 1.0, y = 1.0, z = 1.0 }
vetementbg.Color = { r = 102, g = 102, b = 204 }
vetementbg.Type = 1

local prixvetement = 150
local prixsauvegarde = 50

local posmagvet = {
    { x = 72.254, y = -1399.102, z = 28.376 },
    { x = -703.776, y = -152.258, z = 36.415 },
    { x = -167.863, y = -298.969, z = 38.733 },
    { x = 428.694, y = -800.106, z = 28.491 },
    { x = -829.413, y = -1073.710, z = 10.328 },
    { x = -1447.797, y = -242.461, z = 48.820 },
    { x = 11.632, y = 6514.224, z = 30.877 },
    { x = 123.646, y = -219.440, z = 53.557 },
    { x = 1696.291, y = 4829.312, z = 41.063 },
    { x = 618.093, y = 2759.629, z = 41.088 },
    { x = 1190.550, y = 2713.441, z = 37.222 },
    { x = -1193.429, y = -772.262, z = 16.324 },
    { x = -3172.496, y = 1048.133, z = 19.863 },
    { x = -1108.441, y = 2708.923, z = 18.107 },
}

Citizen.CreateThread(function()
    for k in pairs(posmagvet) do
        local blip = AddBlipForCoord(posmagvet[k].x, posmagvet[k].y, posmagvet[k].z)
        SetBlipSprite(blip, 73)
        SetBlipColour(blip, 47)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Magasin de vêtements")
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords, letSleep = GetEntityCoords(PlayerPedId()), true

        for k in pairs(posmagvet) do
            if (vetementbg.Type ~= -1 and GetDistanceBetweenCoords(coords, posmagvet[k].x, posmagvet[k].y, posmagvet[k].z, true) < vetementbg.DrawDistance) then
                DrawMarker(vetementbg.Type, posmagvet[k].x, posmagvet[k].y, posmagvet[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, vetementbg.Size.x, vetementbg.Size.y, vetementbg.Size.z, vetementbg.Color.r, vetementbg.Color.g, vetementbg.Color.b, 100, false, true, 2, false, false, false, false)
                letSleep = false
                if (vetementbg.Type ~= -1 and GetDistanceBetweenCoords(coords, posmagvet[k].x, posmagvet[k].y, posmagvet[k].z, true) < vetementbg.DrawDistance2) then
                    ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour changer de vêtements")
                    if IsControlJustPressed(1, 51) then
                        magasinvetementop = false
                        ouvrirmagasinvet()
                    end
                end
            end
        end
        if letSleep then
            Citizen.Wait(1000)
        end
    end
end)

RMenu.Add('magavet', 'main', RageUI.CreateMenu("Vêtements", "Pour acheter de nouveaux vêtements."))
RMenu.Add('magavet', 'listetenu', RageUI.CreateSubMenu(RMenu:Get('magavet', 'main'), "Liste tenues", "Pour voir vos tenues sauvegardées"))
RMenu.Add('magavet', 'optiontenu', RageUI.CreateSubMenu(RMenu:Get('magavet', 'listetenu'), "Option tenue", "Les options pour votre tenue"))
RMenu:Get('magavet', 'optiontenu').Closed = function()
    tenuchoisi.tshirt1 = 1
    tenuchoisi.tshirt2 = 1
    tenuchoisi.torse1 = 1
    tenuchoisi.torse2 = 1
    tenuchoisi.bras1 = 1
    tenuchoisi.pantalon1 = 1
    tenuchoisi.pantalon2 = 1
    tenuchoisi.chaussure1 = 1
    tenuchoisi.chaussure2 = 1
end
RMenu.Add('magavet', 'changement', RageUI.CreateSubMenu(RMenu:Get('magavet', 'main'), "Nouvelle tenue", "Pour faire une nouvelle tenue"))
RMenu:Get('magavet', 'changement').Closed = function()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        local isMale = skin.sex == 0
        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                TriggerEvent('esx:restoreLoadout')
            end)
        end)
    end)
    tenuchoisi.tshirt1 = 1
    tenuchoisi.tshirt2 = 1
    tenuchoisi.torse1 = 1
    tenuchoisi.torse2 = 1
    tenuchoisi.bras1 = 1
    tenuchoisi.pantalon1 = 1
    tenuchoisi.pantalon2 = 1
    tenuchoisi.chaussure1 = 1
    tenuchoisi.chaussure2 = 1
end
RMenu.Add('magavet', 'confirmerachat', RageUI.CreateSubMenu(RMenu:Get('magavet', 'changement'), "Achat nouvelle tenue", "Pour confirmer l'achat d'une nouvelle tenue"))
RMenu.Add('magavet', 'enregistrertenu', RageUI.CreateSubMenu(RMenu:Get('magavet', 'confirmerachat'), "Enregistrer tenue", "Pour enregistrer une nouvelle tenue"))
RMenu:Get('magavet', 'main').Closed = function()
    magasinvetementop = false
end

tenuchoisi = {
    tshirt1 = 1,
    tshirt2 = 1,
    torse1 = 1,
    torse2 = 1,
    bras1 = 1,
    pantalon1 = 1,
    pantalon2 = 1,
    chaussure1 = 1,
    chaussure2 = 1,
}

h4ci_vetement = {
    liste = {},
    tenue = {}
}

function ouvrirmagasinvet()
    if not magasinvetementop then
        magasinvetementop = true
        RageUI.Visible(RMenu:Get('magavet', 'main'), true)
        while magasinvetementop do
            RageUI.IsVisible(RMenu:Get('magavet', 'main'), true, true, true, function()

                RageUI.Button("Faire une nouvelle tenue", "Pour faire une nouvelle tenue", { RightLabel = "→→→" }, true, function()
                end, RMenu:Get('magavet', 'changement'))
                RageUI.Button("Enregistrer la tenue actuelle", "Pour enregistrer la tenue actuelle", { RightLabel = "→→→" }, true, function()
                end, RMenu:Get('magavet', 'enregistrertenu'))
                RageUI.Button("Liste tenues sauvegardées", "Pour voir vos tenues sauvegardées", { RightLabel = "→→→" }, true, function()
                end, RMenu:Get('magavet', 'listetenu'))

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('magavet', 'changement'), true, true, true, function()

                RageUI.Button("Confirmer achat", "Pour confirmer l'achat", { RightLabel = "→→→" }, true, function()
                end, RMenu:Get('magavet', 'confirmerachat'))

                RageUI.List("Tshirt 1", selectionuser.tshirt1, tenuchoisi.tshirt1, nil, { }, true, function(Hovered, Active, Selected, Index)
                    tenuchoisi.tshirt1 = Index
                    if (Active) then
                        SetPedComponentVariation(GetPlayerPed(-1), 8, tenuchoisi.tshirt1, tenuchoisi.tshirt2, 2)
                    end
                end)

                RageUI.List("Tshirt 2", selectionuser.tshirt2, tenuchoisi.tshirt2, nil, { }, true, function(Hovered, Active, Selected, Index)
                    tenuchoisi.tshirt2 = Index
                    if (Active) then
                        SetPedComponentVariation(GetPlayerPed(-1), 8, tenuchoisi.tshirt1, tenuchoisi.tshirt2, 2)
                    end
                end)
                RageUI.List("Torse 1", selectionuser.torse1, tenuchoisi.torse1, nil, { }, true, function(Hovered, Active, Selected, Index)
                    tenuchoisi.torse1 = Index
                    if (Active) then
                        SetPedComponentVariation(GetPlayerPed(-1), 11, tenuchoisi.torse1, tenuchoisi.torse2, 2)
                    end
                end)
                RageUI.List("Torse 2", selectionuser.torse2, tenuchoisi.torse2, nil, { }, true, function(Hovered, Active, Selected, Index)
                    tenuchoisi.torse2 = Index
                    if (Active) then
                        SetPedComponentVariation(GetPlayerPed(-1), 11, tenuchoisi.torse1, tenuchoisi.torse2, 2)
                    end
                end)
                RageUI.List("Bras 1", selectionuser.bras1, tenuchoisi.bras1, nil, { }, true, function(Hovered, Active, Selected, Index)
                    tenuchoisi.bras1 = Index
                    if (Active) then
                        SetPedComponentVariation(GetPlayerPed(-1), 3, tenuchoisi.bras1)
                    end
                end)
                RageUI.List("Pantalon 1", selectionuser.pantalon1, tenuchoisi.pantalon1, nil, { }, true, function(Hovered, Active, Selected, Index)
                    tenuchoisi.pantalon1 = Index
                    if (Active) then
                        SetPedComponentVariation(GetPlayerPed(-1), 4, tenuchoisi.pantalon1, tenuchoisi.pantalon2, 2)
                    end
                end)
                RageUI.List("Pantalon 2", selectionuser.pantalon2, tenuchoisi.pantalon2, nil, { }, true, function(Hovered, Active, Selected, Index)
                    tenuchoisi.pantalon2 = Index
                    if (Active) then
                        SetPedComponentVariation(GetPlayerPed(-1), 4, tenuchoisi.pantalon1, tenuchoisi.pantalon2, 2)
                    end
                end)
                RageUI.List("Chaussure 1", selectionuser.chaussure1, tenuchoisi.chaussure1, nil, { }, true, function(Hovered, Active, Selected, Index)
                    tenuchoisi.chaussure1 = Index
                    if (Active) then
                        SetPedComponentVariation(GetPlayerPed(-1), 6, tenuchoisi.chaussure1, tenuchoisi.chaussure2, 2)
                    end
                end)
                RageUI.List("Chaussure 2", selectionuser.chaussure2, tenuchoisi.chaussure2, nil, { }, true, function(Hovered, Active, Selected, Index)
                    tenuchoisi.chaussure2 = Index
                    if (Active) then
                        SetPedComponentVariation(GetPlayerPed(-1), 6, tenuchoisi.chaussure1, tenuchoisi.chaussure2, 2)
                    end
                end)
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get('magavet', 'confirmerachat'), true, true, true, function()
                RageUI.Button("Voulez-vous acheter cette tenue ?", "Prix : 150$", { RightLabel = nil }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

                RageUI.Button("Non", nil, { RightLabel = nil }, true, function(Hovered, Active, Selected)
                end, RMenu:Get('magavet', 'main'))
                RageUI.Button("Oui", nil, { RightLabel = nil }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        ESX.TriggerServerCallback('h4ci_vetement:verifsous', function(suffisantsous)
                            if suffisantsous then
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    clothesSkin = {
                                        ['tshirt_1'] = tenuchoisi.tshirt1, ['tshirt_2'] = tenuchoisi.tshirt2,
                                        ['torso_1'] = tenuchoisi.torse1, ['torso_2'] = tenuchoisi.torse2,
                                        ['pants_1'] = tenuchoisi.pantalon1, ['pants_2'] = tenuchoisi.pantalon2,
                                        ['arms'] = tenuchoisi.bras1,
                                        ['shoes_1'] = tenuchoisi.chaussure1, ['shoes_2'] = tenuchoisi.chaussure2,
                                    }
                                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                                end)
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    TriggerServerEvent('esx_skin:save', skin)
                                end)
                                ESX.ShowNotification('Voici ta nouvelle tenue! ~r~-150$')

                            else
                                ESX.ShowNotification('Tu n\'as pas assez d\'argent!')
                            end

                        end, prixvetement)

                    end
                end, RMenu:Get('magavet', 'enregistrertenu'))
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get('magavet', 'enregistrertenu'), true, true, true, function()
                RageUI.Button("Voulez-vous enregistrer cette tenue ?", "Prix d'enregistrement : 50$", { RightLabel = nil }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

                RageUI.Button("Non", nil, { RightLabel = nil }, true, function(Hovered, Active, Selected)
                end, RMenu:Get('magavet', 'main'))
                RageUI.Button("Oui", nil, { RightLabel = nil }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        ESX.TriggerServerCallback('h4ci_vetement:verifsous', function(suffisantsous)
                            if suffisantsous then
                                local nom = KeyboardInput("Choisir un nom pour la tenue : ", "", 15)
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                    TriggerServerEvent('h4ci_vetement:enregistretenu', nom, skin)
                                    ESX.ShowNotification("Sauvegarde ok! ~r~-50$")
                                end)
                            else
                                ESX.ShowNotification('Tu n\'as pas assez d\'argent!')
                            end

                        end, prixsauvegarde)
                    end
                end, RMenu:Get('magavet', 'main'))
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get('magavet', 'listetenu'), true, true, true, function()
                ESX.TriggerServerCallback('h4ci_vetement:affichertenu', function(tenue)
                    h4ci_vetement.liste = tenue
                end)
                for i = 1, #h4ci_vetement.liste, 1 do
                    RageUI.Button(h4ci_vetement.liste[i].nom, nil, { RightLabel = nil }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            tenuchoisi = h4ci_vetement.liste[i]
                        end
                    end, RMenu:Get('magavet', 'optiontenu'))
                end
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get('magavet', 'optiontenu'), true, true, true, function()
                RageUI.Button("Nom de la tenue : " .. tenuchoisi.nom, nil, { RightLabel = nil }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
                RageUI.Button("Mettre la tenue", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerEvent('skinchanger:loadClothes', skin, json.decode(tenuchoisi.contenu))
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                TriggerServerEvent('esx_skin:save', skin)
                                ESX.ShowNotification("La tenue a été modifiée!")
                            end)
                        end)
                    end
                end)
                RageUI.Button("Changer le nom de la tenue", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local nouveaunom = KeyboardInput("Choisir un nom pour la tenue : ", "", 15)
                        TriggerServerEvent('h4ci_vetement:renommertenu', nouveaunom, tenuchoisi.id)
                        RageUI.GoBack()
                        ESX.TriggerServerCallback('h4ci_vetement:affichertenu', function(tenue)
                            h4ci_vetement.liste = tenue
                        end)
                    end
                end)
                RageUI.Button("Supprimer la tenue", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('h4ci_vetement:supprimertenu', tenuchoisi.id)
                        RageUI.GoBack()
                        ESX.TriggerServerCallback('h4ci_vetement:affichertenu', function(tenue)
                            h4ci_vetement.liste = tenue
                        end)
                    end
                end)
            end, function()
            end)
            Citizen.Wait(0)
        end
    else
        magasinvetementop = false
    end
end

maxtenu = {
    tshirt1 = 144,
    tshirt2 = 12,
    torse1 = 289,
    torse2 = 12,
    bras1 = 144,
    pantalon1 = 115,
    pantalon2 = 12,
    chaussure1 = 91,
    chaussure2 = 12,
}

selectionuser = {
    tshirt1 = {},
    tshirt2 = {},
    torse1 = {},
    torse2 = {},
    bras1 = {},
    pantalon1 = {},
    pantalon2 = {},
    chaussure1 = {},
    chaussure2 = {},
}

Citizen.CreateThread(function()
    for k in pairs(maxtenu) do
        for k in pairs(selectionuser) do
            for i = 1, maxtenu[k] do
                table.insert(selectionuser[k], i)
            end
        end
    end
end)

local opvetementmenuliste = false
RMenu.Add('listevetement', 'main', RageUI.CreateMenu("Liste vêtements", "Pour changer de tenue ou autre"))
RMenu.Add('listevetement', 'gerertenue', RageUI.CreateSubMenu(RMenu:Get('listevetement', 'main'), "Tenue", "Pour mettre une tenue"))
RMenu:Get('listevetement', 'main').Closed = function()
    opvetementmenuliste = false
end

function ouvrirmenulistevetement()
    if not opvetementmenuliste then
        opvetementmenuliste = true
        RageUI.Visible(RMenu:Get('listevetement', 'main'), true)
        while opvetementmenuliste do
            RageUI.IsVisible(RMenu:Get('listevetement', 'main'), true, true, true, function()

                for a = 1, #h4ci_vetement.tenue, 1 do
                    RageUI.Button("Tenue - " .. h4ci_vetement.tenue[a].nom, "Pour gérer votre tenue", { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            tenuevoulu = h4ci_vetement.tenue[a]
                        end
                    end, RMenu:Get('listevetement', 'gerertenue'))
                end

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('listevetement', 'gerertenue'), true, true, true, function()
                RageUI.Button("Nom de la tenue : " .. tenuevoulu.nom, nil, { RightLabel = nil }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
                RageUI.Button("Mettre la tenue", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        plyPed = PlayerPedId()
                        startAnimAction('clothingtie', 'try_tie_neutral_a')
                        ESX.ShowNotification("Changement de la tenue en cours...")
                        Citizen.Wait(7000)
                        ClearPedTasks(plyPed)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerEvent('skinchanger:loadClothes', skin, json.decode(tenuevoulu.contenu))
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                TriggerServerEvent('esx_skin:save', skin)
                                ESX.ShowNotification("La tenue a été modifiée!")
                            end)
                        end)
                    end
                end)
                RageUI.Button("Donner la tenue", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer == -1 or closestDistance > 3.0 then
                            ESX.ShowNotification('Aucun joueur à proximité')
                        else
                            TriggerServerEvent('h4ci_vetement:donnertenu', tenuevoulu.id, GetPlayerServerId(closestPlayer), tenuevoulu.nom)
                            RageUI.GoBack()
                            ESX.TriggerServerCallback('h4ci_vetement:affichertenu', function(tenue)
                                h4ci_vetement.tenue = tenue
                            end)
                        end
                    end
                end)
                RageUI.Button("Jeter la tenue", nil, { RightLabel = "→→→", Color = { BackgroundColor = RageUI.ItemsColour.Red } }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('h4ci_vetement:supprimertenu', tenuevoulu.id)
                        RageUI.GoBack()
                        ESX.TriggerServerCallback('h4ci_vetement:affichertenu', function(tenue)
                            h4ci_vetement.tenue = tenue
                        end)
                    end
                end)
            end, function()
            end)
            Citizen.Wait(0)
        end
    else
        opvetementmenuliste = false
    end
end
--[[
Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
                    if IsControlJustPressed(1,83) then
                        ESX.TriggerServerCallback('h4ci_vetement:affichertenu', function(tenue)
                    	h4ci_vetement.tenue = tenue
                		end)
                        opvetementmenuliste = false
                        ouvrirmenulistevetement()
                    end   

        end
    end)]]



function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)


    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end

function startAnimAction(lib, anim)
    ESX.Streaming.RequestAnimDict(lib, function()
        TaskPlayAnim(plyPed, lib, anim, 8.0, 1.0, -1, 49, 0, false, false, false)
        RemoveAnimDict(lib)
    end)
end



