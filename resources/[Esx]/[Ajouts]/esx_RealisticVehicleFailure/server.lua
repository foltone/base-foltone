------------------------------------------
--	iEnsomatic RealisticVehicleFailure  --
------------------------------------------
--
--	Created by Jens Sandalgaard
--
--	This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
--
--	https://github.com/iEns/RealisticVehicleFailure
--
local function checkWhitelist(id)
    for key, value in pairs(RepairWhitelist) do
        if id == value then
            return true
        end
    end
    return false
end

AddEventHandler('chatMessage', function(source, _, message)
    local msg = string.lower(message)
    local identifier = GetPlayerIdentifiers(source)[2]
    if msg == "/repair" then
        CancelEvent()
        if RepairEveryoneWhitelisted == true then
            TriggerClientEvent('iens:repair', source)
        else
            if checkWhitelist(identifier) then
                TriggerClientEvent('iens:repair', source)
            else
                TriggerClientEvent('iens:notAllowed', source)
            end
        end
    end
end)

-- RegisterServerEvent('kyo:IndicatorL')
-- RegisterServerEvent('kyo:IndicatorR')

-- AddEventHandler('kyo:IndicatorL', function(IndicatorL)
--     local netID = source
--     TriggerClientEvent('kyo:updateIndicators', -1, netID, 'left', IndicatorL)
-- end)

-- AddEventHandler('kyo:IndicatorR', function(IndicatorR)
--     local netID = source
--     TriggerClientEvent('kyo:updateIndicators', -1, netID, 'right', IndicatorR)
-- end)
