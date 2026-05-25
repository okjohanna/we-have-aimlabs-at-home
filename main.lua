function love.load()  
  tick = require "tick"
  
  drawRect = false
  
  tick.delay(function() drawRect = true end, 2)
end

function love.update(dt)
  tick.update(dt)
end

function love.draw()
  if drawRect then
    love.graphics.rectangle("fill", 100, 100, 50, 30)
  end
end