-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Trusted-Studios || FX-Manifest
-- ════════════════════════════════════════════════════════════════════════════════════ --
fx_version 'cerulean'
lua54 'yes'
games { 'gta5' }

author 'Trusted-Studios | GTA:O Loading Script'
description 'GTA:O Loading Script made by Trusted-Studios'
repository 'https://shop.trusted-studios.eu'
version '1.0.1'

loadingscreen_manual_shutdown 'yes'

shared_scripts {
    'config.lua',
}

client_scripts {
   'client/main.lua',
}

export 'TriggerLoadingScreen'