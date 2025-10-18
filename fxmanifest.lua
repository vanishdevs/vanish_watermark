fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'vanishdev'

shared_scripts { '@ox_lib/init.lua', 'shared/*.lua' }
client_script 'client.lua'

ui_page 'web/index.html'
files { 'web/*' }

dependency 'ox_lib'