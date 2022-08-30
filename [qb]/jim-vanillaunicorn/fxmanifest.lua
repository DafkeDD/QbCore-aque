name "Jim-VanillaUnicorn"
author "Jimathy"
version "v1.1"
description "Vanilla Unicorn Job Script By Jimathy"
fx_version "cerulean"
game "gta5"

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/server.lua'
}

shared_scripts {
    'config.lua',
}

lua54 'yes'

escrow_ignore {
	'*.lua*',
	'client/*.lua*',
	'server/*.lua*',
}server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }