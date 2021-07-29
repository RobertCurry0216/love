local Player = require "actors.player"
local Wall = require "actors.wall"
local Box = require "actors.box"

function love.load()
  objects = {}
  table.insert(objects, Player(100, 100))
  table.insert(objects, Wall(250, 200))
  table.insert(objects, Box(200, 100))
  table.insert(objects, Box(250, 100))
  table.insert(objects, Box(200, 300))
  table.insert(objects, Box(240, 200))
end

function love.update( dt )
  for i, v in ipairs(objects) do
    v:update(dt)
  end

  local limit = 100
  local loop = true

  while loop and limit > 0 do
    loop = false
    limit = limit + 1

    for i=1,#objects-1 do
      for j=i+1,#objects do
        if objects[i]:resolveCollision(objects[j]) then
          loop = true
        end
      end
    end
  end
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end

function love.draw()
  for i, v in ipairs(objects) do
    v:draw()
  end
end