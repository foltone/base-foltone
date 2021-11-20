ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Menu --
local open = false 
local MenuPound = RageUI.CreateMenu("Fourrière", "INTERACTION")
MenuPound.Display.Header = true 
MenuPound.Closed = function()
    open = false
end

Pound = {
    poundlist = {}
}

function OpenMenuPound() 
    if open then 
        open = false
        RageUI.Visible(MenuPound, false)
        return
    else
        open = true
        RageUI.Visible(MenuPound, true)
        Citizen.CreateThread(function()
            while open do 
                RageUI.IsVisible(MenuPound, function()
                RageUI.Separator("↓     ~b~Véhicule     ~s~↓")
                for i = 1, #Pound.poundlist, 1 do
                    local hashvehicle = Pound.poundlist[i].vehicle.model
                    local modelevehiclespawn = Pound.poundlist[i].vehicle
                    local nomvehiclemodele = GetDisplayNameFromVehicleModel(hashvehicle)
                    local nomvehicletexte  = GetLabelText(nomvehiclemodele)
                    local plaque = Pound.poundlist[i].plate
        
        
                    RageUI.Button(nomvehicletexte.." | "..plaque, nil, {RightLabel = "~y~→"}, true, {
                        onSelected = function() 
                            ESX.TriggerServerCallback('dpr_core:achat', function(suffisantsous)
                                if suffisantsous then
                                    SpawnVehicle(modelevehiclespawn, plaque)
                                    RageUI.CloseAll()
                                    publicfourriere = false
                                else
                                    ESX.ShowNotification('Tu n\'as pas assez d argent!')
                                end
                            end)
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
