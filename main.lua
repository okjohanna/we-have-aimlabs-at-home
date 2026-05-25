function love.load()
  listOfRectangles = {}
end

function createRect()
  rect = {}
  rect.x = 300
  rect.y = 300
  rect.width = 70 -- (same as rect["width"] = 100)
  rect.height = 50
  rect.speed = 100
  
  -- Insert new rectangle into list
  table.insert(listOfRectangles, rect)
end
  
function love.keypressed(key)
  if key == "space" then
    createRect()
  end
end
  
function love.update(dt)
  -- Iterate through list of rectangles
  for i,v in ipairs(listOfRectangles) do
    v.x = v.x + v.speed * dt
  end
end

function love.draw()
  for i,v in ipairs(listOfRectangles) do
    love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
  end
end