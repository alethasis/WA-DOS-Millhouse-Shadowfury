-- CONSTANTS
aura_env.SHADOWFURY_SPELL_ID = 320132
aura_env.SHADOWFURY_HIDDEN_SPELL_ID = 326475
aura_env.SHADOWFURY_CAST_TIME = 5
aura_env.STATE_KEY = "SHADOWFURY_CAST"

-- UTIL
aura_env.shadowfuryTrigger = function(payload)
    local name, _, icon = GetSpellInfo(aura_env.SHADOWFURY_SPELL_ID)

    local duration = payload.duration

    return {
        show = true,
        changed = true,
        autoHide = true,
        displayText = name,
        duration = duration,
        expirationTime = GetTime() + duration,
        icon = icon,
        progressType = "timed",
        unit = payload.unit
    }
end

aura_env.msToSec = function(ms) return math.ceil(ms / 1000) end
