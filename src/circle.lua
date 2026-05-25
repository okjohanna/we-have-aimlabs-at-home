local circle = {}

local defaultColor = {1, 0, 0}
local successColor = {0, 1, 0}

function circle.init()
  circle.x = 300
  circle.y = 300
  circle.radius = 10
  circle.isHovered = false
end

function circle.update(mx, my)
  local dx = mx - circle.x
  local dy = my - circle.y
  circle.isHovered = dx^2 + dy^2 < circle.radius^2
end

function circle.randomize()
  circle.x = math.random(30, 760)
  circle.y = math.random(67, 580)
end

function circle.draw()
  if circle.isHovered then
    love.graphics.setColor(successColor)
  else
    love.graphics.setColor(defaultColor)
  end
  love.graphics.circle("fill", circle.x, circle.y, circle.radius)
end

return circle