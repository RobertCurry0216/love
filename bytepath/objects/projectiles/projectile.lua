Projectile = GameObject:extend()

function Projectile:new(area, x, y, d, c)
  Projectile.super.new(self,area,x-2.5,y-2.5)
  self.collide.canHurtEnemy = true
  self.size = 5
  self.dir = d
  self.color = c or hp_color
  self.dx, self.dy = V.fromPolar(d,250)
  self.damage = 100

  self.attackType = "normal"
  self.target = nil
end

function Projectile:update(dt)
  Projectile.super.update(self, dt)

  if self.target and self.target.dead then self.target = nil end

  if self.attackType == "homing" and not self.target then
    local items, _ = self.area.world:getItems()
    inRange = M.select(items, 
      function(obj, i)
        return obj.type == "enemy" and V.dist(self.x, self.y, obj.x, obj.y) < 200
      end
    )
    self.target = table.random(inRange)
  end

  if self.target then
    self.dir = steer(self.cx, self.cy, self.target.cx, self.target.cy, self.dir)
    self.dx, self.dy = V.fromPolar(self.dir,250)
  end

  local cols, l = self:move(self.x+self.dx*dt, self.y+self.dy*dt)
  
  if outsideScreen(self.cx, self.cy) then
    self:die()
  end 
end

function Projectile:attack(other)
  other:hit(self.damage)
  self:die()
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
