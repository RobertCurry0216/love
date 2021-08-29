require "init"

function love.load()
  input = Input()
  timer = Timer.new()
  gotoRoom("TestRoom")

  input:bind("up", "up")
  input:bind("down", "down")
end

function love.update(dt)
  timer:update(dt)
  if current_room then
    current_room:update(dt)
  end
end

function love.draw()
  if current_room then
    current_room:draw(dt)
  end
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
  if key == "r" then
    love.event.quit("restart")
  end
end