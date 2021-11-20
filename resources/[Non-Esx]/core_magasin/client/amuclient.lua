ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

Citizen.CreateThread(function()
	for k, v in pairs(ConfAmmu.Pos) do
		local blip = AddBlipForCoord(v.x, v.y, v.z)

		SetBlipSprite(blip, 110)
		SetBlipScale (blip, 0.8)
		SetBlipColour(blip, 3)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Armurerie')
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_y_ammucity_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
	end
	
end)

ppa = false

Citizen.CreateThread(function()
	while true do
		local wait = 750
		local playerCoords = GetEntityCoords(PlayerPedId())

		for k, v in pairs(ConfAmmu.Pos) do
			local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

            if distance < 10.0 then
                wait = 0
                actualZone = v

                zoneDistance = GetDistanceBetweenCoords(playerCoords, actualZone.x, actualZone.y, actualZone.z, true)

				DrawMarker(21, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.4, 10, 10, 255, 100, false, true, 2, false, nil, nil, false)
            end
            
            if distance <= 1.5 then
                wait = 0
				RageUI.Text({
					message = "Appuyez sur [~b~E~w~] pour ouvrir l'armurerie",
					time_display = 1
				})

                if IsControlJustPressed(1, 51) then
                    openammu()
                end
            end

            if zoneDistance ~= nil then
                if zoneDistance > 1.5 then
                    RageUI.CloseAll()
                end
            end
        end
    	Citizen.Wait(wait)
	end
end)

RMenu.Add('ammu', 'main', RageUI.CreateMenu("Ammunation", "Armurerie"))
RMenu.Add('ammu', 'armurerie', RageUI.CreateSubMenu(RMenu:Get('ammu', 'main'), "Armurerie", "Voici nos armes blanche."))
RMenu.Add('ammu', 'arme', RageUI.CreateSubMenu(RMenu:Get('ammu', 'main'), "Armurerie", "Voici nos armes à feu."))
RMenu.Add('ammu', 'aces', RageUI.CreateSubMenu(RMenu:Get('ammu', 'main'), "Armurerie", "Voici nos accessoires."))
RMenu.Add('ammu', 'ppa', RageUI.CreateSubMenu(RMenu:Get('ammu', 'main'), "Armurerie", "Confirmation"))
RMenu:Get("ammu", "main").Closed = function()
    ammu = false
end

function openammu()
    if ammu then
        ammu = false
        RageUI.CloseAll()
    else
        ammu = true
        RageUI.Visible(RMenu:Get("ammu","main"), true)
        Citizen.CreateThread(function()
            while ammu do
                Citizen.Wait(1)
        RageUI.IsVisible(RMenu:Get('ammu', 'main'), true, true, true, function()

            RageUI.ButtonWithStyle("Armes blanche", "Pour accéder aux armes blanche.", {RightLabel = "→"},true, function()
            end, RMenu:Get('ammu', 'armurerie'))

			ESX.TriggerServerCallback('e_weaponshop:checkLicense', function(cb)            
                if cb then
                    ppa = true 
                	else 
                 	ppa = false   
                end
              end)

              if ppa then 
              RageUI.ButtonWithStyle("Armes à feu", "Pour avoir le PPA voir avec la police.", { RightLabel = "→" }, true, function(Hovered, Active, Selected)     
                if (Selected) then
              
                end
              end, RMenu:Get('ammu', 'arme')) 
              
              else 

                RageUI.ButtonWithStyle("Armes à feu", "Pour avoir le PPA voir avec la police.", { RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)     
                    if (Selected) then
                    end
                  end) 

                end

			RageUI.ButtonWithStyle("Accessoires", "Pour accéder aux accessoires.", {RightLabel = "→"},true, function()
            end, RMenu:Get('ammu', 'aces')) 

        end, function()
        end)

		RageUI.IsVisible(RMenu:Get('ammu', 'ppa'), true, true, true, function()

                RageUI.ButtonWithStyle("Confirmer", nil, { }, true, function(Hovered, Active, Selected)
                    if Selected then
						local prix = 50000
						TriggerServerEvent('Eweapon:addppa', 'weapon')
						RageUI.GoBack()
                    end
                end)

				RageUI.ButtonWithStyle("~r~Annuler", nil, { }, true, function(Hovered, Active, Selected)
                    if Selected then
						RageUI.GoBack()
                    end
                end)

        end, function()
        end)

      RageUI.IsVisible(RMenu:Get('ammu', 'armurerie'), true, true, true, function()

            for k, v in pairs(ConfAmmu.Type.Blanche) do
                RageUI.ButtonWithStyle(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerEvent('weaponshops:giveWeapon', v)
                    end
                end)
            end
        end, function()
        end)

		RageUI.IsVisible(RMenu:Get('ammu', 'arme'), true, true, true, function()

            for k, v in pairs(ConfAmmu.Type.Armes) do
                RageUI.ButtonWithStyle(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerEvent('weaponshops:giveWeapon', v)
                    end
                end)
            end

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('ammu', 'aces'), true, true, true, function()
            for k, v in pairs(ConfAmmu.Type.Items) do
                RageUI.ButtonWithStyle(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerEvent('item:acheter', v)
                    end
                end)
            end		
        end, function()
        end, 1)
    end
end)
	Citizen.Wait(0)
    end
end


