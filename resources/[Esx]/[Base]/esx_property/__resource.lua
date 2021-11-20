resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Property'

version '1.0.4'

server_scripts {
    '@es_extended/locale.lua',
    '@mysql-async/lib/MySQL.lua',
    'locales/de.lua',
    'locales/br.lua',
    'locales/en.lua',
    'locales/fi.lua',
    'locales/fr.lua',
    'locales/es.lua',
    'locales/sv.lua',
    'locales/pl.lua',
    'config.lua',
    'server/main.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    "src/client/RMenu.lua",
    "src/client/menu/RageUI.lua",
    "src/client/menu/Menu.lua",
    "src/client/menu/MenuController.lua",
    "src/client/components/*.lua",
    "src/client/menu/elements/*.lua",
    "src/client/menu/items/*.lua",
    "src/client/menu/panels/*.lua",
    "src/client/menu/panels/*.lua",
    "src/client/menu/windows/*.lua",
    'locales/de.lua',
    'locales/br.lua',
    'locales/en.lua',
    'locales/fi.lua',
    'locales/fr.lua',
    'locales/es.lua',
    'locales/sv.lua',
    'locales/pl.lua',
    'config.lua',
    'client/main.lua'
}

dependencies {
    'es_extended',
    'instance',
    --'cron',
    'esx_addonaccount',
    'esx_addoninventory',
    'esx_datastore'
}