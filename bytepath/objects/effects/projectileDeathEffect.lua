local ProjectileDeathEffect = GameObject:extend()

function ProjectileDeathEffect:new(area, x, y, s, c)
  ProjectileDeathEffect.super.new(self, area, x-s/2, y-s/2)
  self.collidable = false
  self.color = default_color
  self.size = s
  self.timer:after(0.1, function() self.color=c end)
  self.timer:after(0.25, function() self:destroy() end)
end

function ProjectileDeathEffect:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.x, self.y, self.size, self.size)
  love.graphics.setColor(default_color)
end

return ProjectileDeathEffect