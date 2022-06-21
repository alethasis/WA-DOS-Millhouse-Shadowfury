function (allstates, event, ...)
  if (event == "UNIT_SPELLCAST_SUCCEEDED") then
      local unit, _, spellID = ...

      if (unit == "boss1" and spellID == aura_env.SHADOWFURY_HIDDEN_SPELL_ID) then
          local unitTarget = unit .. "target"

          local targetExists = UnitExists(unitTarget)
          local isStateAvailable = allstates[aura_env.STATE_KEY] == nil

          if (targetExists and isStateAvailable) then
              allstates[aura_env.STATE_KEY] =
                  aura_env.shadowfuryTrigger(
                  {
                      duration = aura_env.SHADOWFURY_CAST_TIME,
                      unit = unitTarget
                  }
              )
              return true
          end
      end
  elseif (event == "UNIT_SPELLCAST_START") then
      local unit, _, spellID = ...

      if (unit == "boss1" and spellID == aura_env.SHADOWFURY_SPELL_ID) then
          local unitTarget = unit .. "target"

          local targetExists = UnitExists(unitTarget)
          local isStateAvailable = allstates[aura_env.STATE_KEY] == nil

          if (targetExists and isStateAvailable) then
              allstates[aura_env.STATE_KEY] =
                  aura_env.shadowfuryTrigger(
                  {
                      duration = aura_env.SHADOWFURY_CAST_TIME,
                      unit = unitTarget
                  }
              )
              return true
          end
      end
  elseif (event == "UNIT_TARGET") then
      local unit = ...

      if (unit == "boss1") then
          local name, _, icon, startTimeMS, endTimeMS, _, _, _, castSpellID = UnitCastingInfo(unit)

          local unitTarget = unit .. "target"

          local duration = aura_env.msToSec(endTimeMS) - aura_env.msToSec(startTimeMS)

          local isShadowfuryCast =
              castSpellID == aura_env.SHADOWFURY_SPELL_ID or castSpellID == aura_env.SHADOWFURY_HIDDEN_SPELL_ID

          if (isShadowfuryCast) then
              local targetExists = UnitExists(unitTarget)
              local isStateAvailable = allstates[aura_env.STATE_KEY] == nil

              if (targetExists and isStateAvailable) then
                  allstates[aura_env.STATE_KEY] =
                      aura_env.shadowfuryTrigger(
                      {
                          duration = duration,
                          unit = unitTarget
                      }
                  )
                  return true
              end
          end
      end
  end
end
