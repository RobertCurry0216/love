local Stage = Room:extend()

function Stage:new()
  self.area = Area(self)
  self.main_canvas = love.graphics.newCanvas(gw, gh)
  self.area:addObject("HyperCircle", gw/2, gh/2, 30, 45)
end

function Stage:update(dt)
  self.area:update(dt)
end

function Stage:draw()
  love.graphics.setCanvas(self.main_canvas)
  love.graphics.clear()
    self.area:draw()
  love.graphics.setCanvas()

  love.graphics.setColor(1,1,1,1)
  love.graphics.setBlendMode("alpha", "premultiplied")
  love.graphics.draw(self.main_canvas, 0,0,0,sx,sy)
  love.graphics.setBlendMode("alpha")
end

return Stage