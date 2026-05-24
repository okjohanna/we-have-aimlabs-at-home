function love.load()
  x = 50
  move = true
end
  
function love.update(dt) -- using delta time (dt) to move the rectangle at the same speed on all computers
  if (x < 500 and move == true) then
    x = x + 100 * dt -- ~update~ the value of x, making the rectangle move
  end
end

function love.draw()
  love.graphics.rectangle('line', x, 50, 200, 120) -- (X, Y, W, H)
end