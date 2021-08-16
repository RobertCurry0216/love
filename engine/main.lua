require "init"

function love.load()
  input = Input()
  timer = Timer.new()
  gotoRoom("CircleRoom")
  input:bind("mouse1", "move")
  input:bind("f1", function() gotoRoom("CircleRoom") end)
  input:bind("f2", function() gotoRoom("RectangleRoom") end)
  input:bind("f3", function() gotoRoom("PolygonRoom") end)
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