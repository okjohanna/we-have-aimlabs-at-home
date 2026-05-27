local circle = require("src.circle")
local mainFont = love.graphics.newFont("src/assets/Jersey10-Regular.ttf", 24)
local mouse = {}

local modes = {
  require("src.modes.reactivity"),
  require("src.modes.precision"),
  require("src.modes.precisiontwo")
}
local currentModeIndex = 1
local currentMode = modes[currentModeIndex]

function love.load()
  love.window.setTitle("We Have Aimlabs at Home. The Aimlabs at Home:")
  circle.init()
  if currentMode.init then
    currentMode.init(circle)
  end
end

function love.update(dt)
  mouse.x, mouse.y = love.mouse.getPosition()
  currentMode.update(circle, mouse.x, mouse.y, dt)
end

function love.draw()
  currentMode.draw(circle)
  
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(mainFont)
  love.graphics.print(
    {
      {1,1,1}, "Press ",
      {0,1,0}, "M",
      {1,1,1}, " to change Mode: ",
      {0,1,0}, currentMode.name
    },
    15, 10
  )
  love.graphics.print("Mouse coordinates: " .. mouse.x .. ", " .. mouse.y, 15, 35)
  
  if currentMode.getStats then
    local stats = currentMode.getStats()
    if stats then
      love.graphics.setColor(1, 1, 1)
      love.graphics.print(stats, 15, 60)
    end
  end
end

function love.mousepressed(x, y, button, istouch)
  currentMode.mousepressed(circle, x, y, button)
end

function love.keypressed(key)
  if key == "m" then
    currentModeIndex = currentModeIndex % #modes + 1
    currentMode = modes[currentModeIndex]
    if currentMode.init then
      currentMode.init(circle)
    end
  end
end