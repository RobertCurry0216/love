Rock = GameObject:extend()

function Rock:new(area)
  local d = table.random({-1, 1})
  local x, y = d==1 and -48 or gw+48, random(48, gh-48)
  Rock.super.new(self, area, x, y)

  self.collide.canBeShot = true
  self.collide.canHurtPlayer = true

  self.size = 16 + random(-4,4)
  self.vel = random(20,40) * d
  self.spin = random(math.pi/16, math.pi)
  self.ang = random(math.pi)
  self.outline = createIrregularCircle(self.size*0.6)
  self.color = hp_color

  -- stats
  self.hp = 100
  self.damage = 30
end

function Rock:update(dt)
  Rock.super.update(self,dt)
  self.ang = self.ang + self.spin*dt

  self:move(self.x+self.vel*dt, self.y)

  -- check off screen
  if outsideScreen(self.x, self.y, 50) then
    self:destroy()
  end
end

function Rock:draw()
  local points = M.map(self.outline, function(v, i)
    return i%2 == 0 and v+self.cy or v+self.cx
  end)
  pushRotate(self.cx, self.cy, self.ang)
  love.graphics.setColor(self.color)

  love.graphics.polygon("line", points)

  love.graphics.setColor(default_color)
  love.graphics.pop()
end

function Rock:filter(other)
  if other.collide.canPush then
    return "push"
  end
  return Rock.super.filter(self, other)
end

function Rock:die()
  self:destroy()
  self.area:addObject( "ProjectileDeathEffect",self.cx, self.cy, self.size*1.5, hp_color)
end

function Rock:hit(damage)
  self.hp = self.hp - damage
  if self.hp <= 0 then
    self:die()
  else
    self.color = default_color
    self.timer:after(0.2, function() self.color = hp_color end)
  end
end

function Rock:attack(other)
  other:hit(self.damage)
end