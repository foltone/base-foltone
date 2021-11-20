fx_version 'cerulean'
games { 'gta5' };

client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
}

ui_page('client/headbag/index.html') --HEAD BAG IMAGE

files {
    'client/headbag/index.html'
}

client_scripts {
    'client/utils/cl_utils.lua',
    'client/**/*.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "server/**/*.lua"
}

