BoostEffect = GameObject:extend()

function BoostEffect:new(area, x, y)
  BoostEffect.super.new(self, area, x, y)
  self.collidable = false
  self.depth = 30
  self.color = default_color
  self.size = 14
  self.outline = 14
  self.vis = true

  self.timer:tween(0.2, self, {outline=48}, 'in-out-cubic')
  self.timer:after(0.2, function() 
    self.color=boost_color
    self.timer:every(0.05, function() self.vis = not self.vis end, 6)
  end)
  self.timer:after(0.55, function() self:destroy() end)
end

function BoostEffect:draw()
  if self.vis then
    love.graphics.setColor(self.color)
    draft:rhombus(self.x, self.y, self.size, self.size, "fill")
    draft:rhombus(self.x, self.y, self.outline, self.outline)
    love.graphics.setColor(default_color)
  end
end
