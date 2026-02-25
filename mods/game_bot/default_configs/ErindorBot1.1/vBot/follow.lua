-- tools tab
setDefaultTab("Main")

addTextEdit("TxtEdit", storage.fName or "follow name", function(widget, text)
  storage.fName = text
end)
--------------------------
local lastPos = nil
follow = macro(200, "Follow", function()
  local leader = getCreatureByName(storage.fName)
  local target = g_game.getAttackingCreature()
  if leader then
    if target and lastPos then
      return player:autoWalk(lastPos)
    end
    if not g_game.getFollowingCreature() then
      return g_game.follow(leader)
    end
  elseif lastPos then
    player:autoWalk(lastPos)
  end
end)

onCreaturePositionChange(function(creature, newPos, oldPos)
  local leader = getCreatureByName(storage.fName)
  if leader ~= creature or not newPos then return end
  lastPos = newPos
end)
follow = addIcon("follow", {item =7178, text = "Follow",  }, follow )
