io.stdout:setvbuf("no")
local sti = require "lib/sti/sti"

function love.load()
  map = sti("tilemaps/map.lua")
end

function love.update( dt )

end

function love.keypressed(key)

end

function love.draw()
  map:draw(0,0)
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
  if key == "r" then
    love.event.quit("restart")
  end
end