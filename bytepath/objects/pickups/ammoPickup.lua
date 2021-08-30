AmmoPickup = Pickup:extend()

function AmmoPickup:new(area, x, y)
  AmmoPickup.super.new(self, area, x, y)
  self.size = 8
  self.vel = random(10,20)
  self.dir = random(0, math.pi*2)
  self.spin = random(-math.pi, math.pi)
  self.ang = 0
end

function AmmoPickup:update(dt)
  AmmoPickup.super.update(self,dt)
  self.ang = self.ang + self.spin*dt

  -- move towards player
  if current_room and current_room.player then
    local target = current_room.player
    local steer = V.angleTo(target.cx - self.cx, target.cy - self.cy) - self.dir
    if steer > math.pi then steer = steer - math.pi*2 end
    if steer < -math.pi then steer = steer + math.pi*2 end
    self.dir = self.dir + steer*0.1
    local x, y = V.fromPolar(self.dir, self.vel*dt)
    self:move(self.x+x, self.y+y)
  end
end

function AmmoPickup:draw()
  pushRotate(self.cx, self.cy, self.ang)
  love.graphics.setColor(ammo_color)
    draft:rhombus(self.cx, self.cy, self.size, self.size)
  love.graphics.setColor(default_color)
  love.graphics.pop()
end

function AmmoPickup:onPickup(other)
  AmmoPickup.super.onPickup(self, other)
  -- give ammo
  other:addResource("ammo", other.ammoGain)
  -- explode
  self.area:addObject("AmmoEffect", self.cx, self.cy)
  explode(self.area, self.cx, self.cy, {n=8, color=ammo_color})
  self:destroy()

  addScore(50)
end