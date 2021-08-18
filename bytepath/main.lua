require "init"

function love.load()
  --set mode
  resize(2)
  love.graphics.setDefaultFilter("nearest")
  love.graphics.setLineStyle("rough")

  --globals
  input = Input()
  timer = Timer.new()
  camera = Camera(gw/2, gh/2)

  --controls
  input:bind("left", "left")
  input:bind("right", "right")

  --init game
  gotoRoom("Stage")
  input:bind("f3", function() camera:shake(4,60,1) end)
end

function love.update(dt)
  -- slow down time
  dt = dt*slow_amount

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

  if flash_frames > 0 then
    flash_frames = flash_frames - 1
    love.graphics.setColor(background_color)
    love.graphics.rectangle("fill", 0,0,gw*sx,gh*sy)
    love.graphics.setColor(1,1,1,1)
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