require "init"

function love.load()
  input = Input()
  timer = Timer.new()
  input:bind("mouse1", "move")
  input:bind("mouse2", "move")
  c = HyperCircle(400, 300, 50, 75)
end

function love.update(dt)
  timer:update(dt)
  c:update(dt)
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