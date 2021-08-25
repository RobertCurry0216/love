Stage = Room:extend()

function Stage:new()
  self.main_canvas = love.graphics.newCanvas(gw, gh)
  self.area = Area(self)
  self.area:addCollisionWorld()
  self.player = self.area:addObject("Player", gw/2, gh/2)
  self.director = Director(self)
end

function Stage:update(dt)
  camera.smoother = Camera.smooth.damped(5)
  camera:lockPosition(dt, gw/2, gh/2)
  self.director:update(dt)
  self.area:update(dt)
end

function Stage:draw()
  love.graphics.setCanvas(self.main_canvas)
  love.graphics.clear(background_color)
    camera:attach(0,0,gw,gh)
    self.area:draw()
    camera:detach()
  love.graphics.setCanvas()

  love.graphics.setColor(1,1,1,1)
  love.graphics.setBlendMode("alpha", "premultiplied")
  love.graphics.draw(self.main_canvas, 0,0,0,sx,sy)
  love.graphics.setBlendMode("alpha")
end
