local config = {
    [0] = 30,
    [1] = 50,
    [2] = 150,
    [3] = 25,
    [4] = 20,
    [5] = 20,
    [6] = 15,
    [7] = 10,
    [8] = 1,
    [9] = 30,
    [10] = 250,
    [11] = 350,
    [12] = 200,
    [13] = 0,
    [14] = 100,
    [15] = 5,
    [16] = 1000,
    [17] = 100,
    [18] = 100,
    [19] = 100,
    [20] = 500,
    [21] = 0,
}

local custom = {
    [GetHashKey("kamacho")] = 100,
    [GetHashKey("dubsta3")] = 100,
    [GetHashKey("wildtrak")] = 250,
    [GetHashKey("contender")] = 300,
    [GetHashKey("19raptor")] = 300,
    [GetHashKey("sandking")] = 150,
    [GetHashKey("tractor3")] = 10,
    [GetHashKey("tractor2")] = 10,
    [GetHashKey("tractor")] = 10,
    [GetHashKey("caddy")] = 10,
    [GetHashKey("caddy2")] = 10,
    [GetHashKey("caddy3")] = 10,
}

function GetVehClassValue(class, model)
    if custom[model] ~= nil then
        return custom[model]
    else
        if config[class] ~= nil then
            return config[class] 
        else
            return 20
        end
    end
end