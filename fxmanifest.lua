fx_version 'cerulean'
game 'gta5'

author 'Legendary'
description 'A Simple Alarm Script For QBCore'
version '1.0.0'

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'client/*.lua',
    'config.lua',
}

server_scripts {
	'server/*.lua',
}

shared_scripts {
    'config.lua',
}

files {
    'polyzone/*.lua' 
}


dependency 'PolyZone' 

lua54 'yes'
