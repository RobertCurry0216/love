HPPickup = Pickup:extend()

function HPPickup:new(area)
  local d = table.random({-1, 1})
  local x, y = d==1 and -48 or gw+48, random(48, gh-48)
  HPPickup.super.new(self, area, x, y)

  self.size = 18
  self.vel = random(20,40) * d
  self.spin = random(math.pi/16, math.pi)*-d
  self.ang = random(math.pi)

  self.gain = 25
end

function HPPickup:update(dt)
  HPPickup.super.update(self,dt)

  self:move(self.x+self.vel*dt, self.y)

  -- check off screen
  if outsideScreen(self.x, self.y, 50) then
    self:destroy()
  end
end

function HPPickup:draw()
  draft:circle(self.cx, self.cy, self.size*1.5)
  love.graphics.setColor(hp_color)
    draft:rectangle(self.cx, self.cy, self.size*0.3, self.size*0.85, "fill")
    draft:rectangle(self.cx, self.cy, self.size*0.85, self.size*0.3, "fill")
  love.graphics.setColor(default_color)
end

function HPPickup:onPickup(other)
  HPPickup.super.onPickup(self, other)
  -- give boost
  other:addResource("hp", self.gain)
  -- explode
  self.area:addObject("HPEffect", self.cx, self.cy)
  text(
    self.area,
    self.cx + random(-self.size, self.size),
    self.cy + random(-self.size, self.size),
    "+HP",
    {color=hp_color}
)
  self:destroy()
end