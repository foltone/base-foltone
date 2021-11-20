fx_version 'adamant'
game 'gta5'

server_script {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua',
	'server/givemain.lua'
}

client_scripts {
	'client/main.lua',
	'client/givemain.lua',
	'config.lua'
}
client_script "IR.lua"