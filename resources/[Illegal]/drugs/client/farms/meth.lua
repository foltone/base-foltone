Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)


local mainMenu = RageUI.CreateMenu('Meth', '')
local cooldawn = false

function OpenMenuRecoltemeth()
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
				RageUI.Separator('~r~↓ ~s~Circuit de Meth ~r~↓')

			RageUI.Button("Commencer la Récolte de ~r~Meth", nil, {RightLabel = "→"}, not cooldawn, {
				onSelected = function()
					cooldawn = true
					FreezeEntityPosition(PlayerPedId(), true)
					StartRecoltemeth()
					RageUI.CloseAll()
					Citizen.SetTimeout(1000, function()
						cooldawn = false
					end)
				end
			})

			RageUI.Button("Stopper la Récolte de ~r~Meth", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					StopRecoltemeth()
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


function StopRecoltemeth()
    if recoltyesmeth then
    	recoltyesmeth = false
    end
end

function StartRecoltemeth()
    if not recoltyesmeth then
        recoltyesmeth = true
    while recoltyesmeth do
        Citizen.Wait(2000)
        TriggerServerEvent('recoltemeth')
    end
    else
        recoltyesmeth = false
    end
end


local position = {
	{x = 40.667785644531, y = 6940.6293945312, z = 16.030414581299}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, 40.667785644531, 6940.6293945312, 16.030414581299, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true) 


        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour récolter la ~r~Meth", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuRecoltemeth()
            end
    end
    end
    Citizen.Wait(wait)
    end
end
end)


local mainMenu = RageUI.CreateMenu('Meth', '')

function OpenMenuTraitementmeth()
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
				RageUI.Separator('~r~↓ ~s~Circuit de Meth ~r~↓')

			RageUI.Button("Commencer le Traitement de ~r~Meth", nil, {RightLabel = "→"}, not cooldawn, {
				onSelected = function()
					cooldawn = true
					FreezeEntityPosition(PlayerPedId(), true)
					StartTraitementmeth()
					Citizen.SetTimeout(1000, function()
						cooldawn = false
					end)
				end
			})

			RageUI.Button("Stopper le Traitement de ~r~Meth", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopTraitementmeth()
					RageUI.CloseAll()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end



function StopTraitementmeth()
    if traityesmeth then
    	traityesmeth = false
    end
end

function StartTraitementmeth()
    if not traityesmeth then
        traityesmeth = true
    while traityesmeth do
            Citizen.Wait(2000)
            TriggerServerEvent('traitementmeth')
    end
    else
        traityesmeth = false
    end
end


local position = {
	{x = 1006.5467529297, y = -3194.9548339844, z = -38.993114471436}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, 1006.5467529297, -3194.9548339844, -38.993114471436, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true) 

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour traiter la ~r~Meth", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuTraitementmeth()
            end

    end  
    end
    Citizen.Wait(wait)
    end
end
end)




local mainMenu = RageUI.CreateMenu('Meth', '')

function OpenMenuVentetmeth()
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
				RageUI.Separator('~r~↓ ~s~Circuit de Meth ~r~↓')
				

				RageUI.Button("Commencer la Vente de ~r~Meth", nil, {RightLabel = "→"}, not cooldawn, {
					onSelected = function()
						cooldawn = true
						FreezeEntityPosition(PlayerPedId(), true)
						StartVentemeth()
						Citizen.SetTimeout(1000, function()
							cooldawn = false
						end)
					end
				})
				

			RageUI.Button("Stopper la Vente de ~r~Meth", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopVentemeth()
					RageUI.CloseAll()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end


function StopVentemeth()
    if ventepossiblemeth then
    	ventepossiblemeth = false
    end
end

function StartVentemeth()
    if not ventepossiblemeth then
        ventepossiblemeth = true
    while ventepossiblemeth do
            Citizen.Wait(2000)
            TriggerServerEvent('ventemeth')
    end
    else
        ventepossiblemeth = false
    end
end


local position = {
	{x = -391.03881835938, y = -2264.4060058594, z = 7.6081867218018}  
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, -391.03881835938, -2264.4060058594, 7.6081867218018, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true)  

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour vendre la ~r~Meth", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuVentetmeth()
            end

    end
    end
    Citizen.Wait(wait)
    end
end
end)
