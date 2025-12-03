fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

name 'rex-goldpanning'
author 'RexShackGaming'
description 'Gold panning system for RSG Framework'
version '2.0.5'
url 'https://discord.gg/YUV7ebzkqs'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua',
    'server/versionchecker.lua'
}

files {
  'locales/*.json'
}

dependencies {
    'rsg-core',
    'ox_lib',
}

lua54 'yes'
