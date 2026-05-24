function love.load()
  x = 50
end
  
function love.update(dt) -- using delta time (dt) to move the rectangle at the same speed on all computers
  x = x + 15 * dt -- ~update~ the value of x, making the rectangle move
end

function love.draw()
  love.graphics.rectangle('line', x, 50, 200, 120) -- (X, Y, W, H)
end