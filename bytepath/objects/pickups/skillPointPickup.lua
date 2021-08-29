SkillPointPickup = Pickup:extend()

function SkillPointPickup:new(area)
  local d = table.random({-1, 1})
  local x, y = d==1 and -48 or gw+48, random(48, gh-48)
  SkillPointPickup.super.new(self, area, x, y)

  self.size = 16
  self.vel = random(20,40) * d
  self.spin = random(math.pi/16, math.pi)*-d
  self.ang = random(math.pi)

  self.gain = 20
end

function SkillPointPickup:update(dt)
  SkillPointPickup.super.update(self,dt)
  self.ang = self.ang + self.spin*dt

  self:move(self.x+self.vel*dt, self.y)

  -- check off screen
  if outsideScreen(self.x, self.y, 50) then
    self:destroy()
  end
end

function SkillPointPickup:draw()
  pushRotate(self.cx, self.cy, self.ang)
  love.graphics.setColor(skill_point_color)
    draft:rhombus(self.cx, self.cy, self.size*1.5, self.size*1.5)
    draft:rhombus(self.cx, self.cy, self.size*0.5, self.size*0.5, "fill")
  love.graphics.setColor(default_color)
  love.graphics.pop()
end

function SkillPointPickup:onPickup(other)
  SkillPointPickup.super.onPickup(self, other)
  --TODO: add skill point here

  -- explode
  self.area:addObject("SkillPointEffect", self.cx, self.cy)
  text(
    self.area,
    self.cx + random(-self.size, self.size),
    self.cy + random(-self.size, self.size),
    "+1 SP",
    {color=skill_point_color}
)
  self:destroy()

  addScore(250)
end