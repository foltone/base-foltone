fx_version 'adamant'
game 'gta5'

 

server_script '@mysql-async/lib/MySQL.lua'

-- RageUI
client_scripts {
    "src/client/RMenu.lua",
	"src/client/menu/RageUI.lua",
	"src/client/menu/Menu.lua",
	"src/client/menu/MenuController.lua",

	"src/client/menu/items/UIButton.lua",
	"src/client/menu/items/UICheckBox.lua",
	"src/client/menu/items/UIList.lua",
	"src/client/menu/items/UIProgress.lua",
	"src/client/menu/items/UISeparator.lua",
	"src/client/menu/items/UISlider.lua",
	"src/client/menu/items/UISliderHeritage.lua",
	"src/client/menu/items/UISliderProgress.lua",

	"src/client/components/Audio.lua",
	"src/client/components/Screen.lua",
	"src/client/components/Rectangle.lua",
	"src/client/components/Sprite.lua",
	"src/client/components/Text.lua",
	"src/client/components/Visual.lua",

	"src/client/menu/elements/ItemsBadge.lua",
	"src/client/menu/elements/ItemsColour.lua",
	"src/client/menu/elements/PanelColour.lua",

	"src/client/menu/panels/UIBoutonPanel.lua",
	"src/client/menu/panels/UIColourPanel.lua",
	"src/client/menu/panels/UIGridPanel.lua",
	"src/client/menu/panels/UIGridPanelHorizontal.lua",
	"src/client/menu/panels/UIGridPanelVertical.lua",
	"src/client/menu/panels/UIPercentagePanel.lua",
	"src/client/menu/panels/UIStatisticsPanel.lua",

	"src/client/menu/windows/UIHeritage.lua",
-- Menu --
	'src/client/Menu/*.lua'
}
 

client_scripts {
    'client.lua',
    'config.lua'
}

server_scripts {
    'server.lua',
    'config.lua'
}