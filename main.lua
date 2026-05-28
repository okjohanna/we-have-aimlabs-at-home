local mainFont = love.graphics.newFont("src/assets/Jersey10-Regular.ttf", 24)
local circle = require("src.circle")
local mouse = {}

local circleSizes = {
  { name = "small", radius = 8 },
  { name = "medium", radius = 16 },
  { name = "large", radius = 22 }
}
local currentSizeIndex = 1

local modes = {
  require("src.modes.reactivity"),
  require("src.modes.precision"),
  require("src.modes.precisiontwo")
}
local currentModeIndex = 1
local currentMode = modes[currentModeIndex]

function love.load()
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
  
  if currentMode.getStats then
    local stats = currentMode.getStats()
    if stats then
      love.graphics.setColor(1, 1, 1)
      love.graphics.print(stats, 15, 38)
    end
  end
  
  local W, H = love.graphics.getDimensions()
  love.graphics.print(
    {
      {1,1,1}, "Press ",
      {0,1,0}, "SPACE",
      {1,1,1}, " to change circle size: ",
      {0,1,0}, circleSizes[currentSizeIndex].name
    },
    15, H - 35
  )
  
  love.graphics.print(
    {
      {1,1,1}, "Press ",
      {0,1,0}, "Q",
      {1,1,1}, " to Quit",
    },
    W - 140, H - 35
  )
  
  love.graphics.setColor(1,1,1, 0.3)
  love.graphics.print("Mouse coordinates: " .. mouse.x .. ", " .. mouse.y, W - 260, 10)
end

function love.mousepressed(x, y, button, istouch)
  currentMode.mousepressed(circle, x, y, button)
end

function love.keypressed(key)
  if key == 'm' then
    currentModeIndex = currentModeIndex % #modes + 1
    currentMode = modes[currentModeIndex]
    if currentMode.init then
      currentMode.init(circle)
    end
  end
  
  if key == 'space' then
    currentSizeIndex = currentSizeIndex % #circleSizes + 1
    circle.radius = circleSizes[currentSizeIndex].radius
  end
  
  if key == 'q' then
    love.event.quit()
  end
  
  if currentMode.keypressed then
    currentMode.keypressed(circle, key)
  end
end