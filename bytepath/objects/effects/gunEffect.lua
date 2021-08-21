GunEffect = GameObject:extend()

function GunEffect:new(area, x, y, c)
  GunEffect.super.new(self, area, x, y)
  self.collide = nil
  self.depth = 30
  self.color = c or default_color
  self.size = 20
  self.vis = true

  self.timer:tween(0.3, self, {size=60}, 'in-out-cubic')
  self.timer:after(0.3, function() 
    self.color=default_color
    self.timer:every(0.05, function() self.vis = not self.vis end, 6)
  end)
  self.timer:after(0.65, function() self:destroy() end)
end

function GunEffect:draw()
  if self.vis then
    love.graphics.setColor(self.color)
    draft:rhombus(self.x, self.y, self.size+4, self.size+4)
    love.graphics.setColor(default_color)
    draft:rhombus(self.x, self.y, self.size-4, self.size-4)
  end
end
