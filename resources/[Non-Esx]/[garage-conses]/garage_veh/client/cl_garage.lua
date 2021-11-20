ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

-- Menu --
local open = false 
local MenuGarage = RageUI.CreateMenu("Garage", "INTERACTION")
MenuGarage.Display.Header = true 
MenuGarage.Closed = function()
    open = false
end

Garage = {
    vehiclelist = {},
}

function OpenMenuGarage() 
    if open then 
        open = false
        RageUI.Visible(MenuGarage, false)
        return
    else
        open = true
        RageUI.Visible(MenuGarage, true)
        Citizen.CreateThread(function()
            while open do 
                RageUI.IsVisible(MenuGarage, function()
                RageUI.Separator("↓     ~b~Véhicule     ~s~↓")
                for i = 1, #Garage.vehiclelist, 1 do
                    local hashvehicle = Garage.vehiclelist[i].vehicle.model
                    local modelevehiclespawn = Garage.vehiclelist[i].vehicle
                    local nomvehiclemodele = GetDisplayNameFromVehicleModel(hashvehicle)
                    local nomvehicletexte  = GetLabelText(nomvehiclemodele)
                    local plaque = Garage.vehiclelist[i].plate
        
        
                    RageUI.Button(nomvehicletexte.." | "..plaque, "Pour sortir votre véhicule", {RightLabel = "→→→"}, true, {
                        onSelected = function()  
                            SpawnVehicle(modelevehiclespawn, plaque)
                            RageUI.CloseAll()
                            open = false
                        end
                    })
                end
                    
                    RageUI.Separator("↓ ~r~    Fermeture    ~s~↓")
                    RageUI.Button("Fermer", nil, {Color = {BackgroundColor = {255, 0, 0, 50}}, RightLabel = "~y~→→"}, true , {
                        onSelected = function()
                            RageUI.CloseAll()
                            open = false
                        end
                    })
                end)
            Wait(0)
            end
        end)
    end
end

RegisterNetEvent("dpr_core:OpenGarageMenu") AddEventHandler("dpr_core:OpenGarageMenu", function() OpenMenuGarage() end)