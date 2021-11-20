local ClothsData = {}
local activeSubMenu = {}
local lastSkin = {}
local index = {}
local directTable = {}
local open = false
local needSave = false

local limit = {
	["hair_1"] = true,
	["hair_2"] = true,
	["hair_color_1"] = true,
	["hair_color_2"] = true,
	["beard_1"] = true, -- beard_type
	["beard_2"] = true, -- beard_size
	["beard_3"] = true, -- beard_color_1


	["makeup_1"] = true, -- makeup_type
	["makeup_2"] = true, -- makeup_thickness
	["makeup_3"] = true, -- makeup_color_1
	["makeup_4"] = true, -- makeup_color_2

	["eyebrows_1"] = true, -- makeup_type
	["eyebrows_2"] = true, -- makeup_thickness
	["eyebrows_3"] = true, -- makeup_color_1
	["eyebrows_4"] = true, -- makeup_color_2


	["helmet_1"] = true,
	["helmet_2"] = true,
	-- ["glasses_1"] = true,
	-- ["glasses_2"] = true,
	["mask_1"] = true,
	["mask_2"] = true,
}

local noCloths = {
	["helmet_1"] = true,
	["helmet_2"] = true,
	-- ["glasses_1"] = true,
	-- ["glasses_2"] = true,
	["mask_1"] = true,
	["mask_2"] = true,
}


local zone = {
	vector3(-814.308,  -183.823,  37.568),
	vector3(136.826,   -1708.373, 29.291),
	vector3(-1282.604, -1116.757, 6.990),
	vector3(1931.513,  3729.671,  32.844),
	vector3(1212.840,  -473.921,  66.450),
	vector3(-32.885,   -152.319,  57.076),
	vector3(-278.077,  6228.463,  31.695),
}

function SetClothsInShop()
	for k,v in pairs(noCloths) do
		TriggerEvent('skinchanger:change', k, directTable[k].min)
	end
end	

function SetClothsOutShop()
	for k,v in pairs(noCloths) do
		TriggerEvent('skinchanger:change', k, directTable[k].value)
	end
end	

function RefreshData(LastSkin)
	if LastSkin then
		TriggerEvent('skinchanger:getSkin', function(skin) lastSkin = skin end)
	end

	TriggerEvent("skinchanger:getData", function(comp, max)
		local comp = comp
		local max = max

		for k,v in pairs(comp) do

			if limit[v.name] == nil then
				comp[k] = nil
			else
				if v.componentId == 0 then
					comp[k].value = GetPedPropIndex(GetPlayerPed(-1), v.componentId)
				end
				if LastSkin then
					index[v.name] = comp[k].value
				end

				for i,m in pairs(max) do
					if i == v.name then
						comp[k].max = m
					end
				end

				if v.max == nil then
					comp[k].max = 1
				end	

				-- print(v.name)
				directTable[v.name] = comp[k]
			end

		end

		ClothsData = comp
		return true
	end)
end


local barber = RageUI.CreateMenu("Coiffeur", "~b~Coiffeur!")
local hairs =  RageUI.CreateSubMenu(barber, "Coiffeur", "~b~Coiffeur!")
local barbe =  RageUI.CreateSubMenu(barber, "Coiffeur", "~b~Coiffeur!")
local makeup =  RageUI.CreateSubMenu(barber, "Coiffeur", "~b~Coiffeur!")
local sourcil =  RageUI.CreateSubMenu(barber, "Coiffeur", "~b~Coiffeur!")
barber.Closed = function()
	open = false
	TriggerEvent('skinchanger:loadSkin', lastSkin)
	SetClothsOutShop()
	FreezeEntityPosition(PlayerPedId(), false)

end
hairs.EnableMouse = true
barbe.EnableMouse = true
sourcil.EnableMouse = true
makeup.EnableMouse = true

local colorIndex = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
local self = directTable["hair_1"]
local opacityBeard = 0
local opacityMakeup = 0
local opacityEye = 0

function OpenBarberShop()
	FreezeEntityPosition(PlayerPedId(), true)

	if open then
		open = false
		RageUI.Visible(barber, false)
		return
	else
		needSave = false
		open = true
		RageUI.Visible(barber, true)
		RefreshData(true)


		Citizen.CreateThread(function()
			while open do
				RageUI.IsVisible(barber, function()
					RageUI.Button("Changer de coupe", nil, {}, true, {
						onSelected = function() 
							self = directTable["hair_1"]
							self.table = {}
							for i = 1, self.max do
								table.insert(self.table, { Name = tostring(i), Value = i })
							end
						end
					}, hairs)
					RageUI.Button("Changer de barbe", nil, {}, true, {
						onSelected = function() 
							self = directTable["beard_1"]
							self.table = {}
							for i = 1, self.max do
								table.insert(self.table, { Name = tostring(i), Value = i })
							end

							TriggerEvent('skinchanger:change', directTable["beard_2"].name, directTable["beard_2"].max)
							SetClothsInShop()
						end
					}, barbe)
					RageUI.Button("Changer de sourcil", nil, {}, true, {
						onSelected = function() 
							self = directTable["eyebrows_1"]
							self.table = {}
							for i = 1, self.max do
								table.insert(self.table, { Name = tostring(i), Value = i })
							end

							TriggerEvent('skinchanger:change', directTable["eyebrows_2"].name, directTable["eyebrows_2"].max)
							SetClothsInShop()
						end
					}, sourcil)
					RageUI.Button("Changer de maquillage", nil, {}, true, {
						onSelected = function() 
							self = directTable["makeup_1"]
							self.table = {}
							for i = 1, self.max do
								table.insert(self.table, { Name = tostring(i), Value = i })
							end

							TriggerEvent('skinchanger:change', directTable["makeup_2"].name, directTable["makeup_2"].max)
							SetClothsInShop()
						end
					}, makeup)

					if needSave then
						RageUI.Button('Valider les changements', nil, { RightLabel = "", Color = { HightLightColor = { 74, 255, 122 }, BackgroundColor = { 74, 255, 122, 160 } }}, true, {
							onSelected = function() 
								TriggerEvent('skinchanger:getSkin', function(skin)
									TriggerServerEvent('esx_skin:save', skin)
									
									TriggerEvent('skinchanger:getSkin', function(skin) lastSkin = skin end)
	
								end)
								needSave = false
								
							end
						});
					end
				end)

				RageUI.IsVisible(hairs, function()

					RageUI.List('Coupe: ', self.table, colorIndex[3], nil, {}, true, {
						onListChange = function(Index, Item)
							colorIndex[3] = Index;
							if self.value ~= colorIndex[3] then
								self.value = colorIndex[3] 
								TriggerEvent('skinchanger:change', self.name, self.value)

								for k,v in pairs(ClothsData) do
									if v.textureof == self.name then
										TriggerEvent('skinchanger:change', self.name, 0)
									end
								end
								SetClothsInShop()
								needSave = true
							end
						end,
					})
						
					RageUI.ColourPanel("Couleur primaire", RageUI.PanelColour.HairCut, colorIndex[1], colorIndex[2], {
						onColorChange = function(MinimumIndex, CurrentIndex)
							colorIndex[1] = MinimumIndex
                    		colorIndex[2] = CurrentIndex
							TriggerEvent('skinchanger:change', "hair_color_1", CurrentIndex)
							SetClothsInShop()
							needSave = true
						end
					}, 1)
					RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, colorIndex[4], colorIndex[5], {
						onColorChange = function(MinimumIndex, CurrentIndex)
							colorIndex[4] = MinimumIndex
                    		colorIndex[5] = CurrentIndex
							TriggerEvent('skinchanger:change', "hair_color_2", CurrentIndex)
							SetClothsInShop()
							needSave = true
						end
					}, 1)
					

				end)

				RageUI.IsVisible(barbe, function()
					RageUI.List('Barbe: ', self.table, colorIndex[6], nil, {}, true, {
						onListChange = function(Index, Item)
							colorIndex[6] = Index;
							if self.value ~= colorIndex[6] then
								self.value = colorIndex[6] 
								TriggerEvent('skinchanger:change', self.name, self.value)

								for k,v in pairs(ClothsData) do
									if v.textureof == self.name then
										TriggerEvent('skinchanger:change', self.name, 0)
									end
								end
								SetClothsInShop()
								needSave = true
							end
						end,
					})
					RageUI.PercentagePanel(opacityBeard, 'Opacité', nil, nil, {
						onProgressChange = function(Index)
							opacityBeard = Index
							TriggerEvent('skinchanger:change', "beard_2", opacityBeard * 10)
							needSave = true
						end
					}, 1)
					RageUI.ColourPanel("Couleur primaire", RageUI.PanelColour.HairCut, colorIndex[7], colorIndex[8], {
						onColorChange = function(MinimumIndex, CurrentIndex)
							colorIndex[7] = MinimumIndex
                    		colorIndex[8] = CurrentIndex
							TriggerEvent('skinchanger:change', "beard_3", CurrentIndex)
							SetClothsInShop()
							needSave = true
						end
					}, 1)
				end)

				RageUI.IsVisible(sourcil, function()
					RageUI.List('Sourcil: ', self.table, colorIndex[14], nil, {}, true, {
						onListChange = function(Index, Item)
							colorIndex[14] = Index;
							if self.value ~= colorIndex[14] then
								self.value = colorIndex[14] 
								TriggerEvent('skinchanger:change', self.name, self.value)

								for k,v in pairs(ClothsData) do
									if v.textureof == self.name then
										TriggerEvent('skinchanger:change', self.name, 0)
									end
								end
								SetClothsInShop()
								needSave = true
							end
						end,
					})
					RageUI.PercentagePanel(opacityEye, 'Opacité', nil, nil, {
						onProgressChange = function(Index)
							opacityEye = Index
							TriggerEvent('skinchanger:change', "eyebrows_2", opacityEye * 10)
							needSave = true
						end
					}, nil)
					RageUI.ColourPanel("Couleur primaire", RageUI.PanelColour.HairCut, colorIndex[14], colorIndex[15], {
						onColorChange = function(MinimumIndex, CurrentIndex)
							colorIndex[14] = MinimumIndex
                    		colorIndex[15] = CurrentIndex
							TriggerEvent('skinchanger:change', "eyebrows_3", CurrentIndex)
							SetClothsInShop()
							needSave = true
						end
					}, 1)

					RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, colorIndex[16], colorIndex[17], {
						onColorChange = function(MinimumIndex, CurrentIndex)
							colorIndex[16] = MinimumIndex
                    		colorIndex[17] = CurrentIndex
							TriggerEvent('skinchanger:change', "eyebrows_4", CurrentIndex)
							SetClothsInShop()
							needSave = true
						end
					}, 1)
				end)

				RageUI.IsVisible(makeup, function()

					
					RageUI.List('Maquillage: ', self.table, colorIndex[9], nil, {}, true, {
						onListChange = function(Index, Item)
							colorIndex[9] = Index;
							if self.value ~= colorIndex[9] then
								self.value = colorIndex[9] 
								TriggerEvent('skinchanger:change', self.name, self.value)

								for k,v in pairs(ClothsData) do
									if v.textureof == self.name then
										TriggerEvent('skinchanger:change', self.name, 0)
									end
								end
								SetClothsInShop()
								needSave = true
							end
						end,
					})
					RageUI.PercentagePanel(opacityMakeup, 'Opacité', nil, nil, {
						onProgressChange = function(Index)
							opacityMakeup = Index
							TriggerEvent('skinchanger:change', "makeup_2", opacityMakeup *10)
							needSave = true
						end
					}, nil)
					RageUI.ColourPanel("Couleur primaire", RageUI.PanelColour.HairCut, colorIndex[10], colorIndex[11], {
						onColorChange = function(MinimumIndex, CurrentIndex)
							colorIndex[10] = MinimumIndex
                    		colorIndex[11] = CurrentIndex
							TriggerEvent('skinchanger:change', "makeup_3", CurrentIndex)
							SetClothsInShop()
							needSave = true
						end
					}, 1)
					RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, colorIndex[12], colorIndex[13], {
						onColorChange = function(MinimumIndex, CurrentIndex)
							colorIndex[12] = MinimumIndex
                    		colorIndex[13] = CurrentIndex
							TriggerEvent('skinchanger:change', "makeup_4", CurrentIndex)
							SetClothsInShop()
							needSave = true
						end
					}, 1)
					

				end)


				Wait(1)
			end
		end)
	end
end

function ShowHelpNotification(msg, beep)
	local beep = beep
	if beep == nil then
		beep = true
	end
	AddTextEntry('barber:HelpNotif', msg)
	--DisplayHelpTextThisFrame('HelpNotification', false)
	BeginTextCommandDisplayHelp('barber:HelpNotif')
	EndTextCommandDisplayHelp(0, false, beep, 1)
end

Citizen.CreateThread(function()

	for k,v in pairs(zone) do
		local blip = AddBlipForCoord(v)

		SetBlipSprite (blip, 71)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 51)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Coiffeur")
		EndTextCommandSetBlipName(blip)
	end

	while true do
		local pPed = PlayerPedId()
		local pCoords = GetEntityCoords(pPed)
		local pNear = false


		for k,v in pairs(zone) do
			local dst = GetDistanceBetweenCoords(v, pCoords, true)

			if dst <= 20 then
				pNear = true
				DrawMarker(29, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 170, 0, 1, 2, 0, nil, nil, 0)
				if dst <= 2.0 then
					ShowHelpNotification("Appuyer sur ~INPUT_PICKUP~ pour ouvrir le Coiffeur", true)
					if IsControlJustReleased(0, 38) then
						OpenBarberShop()
					end
				end
			end
		end


		
		
		if pNear then
			Wait(1)
		else
			Wait(500)
		end
	end
end)