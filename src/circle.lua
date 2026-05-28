local circle = {}

local defaultColor = {1, 0, 0}
local successColor = {0, 1, 0}

local W, H = love.graphics.getDimensions()

function circle.init()
  circle.x = W/2
  circle.y = H/2
  circle.radius = 10
  circle.isHovered = false
end

function circle.update(mx, my)
  local dx = mx - circle.x
  local dy = my - circle.y
  circle.isHovered = dx^2 + dy^2 < circle.radius^2
end

function circle.randomize()
  circle.x = math.random(W/4, W-50)
  circle.y = math.random(H/4, H-50)
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