local Player = require "actors.player"
local Wall = require "actors.wall"

function love.load()
  player = Player(100, 100)
  wall = Wall(250, 200)
end

function love.update( dt )
  player:update(dt)
  wall:update(dt)
  player:resolveCollision(wall)
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end

function love.draw()
  local gfx = love.graphics
  player:draw()
  wall:draw()
end