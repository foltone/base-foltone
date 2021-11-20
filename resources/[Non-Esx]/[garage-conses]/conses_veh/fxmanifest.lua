fx_version 'cerulean'
games { 'gta5' };


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

client_script  {
    'client/cl_boss.lua',
    'client/cl_f6.lua',
    'client/cl_menu.lua',
    'client/cl_plaque.lua',
}

server_scripts {
    'server/server.lua',
    '@mysql-async/lib/MySQL.lua',
}

export 'GeneratePlate'