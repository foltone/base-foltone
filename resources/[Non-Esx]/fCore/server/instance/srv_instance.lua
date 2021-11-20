Citizen.CreateThread(function()
    local type = "srv_instance.lua"
    --print("FCore: Charge ["..type.."]")
end)

local instance = {}
local pInstance = {}

function GetPlayerInInstance(instance)
    local toSend = {}
    for k, v in pairs(pInstance) do
        if instance == v then
            table.insert(toSend, k)
        end
    end
    return toSend
end

function GetPlayerInstance(source)
    return pInstance[source]
end

function SetInstanceHouseId(instanceId, house_id)
    instance[instanceId].house_id = house_id
end

function GetInstanceHouseId(source)
    return instance[pInstance[source]].house_id
end

local function CreateInstance(source, needHost, posIn, posOut)
    if instance[source] == nil then
        instance[source] = {}
        instance[source].needHost = needHost
        instance[source].host = tonumber(source)
        instance[source].member = {}
        instance[source].posIn = posIn
        instance[source].posOut = posOut
        print("^5INSTANCE: ^7Instance ^2cree^7 avec l'id [" .. source .. "]")
    end
end

local function DeleteInstance(instanceId)
    if instance[instanceId] ~= nil then
        instance[instanceId] = nil
        print("^5INSTANCE: ^7Instance ^1supprimer^7 avec l'id [" .. instanceId .. "]")
    end
end

local function RefreshInstanceIndex(instanceId)
    if instance[instanceId] ~= nil then
        for k, v in pairs(instance[instanceId].member) do
            TriggerClientEvent("instance:RefreshInstanceIndex", tonumber(k), instance[instanceId])
        end
    end
end

function MakeAllPlayersLeaveInstance(instanceId)
    if instance[instanceId] ~= nil then
        for k, v in pairs(instance[instanceId].member) do
            TriggerClientEvent("FeedM:showNotification", k, "Vous avez été Kick de l'instance (Hôte déconnecté)", 5000, "danger")
            
            
            MakePlayerLeaveInstance(instanceId, k)
        end
    end
end

function MakePlayerLeaveInstance(instanceId, player)
    if instance[instanceId] ~= nil then
        local posToGoBack = instance[instanceId].posOut
        instance[instanceId].member[player] = nil
        -- Kick player from instance 
        TriggerClientEvent("instance:LeaveInstance", player, posToGoBack)
        TriggerClientEvent("FeedM:showNotification", player, "Vous êtes sortie d'une instance", 5000, "danger")
        RefreshInstanceIndex(instanceId)
        print("^5INSTANCE: ^7Le joueur [" .. player .. "] à quitté l'instance [" .. instanceId .. "]")

        if instance[instanceId].host == player then
            MakeAllPlayersLeaveInstance(instanceId)
            DeleteInstance(instanceId)
        else
            local count = 0
            for k, v in pairs(instance[instanceId].member) do
                count = count + 1
            end
            if count <= 0 then
                DeleteInstance(instanceId)
            end
        end

    end
end

local function MakePlayerJoinInstance(instanceId, source, pos, InstancePos)
    if instance[instanceId] ~= nil then
        instance[instanceId].member[source] = pos
        pInstance[source] = instanceId
        -- Make player enter instance
        TriggerClientEvent("FeedM:showNotification", source, "Vous avez rejoins une instance", 5000, "danger")
        TriggerClientEvent("instance:EnterInstance", source, instance[instanceId], InstancePos)
        RefreshInstanceIndex(instanceId)
        print("^5INSTANCE: ^7Le joueur [" .. source .. "] à rejoins l'instance [" .. instanceId .. "]")
    else
        TriggerClientEvent("FeedM:showNotification", source, "~r~Erreur\nL'instance n'éxiste plus.", 5000, "danger")
    end
end

RegisterNetEvent("instance:JoinInstanceWithName")
AddEventHandler("instance:JoinInstanceWithName", function(instanceName, OldPos, InstancePos)
    CreateInstance(instanceName, false, InstancePos, OldPos)
    MakePlayerJoinInstance(instanceName, source, OldPos, InstancePos)
end)

RegisterNetEvent("instance:JoinInstance")
AddEventHandler("instance:JoinInstance", function(instanceName, OldPos, InstancePos)
    CreateInstance(source, true, InstancePos, OldPos)
    MakePlayerJoinInstance(source, source, OldPos, InstancePos)
end)

RegisterNetEvent("instance:LeaveInstance")
AddEventHandler("instance:LeaveInstance", function()
    MakePlayerLeaveInstance(pInstance[source], source)
end)

RegisterNetEvent("instance:InvitePlayer")
AddEventHandler("instance:InvitePlayer", function(target, OldPos)
    MakePlayerJoinInstance(pInstance[source], target, OldPos, instance[pInstance[source]].posIn)
    TriggerClientEvent("house:StartInvitedLoop", target, GetInstanceHouseId(source))
end)

RegisterNetEvent("instance:SetHouseId")
AddEventHandler("instance:SetHouseId", function(house_id)
    SetInstanceHouseId(pInstance[source], house_id)
end)

Citizen.CreateThread(function()
    while true do
        for k, v in pairs(instance) do
            if v.needHost then
                if GetPlayerPing(v.host) == 0 then
                    MakeAllPlayersLeaveInstance(k)
                else
                    for i, _ in pairs(v.member) do
                        if GetPlayerPing(i) == 0 then
                            MakePlayerLeaveInstance(k, i)
                        end
                    end
                end
            end
        end
        Wait(5 * 1000)
    end
end)

-- dev debug


--Citizen.CreateThread(function()
--    while true do
--        local id = math.random(1,1000)
--        CreateInstance("biker room "..id, false)
--        Wait(2000)
--        DeleteInstance("biker room "..id)
--        Wait(2000)
--    end
--end)

local InConnectInstance = {}
RegisterNetEvent("instance:ConnectInstance")
AddEventHandler("instance:ConnectInstance", function()
    if InConnectInstance[source] == nil then
        InConnectInstance[source] = true
        SetPlayerRoutingBucket(source, math.random(1, 60))
    else
        InConnectInstance[source] = nil
        SetPlayerRoutingBucket(source, 0)
    end
end)

RegisterNetEvent("instance:SetIntoBucket")
AddEventHandler("instance:SetIntoBucket", function(bucket)
    SetPlayerRoutingBucket(source, bucket)
end)