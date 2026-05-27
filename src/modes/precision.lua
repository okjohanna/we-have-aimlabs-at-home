local precision = {}

precision.name = "TRACKING 1"

local speed = 50
local turnSpeed = 2
local changeInterval = 1

function precision.init(circle)
  circle.angle = math.random() * math.pi * 2
  circle.targetAngle = circle.angle
  circle.changeTimer = 0
end

function precision.update(circle, mx, my, dt)
  circle.update(mx, my)

  -- Pick a new target angle periodically
  circle.changeTimer = circle.changeTimer + dt
  if circle.changeTimer >= changeInterval then
    circle.targetAngle = math.random() * math.pi * 2
    circle.changeTimer = 0
  end

  -- Smoothly steer toward target angle
  circle.angle = circle.angle + (circle.targetAngle - circle.angle) * turnSpeed * dt

  -- Move
  circle.x = circle.x + math.cos(circle.angle) * speed * dt
  circle.y = circle.y + math.sin(circle.angle) * speed * dt

  -- Steer away from walls instead of bouncing
  --[[


  -- Hard clamp just in case it clips a boundary
  circle.x = math.max(67, math.min(760, circle.x))
  circle.y = math.max(67, math.min(580, circle.y))
  ]]--
  
  local W, H = love.graphics.getDimensions()
  local margin = 100
  if circle.x < margin then
    circle.targetAngle = 0  -- steer right
    circle.changeTimer = 0
  elseif circle.x > W - margin then
    circle.targetAngle = math.pi  -- steer left
    circle.changeTimer = 0
  end
  if circle.y < margin then
    circle.targetAngle = math.pi / 2  -- steer down
    circle.changeTimer = 0
  elseif circle.y > H - margin then
    circle.targetAngle = -math.pi / 2  -- steer up
    circle.changeTimer = 0
  end
  
  
end

function precision.draw(circle)
  circle.draw()
end

function precision.mousepressed(circle, x, y, button)
end

return precision