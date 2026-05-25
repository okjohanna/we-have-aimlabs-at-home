local precision = {}

precision.name = "PRECISION"

function precision.init(circle)
  local speed = 100
  local angle = math.random() * math.pi * 2  -- Random direction in radians
  circle.vx = math.cos(angle) * speed
  circle.vy = math.sin(angle) * speed
end

function precision.update(circle, mx, my, dt)
  circle.update(mx, my)

  circle.x = circle.x + circle.vx * dt
  circle.y = circle.y + circle.vy * dt

  -- Bounce off boundaries
  if circle.x < 30 or circle.x > 760 then
    circle.vx = -circle.vx
    circle.x = math.max(30, math.min(760, circle.x))  -- Clamp to avoid sticking
  end
  if circle.y < 67 or circle.y > 580 then
    circle.vy = -circle.vy
    circle.y = math.max(67, math.min(580, circle.y))
  end
end

function precision.draw(circle)
  circle.draw()
end

function precision.mousepressed(circle, x, y, button)
  -- nothing for now
end

return precision