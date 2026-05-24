function love.load()
  x = 300
  y = 300
  move = true
end
  
function love.update(dt) -- using delta time (dt) to move the rectangle at the same speed on all computers
  if love.keyboard.isDown("right") then
    x = x + 200 * dt -- ~update~ the value of x, making the rectangle move
  end
  
  if love.keyboard.isDown("left") then
    x = x - 200 * dt
  end
  
  if love.keyboard.isDown("up") then
    y = y - 200 * dt
  end
  
  if love.keyboard.isDown("down") then
    y = y + 200 * dt
  end
end

function love.draw()
  love.graphics.rectangle('fill', x, y, 120, 120) -- (X, Y, W, H)
end