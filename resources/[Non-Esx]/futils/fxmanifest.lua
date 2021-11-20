fx_version 'cerulean'
games { 'gta5' }

name 'RageUI'


ui_page 'html/index.html'


files {
    'client/remove_ai_cops/events.meta',
	'client/remove_ai_cops/relationships.dat'
}

--data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'client/remove_ai_cops/events.meta'

client_scripts {
    'client/**/*.lua',
}


server_scripts {
    'server/**/*.lua',
}