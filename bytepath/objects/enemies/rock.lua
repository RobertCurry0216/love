Rock = GameObject:extend()

function Rock:new(area)
  local d = table.random({-1, 1})
  local x, y = d==1 and -48 or gw+48, random(48, gh-48)
  Rock.super.new(self, area, x, y)

  --self.collide

  self.size = 16
  self.vel = random(20,40) * d
  self.spin = random(math.pi/16, math.pi)
  self.ang = random(math.pi)

  self.outline = createIrregularCircle(self.size*0.6)
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
  self:drawCollider()
  local points = M.map(self.outline, function(v, i)
    return i%2 == 0 and v+self.cy or v+self.cx
  end)
  pushRotate(self.cx, self.cy, self.ang)
  love.graphics.setColor(hp_color)

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