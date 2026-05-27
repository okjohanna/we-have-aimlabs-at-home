local circle = require("src.circle")
local modes = {
  require("src.modes.reactivity"),
  require("src.modes.precision"),
  require("src.modes.precisiontwo")
}
local currentModeIndex = 1
local currentMode = modes[currentModeIndex]

local mouse = {}

function love.load()
  love.window.setTitle("We Have Aimlabs at Home. The Aimlabs at Home:")
  circle.init()
end

function love.update(dt)
  mouse.x, mouse.y = love.mouse.getPosition()
  currentMode.update(circle, mouse.x, mouse.y, dt)
end

function love.draw()
  currentMode.draw(circle)

  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Press M to change Mode: " .. currentMode.name, 0, 0)
  love.graphics.print("Mouse coordinates: " .. mouse.x .. ", " .. mouse.y, 0, 15)
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