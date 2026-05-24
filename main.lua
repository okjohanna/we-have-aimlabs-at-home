function love.draw()
  a = 3
  b = 5
  
  love.graphics.print((a + b), 100, 100)
  
  love.graphics.ellipse('line', 200, 200, 50, 50)
  love.graphics.rectangle('fill', 200, 100, 80, 100)
end