-- CONSTANTS
aura_env.SHADOWFURY_ID = 320132

-- UTIL
aura_env.timedFrameGlow = function(unit, duration)
  return {
    show = true,
    changed = true,
    progressType = "timed",
    duration = duration,
    expirationTime = GetTime() + duration,
    unit = unit,
    autoHide = true
  }
end
