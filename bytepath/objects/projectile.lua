Projectile = GameObject:extend()

function Projectile:new(area, x, y, d)
  Projectile.super.new(self,area,x-2.5,y-2.5)
  self.size = 5
  self.dx, self.dy = V.fromPolar(d,250)
end

function Projectile:update(dt)
  Projectile.super.update(self, dt)
  self:move(self.x+self.dx*dt, self.y+self.dy*dt)

  if outsideScreen(self.cx, self.cy) then
    self:die()
  end 
end

function Projectile:draw()
  love.graphics.circle("line", self.cx, self.cy, self.size*0.7)
end

function Projectile:die()
  self:destroy()
  self.area:addObject("ProjectileDeathEffect", self.cx, self.cy, self.size*2, hp_color)
end
