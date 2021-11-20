fx_version 'adamant'
games { 'gta5' }

client_scripts {
	'jaymenu.lua',
	'config.lua',
	'client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

file 'AllTattoos.json'

client_script "IR.lua"