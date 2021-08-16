local Stage = Room:extend()

function Stage:new()
  self.area = Area(self)
  self.main_canvas = love.graphics.newCanvas(gw, gh)
  self.area:addObject("HyperCircle", gw/2, gh/2, 30, 45)
end

function Stage:update(dt)
  camera.smoother = Camera.smooth.damped(5)
  camera:lockPosition(dt, gw/2, gh/2)
  self.area:update(dt)
end

function Stage:draw()
  love.graphics.setCanvas(self.main_canvas)
  love.graphics.clear()
    camera:attach(0,0,gw,gh)
    self.area:draw()
    camera:detach()
  love.graphics.setCanvas()

  love.graphics.setColor(1,1,1,1)
  love.graphics.setBlendMode("alpha", "premultiplied")
  love.graphics.draw(self.main_canvas, 0,0,0,sx,sy)
  love.graphics.setBlendMode("alpha")
end

return Stage