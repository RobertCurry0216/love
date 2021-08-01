io.stdout:setvbuf("no")
local sti = require "lib/sti/sti"
local inspect = require "lib/inspect"
local Player = require "actors/player"

-- helper function
local function drawBox(x,y,r,g,b)
  r = r and r or 1
  g = g and g or 0
  b = b and b or 0
  love.graphics.setColor(r,g,b,0.1)
  love.graphics.rectangle("fill", x, y, 16, 16)
  love.graphics.setColor(r,g,b)
  love.graphics.rectangle("line", x, y, 16, 16)
  love.graphics.setColor(1,1,1)
end

function drawDebug()
  for y=1,map.height do
    for x=1,map.width do
      local tile = map.layers["solids"].data[y][x]
      if tile then
        drawBox((x-1) * tile.width, (y-1) * tile.height)
      end
    end
  end

  for y=1,map.height do
    for x=1,map.width do
      local tile = map.layers["scenery"].data[y][x]
      if tile then
        drawBox((x-1) * tile.width, (y-1) * tile.height, 0, 0, 1)
      end
    end
  end

  local player = map.layers["player"].objects[1]
  drawBox(player.x, player.y, 0, 1, 0)
end

function love.load()
  player = Player(10, 10)
  map = sti("tilemaps/map.lua")
end

function love.update( dt )

end

function love.keypressed(key)

end

function love.draw()
  map:draw(0,0)
  player:draw()
  drawDebug()
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
  if key == "r" then
    love.event.quit("restart")
  end
end