local precision = {}

precision.name = "TRACKING 2"

local speed = 85
local direction = 1 -- 1=right, -1=left

function precision.init(circle)
end

function precision.update(circle, mx, my, dt)
  circle.update(mx, my)
  
  local W, H = love.graphics.getDimensions()
  local margin = 100
  
  circle.y = H/2
  
  if circle.x > W - margin then
    direction = -1
  elseif circle.x < margin then
    direction = 1
  end
  
  circle.x = circle.x + speed * direction * dt
end

function precision.draw(circle)
  circle.draw()
end

function precision.mousepressed(circle, x, y, button)
end

return precision