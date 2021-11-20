Citizen.CreateThread(function()
    Holograms()
end)

function Holograms()
    while true do
        Citizen.Wait(0)
        -- Hologram No. 1
        if GetDistanceBetweenCoords(-491.07, -725.96, 23.90, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
            Draw3DText(-491.07, -725.96, 23.90 - 1.400, "~b~Bienvenue sur foltone", 4, 0.1, 0.1)
            Draw3DText(-491.07, -725.96, 23.90 - 1.600, "Merci de rejoindre le discord", 4, 0.1, 0.1)
            Draw3DText(-491.07, -725.96, 23.90 - 1.800, "~r~discord.gg/X9ReemrhKh", 4, 0.1, 0.1)
        end
    end
end

-------------------------------------------------------------------------------------------------------------------------
function Draw3DText(x, y, z, textInput, fontId, scaleX, scaleY)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local scale = (1 / dist) * 20
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    SetTextScale(scaleX * scale, scaleY * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255)        -- You can change the text color here
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x, y, z + 2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
