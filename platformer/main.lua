--io.stdout:setvbuf("no")
local sti = require "lib/sti/sti"
local bump = require "lib/bump/bump"
local gamera = require "lib/gamera/gamera"

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
  map = sti("tilemaps/map.lua")
  world = bump.newWorld()
  cam = gamera.new(0,0,2000,2000)

  -- create walls
  for _, obj in ipairs(map.layers["solids"].objects) do
    Wall(obj.x, obj.y, obj.width, obj.height)
  end

  -- create player
  local obj = map.layers["player"].objects[1]
  player = Player(obj.x, obj.y)
end

function love.update( dt )
  local items, len = world:getItems()
  for _, obj in ipairs(items) do
    obj:update(dt)
  end
  cam:setPosition(player.x + player.w/2, player.y + player.h / 2)
end

function love.draw()
  cam:draw(function (l,t,w,h)
    map:drawTileLayer("background")
    drawDebug()
  end)
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
  if key == "r" then
    love.event.quit("restart")
  end

  player:keypressed(key)
end