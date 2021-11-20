-- NShops created by Nehco, no sell !

ESX = nil 
Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)
        TriggerEvent("esx:getSharedObject", function(obj)
            ESX = obj
        end)
    end
end)

local Shops = {Index = 1, pShops = {}}

Citizen.CreateThread(function()
    for k,v in pairs(Configsuper.Shops.Positions) do
        local PosPed = v["PosPed"]
        local Blips = v["Blips"]
        if PosPed then
            PosPed["hash"] = PosPed["hash"] or 416176080
            LoadModelPNJ(PosPed["hash"])
            if not DoesEntityExist(PosPed["entity"]) then
                PosPed["entity"] = CreatePed(4, PosPed["hash"], PosPed["x"], PosPed["y"], PosPed["z"], PosPed["h"])
                SetEntityAsMissionEntity(PosPed["entity"])
                SetBlockingOfNonTemporaryEvents(PosPed["entity"], true)
                FreezeEntityPosition(PosPed["entity"], true)
                SetEntityInvincible(PosPed["entity"], true)
            end
            SetModelAsNoLongerNeeded(PosPed["hash"])
        end
        Blips = AddBlipForCoord( Blips["x"], Blips["y"], Blips["z"])
        SetBlipSprite(Blips, 52)
        SetBlipDisplay(Blips, 4)
        SetBlipScale(Blips, 0.8)
        SetBlipColour(Blips, 2)
        SetBlipAsShortRange(Blips, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Superette")
        EndTextCommandSetBlipName(Blips)
    end
end)

Citizen.CreateThread(function()
    while true do
        local Wating = 1000
        local coords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Configsuper.Shops.Positions) do
            for w,_ in pairs(v["PosMenu"]) do
                local pos = v["PosMenu"][w]
                local dist = GetDistanceBetweenCoords(coords, pos["x"], pos["y"], pos["z"], true)
                if dist <= 8.0 then
                    Wating = 1
                    DrawMarker(29, pos["x"], pos["y"], pos["z"], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.35, 0.35, 0.35, 0, 255, 0, 255, 55555, false, true, 2, false, false, false, false)
                    if dist <= 1.0 then
                        RageUI.Text({ message = "Appuyez sur [~b~E~s~] pour accéder aux rayon(s) : ~b~" .. Configsuper.Shops.Notif[pos["value"]], time_display = 1 })
                        if IsControlJustPressed(0, 38) then
                            OpenMenu(pos, Configsuper.Shops.ShopsItems[pos["value"]])
                        end
                    end
                end
            end
        end
        Citizen.Wait(Wating)
    end
end)

function LoadModelPNJ(hash)
    if type(hash) == "string" then hash = GetHashKey(hash) end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end
end

function OpenMenu(action, interaction)
    if action["value"] == "Caisse" then
        OpenPanierShops()
    else
        OpenShopsMenu(interaction)
    end
end

RMenu.Add("shops_menu_panier", "shops_main", RageUI.CreateMenu("Superétte", "INTÉRACTIONS"))
RMenu.Add("shops_menu_panier", "shops_pay", RageUI.CreateSubMenu(RMenu:Get("shops_menu_panier", "shops_main"), "Superétte", "INTÉRACTIONS"))
RMenu:Get("shops_menu_panier", "shops_main").Closed = function()
	PanierShops = false
end;

function OpenPanierShops()
	if not PanierShops then
		PanierShops = true
		RageUI.Visible(RMenu:Get("shops_menu_panier", "shops_main"), true)
        Citizen.CreateThread(function()
            while PanierShops do
                Citizen.Wait(1)
                RageUI.IsVisible(RMenu:Get("shops_menu_panier", "shops_main"), true, true, true, function()
                    if #Shops.pShops > 0 then
                        RageUI.Separator(" ↓ ~b~Liste des article(s) du panier ~s~ ↓")
                        for k,v in pairs(Shops.pShops) do
                            RageUI.List("[~b~"..v["amount"].."~s~] - ".. v["label"].." || ~g~"..v["price"]*v["amount"].."$", {"Payer en liquide","Payer en banque"}, v["Index"], nil, {}, true, function(_,_,s,Index)
                                v["Index"] = Index
                                if s then
                                    ESX.TriggerServerCallback('NShops:CheckMoney', function(HasMoney)
                                        if HasMoney then
                                            TriggerServerEvent("NShops:BuyItems", v["price"]*v["amount"], v["value"], v["amount"], v["Index"])
                                            ESX.ShowAdvancedNotification("LTD", "Information(s)", "Vous avez payer ~b~"..v["amount"].."~s~ "..v["label"].." pour ~g~"..v["price"]*v["amount"].."$", "CHAR_BANK_FLEECA", 1)
                                            table.remove(Shops.pShops, k)
                                        else
                                            ESX.ShowAdvancedNotification("LTD", "Information(s)", "Vous n'avez pas assez d'argent(s) !", "CHAR_BANK_FLEECA", 1)
                                        end
                                    end, v["price"]*v["amount"], v["Index"])
                                end
                            end)
                        end
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~r~Votre panier est actuellement vide !")
                        RageUI.Separator("")
                    end
                end)
            end
        end)
    end
end

RMenu.Add("shops_menu", "shops_main", RageUI.CreateMenu("Superétte", "INTÉRACTIONS"))
RMenu:Get("shops_menu", "shops_main").Closed = function()
	ShopsMenu = false
end;

function OpenShopsMenu(ShopsInfos)
	if not ShopsMenu then
		ShopsMenu = true
		RageUI.Visible(RMenu:Get("shops_menu", "shops_main"), true)
        Citizen.CreateThread(function()
            while ShopsMenu do
                Citizen.Wait(1)
                RageUI.IsVisible(RMenu:Get("shops_menu", "shops_main"), true, true, true, function()
                    for k,v in pairs(ShopsInfos) do
                        RageUI.List("[~g~"..v["price"].."$~s~] - "..v["label"], {1,2,3,4,5,6,7,8,9,10}, v["Index"], nil, {}, true, function(_,_,s,Index)
                            v["Index"] = Index
                            if s then
                                table.insert(Shops.pShops, {
                                    label = v["label"],
                                    value = v["item"],
                                    amount = v["Index"],
                                    price = v["price"],
                                    Index = 1,
                                })
                                ESX.ShowAdvancedNotification("LTD", "Information(s)", 'Votre article à été ajouté à votre panier !', "CHAR_BANK_FLEECA", 1)        
                            end
                        end)
                    end
                end)
            end
        end)
    end
end