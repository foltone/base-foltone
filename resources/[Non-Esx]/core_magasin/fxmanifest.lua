fx_version 'adamant'

game 'gta5'

-- RageUI
client_scripts {
    "src/client/RMenu.lua",
    "src/client/menu/RageUI.lua",
    "src/client/menu/Menu.lua",
    "src/client/menu/MenuController.lua",

    "src/client/components/*.lua",

    "src/client/menu/elements/*.lua",

    "src/client/menu/items/*.lua",

    "src/client/menu/panels/*.lua",

    "src/client/menu/windows/*.lua",
}


client_scripts {
    '@es_extended/locale.lua',
    'client/amuclient.lua',
	'client/superclien.lua',
    'config.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    '@mysql-async/lib/MySQL.lua',
    'server/amuserver.lua',
	'server/superserver.lua'

}

dependencies {
	'es_extended'
}
