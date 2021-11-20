fx_version "adamant"
game "gta5"

description "ESX_Gang"

version "1.0"

Author "VibR1cY"

shared_scripts {
    "shared/*.lua",
}

client_scripts {
	-- MENU RAGEUI --
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
    -- CLIENT -- 
    "client/**/*lua",
}

server_scripts {
    -- BDD -- 
	"@mysql-async/lib/MySQL.lua",
    -- SERVER -- 
    "server/**/*lua",
}