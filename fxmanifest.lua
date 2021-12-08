fx_version 'cerulean'
games { 'gta5' }

client_scripts {
    'client/*.lua',
    'config.lua'
}

server_script {
    'server/*.lua',
    'config.lua',
    '@mysql-async/lib/MySQL.lua',
}