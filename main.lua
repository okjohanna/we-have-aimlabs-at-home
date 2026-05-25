local mouse = {}
local circle = {}

local defaultColor = {1, 0, 0}
local successColor = {0, 1, 0}

local modes = {"REACTIVITY", "PRECISION"}

function love.load()  
  circle.x = 300
  circle.y = 300
  circle.radius = 10
  
  love.graphics.setColor(defaultColor)
end

function love.update(dt)
  mouse.x, mouse.y = love.mouse.getPosition()
  
  local dx = mouse.x - circle.x
  local dy = mouse.y - circle.y
  
  mouseInCircle = dx^2 + dy^2 < circle.radius^2
end

function love.draw()
  if mouseInCircle then
    love.graphics.setColor(successColor)
  end
  love.graphics.circle("fill", circle.x, circle.y, circle.radius)
  
  -- Reset color before drawing text
  love.graphics.setColor(defaultColor)
  love.graphics.print("Press M to change MODE", 0, 15)
  love.graphics.print("Mouse coordinates: " .. mouse.x .. ", " .. mouse.y)
end
  
function love.mousepressed(x, y, button, istouch)
  local dx = x - circle.x
  local dy = y - circle.y
  
  if button == 1 and dx^2 + dy^2 < circle.radius^2 then
    circle.x = math.random(100, 500)
    circle.y = math.random(100, 500)
  end
end
