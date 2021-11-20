Config                   = {}
Config.DrawDistance      = 15.0
Config.Locale            = 'fr'
Config.IsMecanoJobOnly = true

Config.shopProfit = 10

-- Role
Config.RequiredRole = {'hayes'}

-- Shop Position

Config.Zones = {
	
	ls1 = {
		Pos   = { x = -222.68, y = -1324.39, z = 30.47},
		Size  = {x = 3.0, y = 3.0, z = 0.2},
		Color = {r = 204, g = 204, b = 0},
		Marker= 27,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},
	ls2 = {
		Pos   = { x = -222.27, y = -1329.48, z = 30.47},
		Size  = {x = 3.0, y = 3.0, z = 0.2},
		Color = {r = 204, g = 204, b = 0},
		Marker= 27,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},
	ls3 = {
		Pos   = { x = -197.35, y = -1313.19, z = 26.73},
		Size  = {x = 3.0, y = 3.0, z = 0.2},
		Color = {r = 204, g = 204, b = 0},
		Marker= 27,
		Name  = _U('blip_name'),
		Hint  = _U('press_custom')
	},
}


function GetPlatesName(index)
	if (index == 0) then
		return _U('blue_on_white_1')
	elseif (index == 1) then
		return _U('yellow_on_black')
	elseif (index == 2) then
		return _U('yellow_blue')
	elseif (index == 3) then
		return _U('blue_on_white_2')
	elseif (index == 4) then
		return _U('blue_on_white_3')
	end
end

Config.bodyParts = {
	[1] = {
		mod = 'modSpoilers',
		label = _U('spoilers'),
		modType = 0,
		items = {
			label = {},
			price = 8
		}
	},
	[2] = {
		mod = 'modFrontBumper',
		label = _U('frontbumper'),
		modType = 1,
		items = {
			label = {},
			price = 10
		}
	},
	[3] = {
		mod = 'modRearBumper',
		label = _U('rearbumper'),
		modType = 2,
		items = {
			label = {},
			price = 10
		}
	},
	[4] = {
		mod = 'modSideSkirt',
		label = _U('sideskirt'),
		modType = 3,
		items = {
			label = {},
			price = 7
		}
	},
	[5] = {
		mod = 'modExhaust',
		label = _U('exhaust'),
		modType = 4,
		items = {
			label = {},
			price = 4
		}
	},
	[6] = {
		mod = 'modFrame',
		label = _U('cage'),
		modType = 5,
		items = {
			label = {},
			price = 8
		}
	},
	[7] = {
		mod = 'modGrille',
		label = _U('grille'),
		modType = 6,
		items = {
			label = {},
			price = 4
		}
	},
	[8] = {
		mod = 'modHood',
		label = _U('hood'),
		modType = 7,
		items = {
			label = {},
			price = 5
		}
	},
	[9] = {
		mod = 'modFender',
		label = _U('leftfender'),
		modType = 8,
		items = {
			label = {},
			price = 5
		}
	},
	[10] = {
		mod = 'modRightFender',
		label = _U('rightfender'),
		modType = 9,
		items = {
			label = {},
			price = 2.12
		}
	},
	[11] = {
		mod = 'modRoof',
		label = _U('roof'),
		modType = 10,
		items = {
			label = {},
			price = 5
		}
	},
	[12] = {
		mod = 'wheels',
		label = _U('wheel_type'),
		items = { _U('sport'), _U('muscle'), _U('lowrider'), _U('suv'), _U('allterrain'), _U('tuning'), _U('highend'), _U('motorcycle') },
		modType = 23,
		wheelType = { 0, 1, 2, 3, 4, 5, 7, 6 },
	},
	[13] = {
		mod = 'modFrontWheels',
		label = _U('wheels'),
		modType = 23,
		items = {
			label = {},
			price = 15
		}
	}
}

Config.windowTints = { 
	mod = 'windowTint',
	label = { '[1/7]', '[2/7]', '[3/7]', '[4/7]', '[5/7]', '[6/7]', '[7/7]' },
	label1 = _U('windowtint'),
	tint = { -1, 0, 1, 2, 3, 4, 5 },
	price = 2
}

Config.colorParts = {
	label = { _U('primary'), _U('secondary'), _U('pearlescent'), _U('windows'), _U('interior')--[[, _U('wheels'), _U('tireSmoke'), _U('headlights')--]] },
	mod = { 'primary', 'secondary', 'pearlescent', 'windows', 'interior' },
	wheelColorPrice = 2,
	primaryColorPrice = 3,
	secondaryColorPrice = 3,
	pearlescentColorPrice = 3,
	interiorColorPrice = 3,
	customPrimaryColorPrice = 5,
	customSecondaryColorPrice = 5,
	primaryPaintFinishPrice = 3,
	secondaryPaintFinishPrice = 3
}

Config.resprayTypes = {
	[1] = {
		label = { _U('metallic'), _U('matte'), _U('util'), _U('worn'), _U('brushed'), _U('others'), _U('personalize') },
		mod = { 'metallic', 'matte', 'util', 'worn', 'brushed', 'others', 'personalize' }
	},
	[2] = {
		label = { _U('metallic'), _U('matte'), _U('util'), _U('worn'), _U('brushed'), _U('others'), _U('personalize') },
		mod = { 'metallic', 'matte', 'util', 'worn', 'brushed', 'others', 'personalize' }
	},
	[3] = {
		label = { _U('metallic'), _U('matte'), _U('util'), _U('worn'), _U('brushed'), _U('others') },
		mod = { 'metallic', 'matte', 'util', 'worn', 'brushed', 'others' }
	},
	[4] = {
		label = { '[1/7]', '[2/7]', '[3/7]', '[4/7]', '[5/7]', '[6/7]', '[7/7]' },
		tint = { -1, 0, 1, 2, 3, 4, 5 },
		price = 3
	},
	[5] = {
		label = { _U('metallic'), _U('matte'), _U('util'), _U('worn'), _U('brushed'), _U('others')},
		mod = { 'metallic', 'matte', 'util', 'worn', 'brushed', 'others', 'personalize' }
	},
}

Config.tireSmoke = {
	mod = 'modSmokeEnabled',
	label = _U('tireSmoke'),
	mod1 = 'tyreSmokeColor',
	label1 = _U('tireSmokeColor'),
	price = 3
}

Config.xenon = {
	mod = 'modXenon',
	label = _U('headlights'),
	mod1 = 'xenonColor',
	label1 = _U('xenonColor'),
	items = {
		label = { '[1/14]', '[2/14]', '[3/14]', '[4/14]', '[5/14]', '[6/14]', '[7/14]', '[8/14]', '[9/14]', '[10/14]', '[11/14]', '[12/14]', '[13/14]', '[14/14]' },
		color = { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 }
	},
	price = 2
}

Config.colorPalette = {
	[1] = { 
		metallic = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 49, 50, 51, 52, 53, 54, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 112, 125, 137, 141, 142, 143, 145, 146, 150, 156 }
	},
	[2] = { 
		matte = { 12, 13, 14, 39, 40, 41, 42, 55, 82, 83, 84, 128, 129, 131, 148, 149, 151, 152, 153, 154, 155 }
	},
	[3] = { 
		util = { 15, 16, 17, 18, 19, 20, 43, 44, 45, 56, 57, 75, 76, 77, 78, 79, 80, 81, 108, 109, 110, 122 }
	},
	[4] = { 
		worn = { 21, 22, 23, 24, 25, 26, 47, 48, 58, 59, 60, 85, 86, 87, 113, 114, 115, 116, 121, 123, 124, 126, 130, 132, 133 }
	},
	[5] = { 
		brushed = { 117, 118, 119, 159 }
	},
	[6] = { 
		others = { 120, 127, 134, 135, 136, 138, 139, 140, 144, 147, 157, 158 }
	},
	[7] = {
		personalize = {  }
	},
	[8] = { 
		wheelPrice = 2.58
	}
}

Config.paintFinish = { 0, 12, 15, 21, 117, 120 }

Config.neons = {
	[1] = {
		mod = 'leftNeon',
		label = _U('leftNeon'),
		price = 1
	},
	[2] = {
		mod = 'rightNeon',
		label = _U('rightNeon'),
		price = 1
	},
	[3] = {
		mod = 'frontNeon',
		label = _U('frontNeon'),
		price = 1
	},
	[4] = {
		mod = 'backNeon',
		label = _U('backNeon'),
		price = 1
	},
	[5] = {
		label = 'Cor neon',
		mod = 'neonColor',
		mod1 = 'neonEnabled',
		price = 1
	}
}

Config.extras = {
	[1] = {
		mod = 'modPlateHolder',
		label = _U('modplateholder'),
		modType = 25,
		items = {
			label = {},
			price = 1
		}
	},
	[2] = {
		mod = 'modVanityPlate',
		label = _U('modvanityplate'),
		modType = 26,
		items = {
			label = {},
			price = 1
		}
	},
	[3] = {
		mod = 'modTrimA',
		label = _U('interior'),
		modType = 27,
		items = {
			label = {},
			price = 7.5
		}
	},
	[4] = {
		mod = 'modOrnaments',
		label = _U('trim'),
		modType = 28,
		items = {
			label = {},
			price = 5
		}
	},
	[5] = {
		mod = 'modDashboard',
		label = _U('dashboard'),
		modType = 29,
		items = {
			label = {},
			price = 5
		}
	},
	[6] = {
		mod = 'modDial',
		label = _U('speedometer'),
		modType = 30,
		items = {
			label = {},
			price = 4
		}
	},
	[7] = {
		mod = 'modDoorSpeaker',
		label = _U('door_speakers'),
		modType = 31,
		items = {
			label = {},
			price = 3
		}
	},
	[8] = {
		mod = 'modSeats',
		label = _U('seats'),
		modType = 32,
		items = {
			label = {},
			price = 6
		}
	},
	[9] = {
		mod = 'modSteeringWheel',
		label = _U('steering_wheel'),
		modType = 33,
		items = {
			label = {},
			price = 2
		}
	},
	[10] = {
		mod = 'modShifterLeavers',
		label = _U('gear_lever'),
		modType = 34,
		items = {
			label = {},
			price = 2
		}
	},
	[11] = {
		mod = 'modAPlate',
		label = _U('quarter_deck'),
		modType = 35,
		items = {
			label = {},
			price = 2
		}
	},
	[12] = {
		mod = 'modSpeakers',
		label = _U('speakers'),
		modType = 36,
		items = {
			label = {},
			price = 4
		}
	},
	[13] = {
		mod = 'modTrunk',
		label = _U('trunk'),
		modType = 37,
		items = {
			label = {},
			price = 8
		}
	},
	[14] = {
		mod = 'modHydrolic',
		label = _U('hydraulic'),
		modType = 38,
		items = {
			label = {},
			price = 15
		}
	},
	[15] = {
		mod = 'modEngineBlock',
		label = _U('engine_block'),
		parent = 'cosmetics',
		modType = 39,
		items = {
			label = {},
			price = 5
		}
	},
	[16] = {
		mod = 'modAirFilter',
		label = _U('air_filter'),
		modType = 40,
		items = {
			label = {},
			price = 3
		}
	},
	[17] = {
		mod = 'modStruts',
		label = _U('struts'),
		modType = 41,
		items = {
			label = {},
			price = 3
		}
	},
	[18] = {
		mod = 'modArchCover',
		label = _U('arch_cover'),
		modType = 42,
		items = {
			label = {},
			price = 4
		}
	},
	[19] = {
		mod = 'modAerials',
		label = _U('aerials'),
		modType = 43,
		items = {
			label = {},
			price = 1
		}
	},
	[20] = {
		mod = 'modTrimB',
		label = _U('wings'),
		modType = 44,
		items = {
			label = {},
			price = 5
		}
	},
	[21] = {
		mod = 'modTank',
		label = _U('fuel_tank'),
		modType = 45,
		items = {
			label = {},
			price = 42.19
		}
	},
	[22] = {
		mod = 'modWindows',
		label = _U('windows'),
		modType = 46,
		items = {
			label = {},
			price = 4
		}
	},
	[23] = {
		mod = 'modLivery',
		label = _U('stickers'),
		modType = 48,
		items = {
			label = {},
			price = 10
		}
	},
	[24] = {
		mod = 'modHorns',
		label = _U('horns'),
		modType = 14,
		items = {
			label = {},
			price = 1
		}
	}
}

Config.upgrades = {
	[1]	= {
		mod = 'modArmor',
		label = _U('armor'),
		modType = 16,
		items = {
			--[[label = {'Stock', 'Level 1', 'Level 2', 'Level 3', 'Level 4', 'Level 5', 'Level 6'},--]]
			label = {},
			price = { 0, 999, 999, 999, 999.00, 999.00, 999.00 }
		}
	},
	[2]	= {
		mod = 'modEngine',
		label = _U('engine'),
		modType = 11,
		items = {
			--[[label = {'Stock', 'Level 1', 'Level 2', 'Level 3', 'Level 4'},--]]
			label = {},
			price = { 0, 20, 30, 40, 50, 60 }
		}
	},
	[3]	= {
		mod = 'modTransmission',
		label = _U('transmission'),
		modType = 13,
		items = {
			--[[label = {'Stock', 'Level 1', 'Level 2', 'Level 3', 'Level 4'},--]]
			label = {},
			price = { 0, 10, 15, 20, 25, 30 }
		}
	},
	[4]	= {
		mod = 'modBrakes',
		label = _U('brakes'),
		modType = 12,
		items = {
			--[[label = {'Stock', 'Level 1', 'Level 2', 'Level 3', 'Level 4'},--]]
			label = {},
			price = { 0, 10, 20, 30, 40, 50, 60 }
		}
	},
	[5]	= {
		mod = 'modSuspension',
		label = _U('suspension'),
		modType = 15,
		items = {
			--[[label = {'Stock', 'Level 1', 'Level 2', 'Level 3', 'Level 4', 'Level 5'},--]]
			label = {},
			price = { 0, 10, 15, 20, 25, 30, 35 }
		}
	},
	[6]	= {
		mod = 'modTurbo',
		label = _U('turbo'),
		modType = 18,
		items = {
			--[[label = {'Stock', 'Level 1'},--]]
			label = {},
			price = { 0, 50 }
		}
	}
}