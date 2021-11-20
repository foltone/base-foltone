fx_version 'cerulean'
games { 'gta5' }

name 'foltone-location'

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
}

client_scripts {
    "config.lua",
    'client/avion.lua',
    'client/bateau.lua',
    'client/helico.lua',
    'client/prevu.lua',
    'client/vehicule.lua'
}

server_scripts {
    'server/main.lua'
}