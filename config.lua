-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Trusted Development || Debug-print
-- ════════════════════════════════════════════════════════════════════════════════════ --

local filename = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("^.*/(.*).lua$") or str
end
print("^6[SHARED] - DEBUG] ^0: "..filename()..".lua gestartet");

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Trusted Development || System
-- ════════════════════════════════════════════════════════════════════════════════════ --

Trusted = {}
Trusted.Debug = false

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Code
-- ════════════════════════════════════════════════════════════════════════════════════ --

Config = {}

--- Cloud opacity
Config.CloudOpacity = 0.20

--- Time in seconds to wait (e.g. to load things in the background)
Config.WaitTime = 5