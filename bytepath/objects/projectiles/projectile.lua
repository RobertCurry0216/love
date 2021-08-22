Projectile = GameObject:extend()

function Projectile:new(area, x, y, d, c)
  Projectile.super.new(self,area,x-2.5,y-2.5)
  self.size = 5
  self.dir = d
  self.color = c or hp_color
  self.dx, self.dy = V.fromPolar(d,250)
  self.damage = 100
end

function Projectile:update(dt)
  Projectile.super.update(self, dt)
  local cols, l = self:move(self.x+self.dx*dt, self.y+self.dy*dt)

  if l > 0 then
    for _, col in ipairs(cols) do
      if col.other.collide.canBeShot and col.other.hit then
        col.other:hit(self.damage)
        self:die()
      end
    end
  end

  if outsideScreen(self.cx, self.cy) then
    self:die()
  end 
end

function Projectile:draw()
  pushRotate(self.cx, self.cy, self.dir)
  love.graphics.setLineWidth(self.size*0.6)
  love.graphics.setColor(self.color)
  love.graphics.line(self.cx, self.cy, self.cx+self.size*1.2, self.cy)
  love.graphics.setColor(default_color)
  love.graphics.line(self.cx-self.size*1.2, self.cy, self.cx, self.cy)
  love.graphics.setLineWidth(1)
  love.graphics.pop()
end

function Projectile:die()
  self:destroy()
  self.area:addObject("ProjectileDeathEffect", self.cx, self.cy, self.size*2, self.color)
end
