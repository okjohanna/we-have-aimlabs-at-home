local reactivity = {}

reactivity.name = "REACTIVITY"

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
    circle.randomize()
  end
end

return reactivity