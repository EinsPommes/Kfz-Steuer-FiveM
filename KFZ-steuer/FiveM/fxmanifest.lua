fx_version 'cerulean'
games { 'gta5' }

client_script {
    'client.lua',
    'config.lua'
}

server_script {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}

