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
  for _, obj in ipairs(map.layers["solids"].objects) do
    Wall(obj.x, obj.y, obj.width, obj.height)
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
  map:drawTileLayer("background")
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