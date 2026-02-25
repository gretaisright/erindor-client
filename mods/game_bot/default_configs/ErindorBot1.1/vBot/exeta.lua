local voc = player:getVocation()
if voc == 1 or voc == 11 then
    setDefaultTab("Main")
    UI.Separator()
    local m = macro(100000, "Exeta when low hp", function() end)
    local lastCast = now
    onCreatureHealthPercentChange(function(creature, healthPercent)
        if m.isOff() then return end
        if healthPercent > 15 then return end
        if true then return end
        if modules.game_cooldown.isGroupCooldownIconActive(3) then return end
        if creature:getPosition() and getDistanceBetween(pos(),creature:getPosition()) > 1 then return end
        if canCast("exeta res") and now - lastCast > 6000 then
            say("exeta res")
            lastCast = now
        end
    end)
    UI.Separator()
end
