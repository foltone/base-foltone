ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end
end)

------------ Création du Menu / Sous Menu -----------

RMenu.Add('example', 'main', RageUI.CreateMenu("Pôle Emploi", "Pôle Emploi"))
RMenu.Add('example', 'boisson', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "Métiers Libres", "Métiers Libres"))
RMenu.Add('example', 'nourriture', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "Métiers Whitelists", "Métiers Whitelists"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('example', 'main'), true, true, true, function()

            RageUI.Button("Métiers Libres", null ,  {RightLabel = "→"},true, function()
            end, RMenu:Get('example', 'boisson'))  

            RageUI.Button("Métiers Whitelists", nul ,  {RightLabel = "→"},true, function()
            end, RMenu:Get('example', 'nourriture'))
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('example', 'boisson'), true, true, true, function()

            RageUI.Button("Abatteur", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyAbatteur')
                end
            end)

         RageUI.Button("Bûcheron", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyBucheron')
                end
            end)

         RageUI.Button("Couturier", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyCouturier')
                end
            end)

        RageUI.Button("Mineur", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyMineur')
                end
            end)

    RageUI.Button("Pêcheur", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyPecheur')
                end
            end)

        RageUI.Button("Raffineur", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyRaffineur')
                end
            end)

        RageUI.Button("Chômeur", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyChomeur')
                end
            end)

        end, function()
        end)

            RageUI.IsVisible(RMenu:Get('example', 'nourriture'), true, true, true, function()

                RageUI.Button("LSPD", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('powx_tuto:BuyPolice')
                    end
                end)

                RageUI.Button("EMS", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('powx_tuto:BuyEMS')
                    end
                end)

                RageUI.Button("Concessionnaire", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('powx_tuto:BuyConcess')
                    end
                end)

                RageUI.Button("Mécano", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('powx_tuto:BuyMecano')
                    end
                end)

                 RageUI.Button("Tabac", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('powx_tuto:BuyTabac')
                    end
                end)

                RageUI.Button("Vigneron", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('powx_tuto:BuyVigneron')
                    end
                end)  
                RageUI.Button("Taxi", nil, {RightLabel = "→ Choisir"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('powx_tuto:BuyTaxi')
                    end
                end)                
                        
            end, function()
                ---Panels
            end, 1)
    
            Citizen.Wait(0)
        end
    end)



    ---------------------------------------- Position du Menu --------------------------------------------

    local position = {
        {x = -268.73 , y = -956.42, z = 31.22, }
    }    
    
    
    Citizen.CreateThread(function()
        while true do
            local interval = 1000

            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then
                    interval = 0
                   RageUI.Text({message = "Appuyez sur [~b~~h~E~h~~w~] pour parler à ~b~~h~Karine", time_display = 1})
                    if IsControlJustPressed(1,51) then
                        interval = 0
                        RageUI.Visible(RMenu:Get('example', 'main'), not RageUI.Visible(RMenu:Get('example', 'main')))
                    end
                end
            end
            Citizen.Wait(interval)
        end
    end)

    Citizen.CreateThread(function()
    local hash = GetHashKey("a_f_y_business_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(500)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "a_f_y_business_01", -269.18, -955.27, 30.22, 213.16, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

local blips = {
        {title="Pôle Emploi", id=269, x = -263.42, y = -967.34, z = 31.22}
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)