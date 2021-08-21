HPEffect = GameObject:extend()

function HPEffect:new(area, x, y)
  HPEffect.super.new(self, area, x, y)
  self.collide = nil
  self.depth = 30
  self.color = default_color
  self.size = 18
  self.outline = 14
  self.vis = true

  self.timer:tween(0.2, self, {outline=48}, 'in-out-cubic')
  self.timer:after(0.2, function() 
    self.color=hp_color
    self.timer:every(0.05, function() self.vis = not self.vis end, 6)
  end)
  self.timer:after(0.55, function() self:destroy() end)
end

function HPEffect:draw()
  if self.vis then
    draft:circle(self.cx, self.cy, self.outline)
    love.graphics.setColor(self.color)
      draft:rectangle(self.cx, self.cy, self.size*0.4, self.size, "fill")
      draft:rectangle(self.cx, self.cy, self.size, self.size*0.4, "fill")
    love.graphics.setColor(default_color)
  end
end
