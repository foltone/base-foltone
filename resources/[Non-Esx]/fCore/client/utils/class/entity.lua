Entity = {}

function Entity.GetPlayerFromPed(ped)
    return NetworkGetPlayerIndexFromPed(ped)
end

function Entity.GetNetId(entity)
    return NetworkGetNetworkIdFromEntity(entity)
end

function Entity.GetEntityFromNetId(net)
    return NetworkGetEntityFromNetworkId(net)
end

function Entity.SetAlpha(entity, alpha)
    SetEntityAlpha(entity, alpha, false)
end

function Entity.ResetAlpha(entity)
    ResetEntityAlpha(entity)
end