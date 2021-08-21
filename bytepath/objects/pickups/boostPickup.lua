BoostPickup = Pickup:extend()

function BoostPickup:new(area)
  local d = table.random({-1, 1})
  local x, y = d==1 and -48 or gw+48, random(48, gh-48)
  BoostPickup.super.new(self, area, x, y)

  self.size = 12
  self.vel = random(20,40) * d
  self.spin = random(math.pi/16, math.pi)*-d
  self.ang = random(math.pi)

  self.gain = 20
end

function BoostPickup:update(dt)
  BoostPickup.super.update(self,dt)
  self.ang = self.ang + self.spin*dt

  self:move(self.x+self.vel*dt, self.y)

  -- check off screen
  if outsideScreen(self.x, self.y, 50) then
    self:destroy()
  end
end

function BoostPickup:draw()
  pushRotate(self.cx, self.cy, self.ang)
  love.graphics.setColor(boost_color)
    draft:rhombus(self.cx, self.cy, self.size*1.5, self.size*1.5)
    draft:rhombus(self.cx, self.cy, self.size*0.5, self.size*0.5, "fill")
  love.graphics.setColor(default_color)
  love.graphics.pop()
end

function BoostPickup:onPickup(other)
  BoostPickup.super.onPickup(self, other)
  -- give boost
  other:addResource("boost", self.gain)
  -- explode
  self.area:addObject("BoostEffect", self.cx, self.cy)
  text(
    self.area,
    self.cx + random(-self.size, self.size),
    self.cy + random(-self.size, self.size),
    "+BOOST",
    {color=boost_color}
)
  self:destroy()
end