local precision = {}

precision.name = "PRECISION"

function precision.update(circle, mx, my)
  circle.update(mx, my)
end

function precision.draw(circle)
  circle.draw()
end

function precision.mousepressed(circle, x, y, button)
  local dx = x - circle.x
  local dy = y - circle.y
  
  if button == 1 and dx^2 + dy^2 < circle.radius^2 then
    circle.randomize()
  end
end

return precision