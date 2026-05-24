function love.load()
  -- Set random seed
  math.randomseed(os.time())
  
  -- Figure initial position
  x = 300
  y = 300
  
  -- Is able to move
  move = true
  
  -- Fruits table from tutorial
  fruits = {"apple", "banana", "plum"}
  table.insert(fruits, "pear")
  
  for i,v in ipairs(fruits) do
    print(i, v)
  end
  
  -- Names for the worm
  names = {"Jim", "Bob", "Natalie", "Wormillion"}
  worm_name = names[math.random(#names)]
end
  
function love.update(dt) -- Add delta time (dt) to move the rectangle at the same speed on all computers
  if love.keyboard.isDown("right") then
    x = x + 200 * dt -- ~Update~ the value of x, making the rectangle move
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
  -- Prints all the fruit in fruits under one another
  for i,fruit in ipairs(fruits) do
    love.graphics.print(fruit, 100, 100 + 50 * i)
  end
  
  love.graphics.print(worm_name, (x + 25), (y - 5))
  
  -- [ --
  -- love.graphics.print(names[math.random(#names)], (x + 25), (y - 5))
  -- Keeps blasting through all the names. Looked fitting for a slots machine. 
  -- ] --
  
  love.graphics.circle('fill', x, y, 15, 15) -- (X, Y, W, H)
end