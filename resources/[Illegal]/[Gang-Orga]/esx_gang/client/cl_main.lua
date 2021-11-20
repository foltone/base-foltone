print("^1[AUTHEUR]^7 VibR1cY#2076")

ESX = nil
local StartJob = false

Citizen.CreateThread(function()

    while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(10)
    end

    while ESX.GetPlayerData().job2 == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()

    InitMarkerJob()
    InitBlips()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
    InitMarkerJob()
end)

function InitMarkerJob()
    StartJob = true
    Citizen.CreateThread(function()
        while StartJob do
            local InZone = false
            local playerPos = GetEntityCoords(PlayerPedId())
            for i = 1, #Gang do
                local v = Gang[i]
                if ESX.PlayerData.job2.name == v.JobGangName then
                    for _,gradeGarage in pairs(v.Garage.GradeJobAcces) do
                        if ESX.PlayerData.job2.grade_name == gradeGarage then
                            local dst1 = GetDistanceBetweenCoords(playerPos, v.Garage.PosSpawner, true)
                            if dst1 < 20.0 then
                                InZone = true
                                DrawMarker(21, v.Garage.PosSpawner.x, v.Garage.PosSpawner.y, v.Garage.PosSpawner.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 200, 0, 1, 2, 0, nil, nil, 0)
                                if dst1 < 2.0 then
                                    Visual.Subtitle(("Appuyez sur [~r~E~s~] pour ouvrir le garage : ~b~%s"):format(v.GangName))
                                    if IsControlJustReleased(1, 38) then
                                        FreezeEntityPosition(PlayerPedId(), true)
                                        openGarageMenu(v)
                                    end
                                end
                            end
                        end
                        if ESX.PlayerData.job2.grade_name == gradeGarage then
                            local dst2 = GetDistanceBetweenCoords(playerPos, v.Garage.PosDeleter, true)
                            if dst2 < 20.0 then
                                InZone = true
                                DrawMarker(21, v.Garage.PosDeleter.x, v.Garage.PosDeleter.y, v.Garage.PosDeleter.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 200, 0, 1, 2, 0, nil, nil, 0)
                                if dst2 < 2.0 then
                                    Visual.Subtitle(("Appuyez sur [~r~E~s~] pour ranger le véhicule : ~b~%s"):format(v.GangName))
                                    if IsControlJustReleased(1, 38) then
                                        for _,v in pairs(v.Garage.Vehicule) do
                                            local Vehicule = ESX.Game.GetClosestVehicle({x = playerPos.x, y = playerPos.y, z = playerPos.z})
                                            local HashVehicule = GetEntityModel(Vehicule)
                                            if HashVehicule == v.hash then
                                                DeleteEntity(Vehicule)
                                                v.stock = v.stock + 1
                                                ESX.ShowNotification(("Vous venez de ranger une : ~b~%s ~s~, il y en n'a ~r~%s ~s~ maintenant !"):format(v.name, v.stock))
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    for _,gradeBoss in pairs(v.BossAction.GradeJobAcces) do
                        if ESX.PlayerData.job2.grade_name == gradeBoss then
                            local dst3 = GetDistanceBetweenCoords(playerPos, v.BossAction.PosBoss, true)
                            if dst3 < 20.0 then
                                InZone = true
                                DrawMarker(21, v.BossAction.PosBoss.x, v.BossAction.PosBoss.y, v.BossAction.PosBoss.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 200, 0, 1, 2, 0, nil, nil, 0)
                                if dst3 < 2.0 then
                                    Visual.Subtitle(("Appuyez sur [~r~E~s~] pour gérer : ~b~%s"):format(v.GangName))
                                    if IsControlJustReleased(1, 38) then
                                        FreezeEntityPosition(PlayerPedId(), true)
                                        menuGangBoss(v)
                                    end
                                end
                            end
                        end
                    end
                    for _,gradeCoffre in pairs(v.Coffre.GradeJobAcces) do
                        if ESX.PlayerData.job2.grade_name == gradeCoffre then
                            local dst4 = GetDistanceBetweenCoords(playerPos, v.Coffre.PosCoffre, true)
                            if dst4 < 20.0 then
                                InZone = true
                                DrawMarker(21, v.Coffre.PosCoffre.x, v.Coffre.PosCoffre.y, v.Coffre.PosCoffre.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 200, 0, 1, 2, 0, nil, nil, 0)
                                if dst4 < 2.0 then
                                    Visual.Subtitle(("Appuyez sur [~r~E~s~] pour ouvrir le coffre : ~b~%s"):format(v.GangName))
                                    if IsControlJustReleased(1, 38) then
                                        FreezeEntityPosition(PlayerPedId(), true)
                                        openCoffreMenu(v)
                                    end
                                end
                            end
                        end
                    end
                    for _,gradeVestiaire in pairs(v.Vestiaire.GradeJobAcces) do
                        if ESX.PlayerData.job2.grade_name == gradeVestiaire then
                            local dst5 = GetDistanceBetweenCoords(playerPos, v.Vestiaire.PosVestiaire, true)
                            if dst5 < 20.0 then
                                InZone = true
                                DrawMarker(21, v.Vestiaire.PosVestiaire.x, v.Vestiaire.PosVestiaire.y, v.Vestiaire.PosVestiaire.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 200, 0, 1, 2, 0, nil, nil, 0)
                                if dst5 < 2.0 then
                                    Visual.Subtitle(("Appuyez sur [~r~E~s~] pour ouvrir le vestiaire : ~b~%s"):format(v.GangName))
                                    if IsControlJustReleased(1, 38) then
                                        FreezeEntityPosition(PlayerPedId(), true)
                                        openVestiaireMenu(v)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if not InZone then
                Wait(500)
            else
                Wait(1)
            end
        end
    end)
    for _,v in pairs(Gang) do
        print("^1[ESX GANG]^7 "..v.GangName.." Chargé avec succès !")
    end
end

function InitBlips()
    for i = 1, #BlipsGang.Blip, 1 do
        local CreateBlip = AddBlipForCoord(BlipsGang.Blip[i].pos)

        SetBlipSprite(CreateBlip, BlipsGang.Blip[i].id)
        SetBlipScale(CreateBlip, BlipsGang.Blip[i].scale)
        SetBlipDisplay(CreateBlip, BlipsGang.Blip[i].display)
        SetBlipColour (CreateBlip, BlipsGang.Blip[i].color)
        SetBlipAsShortRange(CreateBlip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(BlipsGang.Blip[i].name)
        EndTextCommandSetBlipName(CreateBlip)
    end
end

function TextInfo(TextEntry, ExampleText, MaxStringLenght, isValueInt)

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
        if isValueInt then
            local isNumber = tonumber(result)
            if isNumber then return result else return nil end
        end

        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end