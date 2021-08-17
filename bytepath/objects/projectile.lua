local Projectile = GameObject:extend()

function Projectile:new(area, x, y, d)
  Projectile.super.new(self,area,x-2.5,y-2.5)
  self.size = 5
  self.dx, self.dy = V.fromPolar(d,250)
end

function Projectile:update(dt)
  Projectile.super.update(self, dt)
  self:move(self.x+self.dx*dt, self.y+self.dy*dt)

  if outsideScreen(self:getCenter()) then
    self:destroy()
  end 
end

function Projectile:draw()
  local x,y = self:getCenter()
  love.graphics.circle("line", x, y, self.size*0.7)
end

function Projectile:destroy()
  Projectile.super.destroy(self)
  local cx, cy = self:getCenter()
  self.area:addObject("ProjectileDeathEffect", cx, cy, self.size*2, hp_color)
end

return Projectile