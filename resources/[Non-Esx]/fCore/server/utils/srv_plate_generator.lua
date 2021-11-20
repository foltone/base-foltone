local NumberCharset = {}
local Charset = {}

for i = 48, 57 do
    table.insert(NumberCharset, string.char(i))
end

for i = 65, 90 do
    table.insert(Charset, string.char(i))
end
for i = 97, 122 do
    table.insert(Charset, string.char(i))
end

function GeneratePlate()
    local generatedPlate = string.upper(GetRandomLetter(3) .. ' ' .. GetRandomNumber(3))

    while not found do
        generatedPlate = string.upper(GetRandomLetter(3) .. ' ' .. GetRandomNumber(3))
        MySQL.Async.fetchAll('SELECT * FROM owned_vehicles where @plate = plate', {
            ['@plate'] = plate
        }, function(result)
            if result[1] == nil then
                found = true
            end
        end)

        Wait(10)
    end
    return generatedPlate
end

function GetRandomNumber(length)
    Citizen.Wait(1)
    math.randomseed(GetGameTimer())
    if length > 0 then
        return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
    else
        return ''
    end
end

function GetRandomLetter(length)
    Citizen.Wait(1)
    math.randomseed(GetGameTimer())
    if length > 0 then
        return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
    else
        return ''
    end
end
