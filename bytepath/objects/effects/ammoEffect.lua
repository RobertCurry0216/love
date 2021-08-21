AmmoEffect = GameObject:extend()

function AmmoEffect:new(area, x, y)
  AmmoEffect.super.new(self, area, x, y)
  self.collide = nil
  self.depth = 30
  self.color = default_color
  self.size = 8
  self.timer:after(0.1, function() self.color=ammo_color end)
  self.timer:after(0.25, function() self:destroy() end)
end

function AmmoEffect:draw()
  love.graphics.setColor(self.color)
  draft:rhombus(self.x, self.y, self.size, self.size, "fill")
  love.graphics.setColor(default_color)
end
