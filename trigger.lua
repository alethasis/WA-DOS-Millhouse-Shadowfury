function (allstates, event, ...)
  if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
    -- https://wowpedia.fandom.com/wiki/API_CombatLogGetCurrentEventInfo
    local _, subEvent, _, _, _, _, _, destGUID, destName, _, _, spellID = ...

    if (subEvent == "SPELL_AURA_APPLIED" and spellID == aura_env.SHADOWFURY_ID) then
      allstates[destGUID] = aura_env.timedFrameGlow(destName, 5)
      return true
    elseif (subEvent == "SPELL_AURA_REMOVED" and spellID == aura_env.WICKED_RUSH_ID) then
      -- Order matters
      aura_env.resetCount()

      if (UnitIsUnit(destName, "player")) then
        allstates[destName] = {
          show = false,
          changed = true,
          count = aura_env.count
        }
        return true
      end
    end
  end
end
