require "init"

function love.load()
  --set mode
  resize(2)
  love.graphics.setDefaultFilter("nearest")
  love.graphics.setLineStyle("rough")

  --globals
  input = Input()
  timer = Timer.new()
  camera = Camera()

  --init game
  gotoRoom("Stage")
  input:bind("mouse1", "move")
  input:bind("f3", function() camera:shake(4,60,1) end)
end

function love.update(dt)
  timer:update(dt)
  camera:update(dt)
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