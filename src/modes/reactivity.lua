local reactivity = {}

reactivity.name = "REACTIVITY"

local startTime = nil
local lastReaction = nil
local bestReaction = nil

function reactivity.init(circle)
  circle.randomize()
  startTime = love.timer.getTime()
end

function reactivity.update(circle, mx, my)
  circle.update(mx, my)
end

function reactivity.draw(circle)
  circle.draw()
end

function reactivity.mousepressed(circle, x, y, button)
  local dx = x - circle.x
  local dy = y - circle.y
  if button == 1 and dx^2 + dy^2 < circle.radius^2 then
    lastReaction = love.timer.getTime() - startTime
    if not bestReaction or lastReaction < bestReaction then
      bestReaction = lastReaction
    end
    circle.randomize()
    startTime = love.timer.getTime()
  end
end

function reactivity.getStats()
  if lastReaction then
    local stats = {
      {1,1,1}, "Reaction time: ", {0,1,0}, string.format("%.2f s", lastReaction),
      {1,1,1}, "\nBest: ", {0,1,0}, string.format("%.2f s", bestReaction)
    }
    if bestReaction < 0.40 then
      table.insert(stats, {1,1,0})
      table.insert(stats, "\nInsane reflexes!!")
    end
    return stats
  end
end

return reactivity