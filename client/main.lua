-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Trusted Development || Debug-print
-- ════════════════════════════════════════════════════════════════════════════════════ --

if Trusted.Debug then
    local filename = function()
        local str = debug.getinfo(2, "S").source:sub(2)
        return str:match("^.*/(.*).lua$") or str
    end
    print("^6[CLIENT - DEBUG] ^0: "..filename()..".lua gestartet");
end

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Code
-- ════════════════════════════════════════════════════════════════════════════════════ --

Loading = {
    loading = false,
}

function Loading:init()
    CreateThread(function()
        while self.loading do
            Wait(0)
            SetCloudHatOpacity(Config.CloudOpacity)
            HideHudAndRadarThisFrame()
            SetDrawOrigin(0.0, 0.0, 0.0, 0)
        end
    end)

    if not IsPlayerSwitchInProgress() then
        SwitchOutPlayer(PlayerPedId(), 0, 1)
    end
    DoScreenFadeOut(0)
end

function Loading:Main()
    self.loading = true
    self:init()

    repeat
        Wait(0)
        if not IsScreenFadedOut() then
            DoScreenFadeOut(0)
        end
    until GetPlayerSwitchState() == 5

    if Trusted.Debug then
        print("[1]")
    end

    Wait(2500)

    DoScreenFadeIn(500)
    repeat
        Wait(0)
    until IsScreenFadedIn()

    if Trusted.Debug then
        print("[2]")
    end

    self:ToogleSound(false)

    Wait(Config.WaitTime * 1000)

    while true do
        Wait(250)
        local ped <const> = PlayerPedId()
        local archetype <const> = GetEntityArchetypeName(ped)
        if archetype == "mp_m_freemode_01" or archetype == "mp_f_freemode_01" then
            break
        end
    end

    if Trusted.Debug then
        print("[3]")
    end

    local ped <const> = PlayerPedId()
    FreezeEntityPosition(ped, true)

    while not HasCollisionLoadedAroundEntity(ped) do
        Wait(0)
    end

    if Trusted.Debug then
        print("[4]")
    end

    FreezeEntityPosition(ped, false)
    SwitchInPlayer(ped)

    repeat Wait(100) until GetPlayerSwitchState() == 12

    if Trusted.Debug then
        print("[5]")
    end

    self.loading = false
end

function Loading:ToogleSound(state)
    if state then
        StartAudioScene("MP_LEADERBOARD_SCENE")
        return
    end

    StopAudioScene("MP_LEADERBOARD_SCENE")
end

CreateThread(function()
    if not Config.DircetTrigger then
        return
    end

    Loading:Main()
end)

exports("TriggerLoadingScreen", function()
    Loading:Main()
end)