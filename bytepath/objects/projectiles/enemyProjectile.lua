EnemyProjectile = GameObject:extend()

function EnemyProjectile:new(area, x, y, tx, ty, c)
  EnemyProjectile.super.new(self,area,x-2.5,y-2.5)

  self.collide.canHurtPlayer = true

  self.size = 5
  self.dir = V.angleTo(tx - x, ty - y)
  self.color = c or hp_color
  self.dx, self.dy = V.fromPolar(self.dir,250)
  self.damage = 10
end

function EnemyProjectile:update(dt)
  EnemyProjectile.super.update(self, dt)
  local cols, l = self:move(self.x+self.dx*dt, self.y+self.dy*dt)

  if l > 0 then
    for _, col in ipairs(cols) do
      if col.other.collide.canHurtEnemy then
        col.other:attack(self)
      end
    end
  end

  if outsideScreen(self.cx, self.cy) then
    self:die()
  end 
end

function EnemyProjectile:draw()
  pushRotate(self.cx, self.cy, self.dir)
  love.graphics.setLineWidth(self.size*0.6)
  love.graphics.setColor(self.color)
    love.graphics.line(self.cx-self.size*1.2, self.cy, self.cx+self.size*1.2, self.cy)
  love.graphics.setColor(default_color)
  love.graphics.setLineWidth(1)
  love.graphics.pop()
end

function EnemyProjectile:die()
  self:destroy()
  self.area:addObject("ProjectileDeathEffect", self.cx, self.cy, self.size*2, self.color)
end

function EnemyProjectile:attack(other)
  other:hit(self.damage, {color=hp_color})
  self:die()
end

function EnemyProjectile:hit(damage)
  self:die()
end