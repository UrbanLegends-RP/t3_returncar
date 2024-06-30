fx_version 'cerulean'
game 'gta5'

author 'Your Name'
description 'Return Car Script'
version '1.0.0'

shared_scripts {
    'config.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts {
    'client/main.lua'
}

dependencies {
    'qb-core',
    'qb-menu',
    'qb-target'
}
