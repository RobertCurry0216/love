require "init"

function love.load()
  c = HyperCircle(400, 300, 50, 75)
end

function love.update(dt)

end

function love.draw()
  c:draw()
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
  if key == "r" then
    love.event.quit("restart")
  end
end