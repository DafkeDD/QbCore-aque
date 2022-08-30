fx_version 'cerulean'
game 'gta5'

author 'Viperz#3060'
version '1.0.0'

client_scripts {
  'config.lua',
  'client/cl_main.lua',
  'client/cl_animations.lua',
  'client/cl_parts.lua',
  'client/target.lua',
}

server_scripts {
  'config.lua',
  'server/sv_main.lua',
}

shared_scripts {
  --'@qb-core/import.lua', -- if you are using older version of qbcore you'll have to remove this
}