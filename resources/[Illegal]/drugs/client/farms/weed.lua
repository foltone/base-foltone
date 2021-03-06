Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

local cooldawn = false
local mainMenu = RageUI.CreateMenu('Weed', '')

function OpenMenuRecolteweed()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 
				FreezeEntityPosition(PlayerPedId(), true)

				RageUI.Separator('')
				RageUI.Separator('~r~↓ ~s~Circuit de Weed ~r~↓')


			RageUI.Button("Commencer la Récolte de ~r~Weed", nil, {RightLabel = "→"}, not cooldawn, {
				onSelected = function()
					cooldawn = true
					FreezeEntityPosition(PlayerPedId(), true)
					StartRecolteweed()
					Citizen.SetTimeout(1000, function()
						cooldawn = false
					end)
				end
			})

			RageUI.Button("Stopper la Récolte de ~r~Weed", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					StopRecolteweed()
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end


function StopRecolteweed()
    if recoltyesweed then
    	recoltyesweed = false
    end
end

function StartRecolteweed()
    if not recoltyesweed then
        recoltyesweed = true
    while recoltyesweed do
        Citizen.Wait(2000)
        TriggerServerEvent('recolteweed')
    end
    else
        recoltyesweed = false
    end
end


local position = {
	{x = 2222.5817871094, y = 5577.3994140625, z = 53.838500976562}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, 2222.5817871094, 5577.3994140625, 53.838500976562, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true) 
			

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour récolter la ~r~Weed", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuRecolteweed()
            end
    end
    end
    Citizen.Wait(wait)
    end
end
end)


local mainMenu = RageUI.CreateMenu('Weed', '')

function OpenMenuTraitementweed()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 
				FreezeEntityPosition(PlayerPedId(), true)

				RageUI.Separator('')
				RageUI.Separator('~r~↓ ~s~Circuit de Weed ~r~↓')

			RageUI.Button("Commencer le Traitement de ~r~Weed", nil, {RightLabel = "→"}, not cooldawn, {
				onSelected = function()
					cooldawn = true
					FreezeEntityPosition(PlayerPedId(), true)
					StartTraitementweed()
					Citizen.SetTimeout(1000, function()
						cooldawn = false
					end)
				end
			})

			RageUI.Button("Stopper le Traitement de ~r~Weed", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopTraitementweed()
					RageUI.CloseAll()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end



function StopTraitementweed()
    if traityesweed then
    	traityesweed = false
    end
end

function StartTraitementweed()
    if not traityesweed then
        traityesweed = true
    while traityesweed do
            Citizen.Wait(2000)
            TriggerServerEvent('traitementweed')
    end
    else
        traityesweed = false
    end
end


local position = {
	{x = 1057.4624023438, y = -3197.689453125, z = -39.137676239014}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, 1057.4624023438, -3197.689453125, -39.137676239014, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true) 

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour traiter la ~r~Weed", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuTraitementweed()
            end

    end  
    end
    Citizen.Wait(wait)
    end
end
end)




local mainMenu = RageUI.CreateMenu('Weed', '')

function OpenMenuVentetweed()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 
				FreezeEntityPosition(PlayerPedId(), true)

				RageUI.Separator('')
				RageUI.Separator('~r~↓ ~s~Circuit de Weed ~r~↓')

			RageUI.Button("Commencer la Vente de ~r~Weed", nil, {RightLabel = "→"}, not cooldawn, {
				onSelected = function()
					cooldawn = true
					FreezeEntityPosition(PlayerPedId(), true)
					StartVenteweed()
					Citizen.SetTimeout(1000, function()
						cooldawn = false
					end)
				end
			})

			RageUI.Button("Stopper la Vente de ~r~Weed", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopVenteweed()
					RageUI.CloseAll()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end


function StopVenteweed()
    if ventepossibleweed then
    	ventepossibleweed = false
    end
end

function StartVenteweed()
    if not ventepossibleweed then
        ventepossibleweed = true
    while ventepossibleweed do
            Citizen.Wait(2000)
            TriggerServerEvent('venteweed')
    end
    else
        ventepossibleweed = false
    end
end


local position = {
	{x = -99.442237854004, y = 9.7666158676147, z = 78.437454223633}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, -99.442237854004, 9.7666158676147, 78.437454223633, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true)  

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour vendre la ~r~Weed", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuVentetweed()
            end

    end
    end
    Citizen.Wait(wait)
    end
end
end)
