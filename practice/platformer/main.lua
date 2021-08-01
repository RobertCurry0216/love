Player = require "actors.player"
Wall = require "actors.wall"
Box = require "actors.box"

function love.load()
  player = Player(100, 100)
    box = Box(400, 150)

    objects = {}
    table.insert(objects, player)
    table.insert(objects, box)

    walls = {}
    map = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
        {1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
    }

    for i,v in ipairs(map) do
        for j,w in ipairs(v) do
            if w == 1 then
                table.insert(walls, Wall((j-1)*50, (i-1)*50))
            end
        end
    end
end

function love.update( dt )
  for _, v in ipairs(objects) do
    v:update(dt)
  end

  for _, w in ipairs(walls) do
    w:update(dt)
  end

  local limit = 100
  local loop = true

  while loop and (limit > 0) do
    loop = false
    limit = limit - 1

    for i=1,#objects-1 do
      for j=i+1,#objects do
          if objects[i]:resolveCollision(objects[j]) then
              loop = true
          end
      end
    end

    for _,wall in ipairs(walls) do
      for _,object in ipairs(objects) do
        if object:resolveCollision(wall) then
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
  player:keypressed(key)
end

function love.draw()
  for _, v in ipairs(objects) do
    v:draw()
  end

  for _, w in ipairs(walls) do
    w:draw()
  end
end