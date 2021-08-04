--io.stdout:setvbuf("no")
local sti = require "lib/sti/sti"
local bump = require "lib/bump/bump"

local inspect = require "lib/inspect"
local Player = require "actors/player"
local Wall = require "actors/wall"

-- debug stuff
function drawDebug()
  local boxes, len = world:getItems()
  for _, w in ipairs(boxes) do
    w:drawCollisionBox()
  end
end

-- main functions

function love.load()
  --player = Player(10, 10)
  map = sti("tilemaps/map.lua")
  world = bump.newWorld()

  -- create walls
  for y=1,map.height do
    for x=1,map.width do
      local tile = map.layers["solids"].data[y][x]
      if tile then
        Wall((x-1) * tile.width, (y-1) * tile.height, tile.width, tile.height)
      end
    end
  end


  -- create walls
  for _, obj in ipairs(map.layers["player"].objects) do
    Player(obj.x, obj.y, obj.width, obj.height)
  end
end

function love.update( dt )
  local items, len = world:getItems()
  for _, obj in ipairs(items) do
    obj:update(dt)
  end
end

function love.draw()
  map:draw(0,0)
  --player:draw()
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