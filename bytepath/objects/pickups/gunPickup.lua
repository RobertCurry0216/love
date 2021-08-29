GunPickup = Pickup:extend()

local gunTypes = {
  "Neutral",
  "Double",
  "Triple",
  "Rapid",
  "Spread",
  "Back",
  "Side"
}

function GunPickup:new(area, type)
  local d = table.random({-1, 1})
  local x, y = d==1 and -48 or gw+48, random(48, gh-48)
  GunPickup.super.new(self, area, x, y)
  
  type = type or table.random(gunTypes)
  self.gunType = type
  self.gun = guns[type]
  self.size = 18
  self.vel = random(20,40) * d
  self.font = fonts.m5x7_16
  self.ox = self.font:getWidth(self.gun.abbr)/2
  self.oy = self.font:getHeight()/2
end

function GunPickup:update(dt)
  GunPickup.super.update(self,dt)

  self:move(self.x+self.vel*dt, self.y)

  -- check off screen
  if outsideScreen(self.x, self.y, 50) then
    self:destroy()
  end
end

function GunPickup:draw()
  love.graphics.setColor(self.gun.color)
  love.graphics.setFont(self.font)
  draft:rhombus(self.cx, self.cy, self.size*1.7, self.size*1.7)
  love.graphics.print(self.gun.abbr, self.cx, self.cy, 0,1,1,self.ox, self.oy)
  love.graphics.setColor(default_color)
  draft:rhombus(self.cx, self.cy, self.size*1.2, self.size*1.2)
end

function GunPickup:onPickup(other)
  GunPickup.super.onPickup(self, other)
  -- give gun
  other.gun = self.gun
  other.ammo = other.ammoMax
  -- explode
  self.area:addObject("GunEffect", self.cx, self.cy, self.gun.color)
  text(
    self.area,
    self.cx,
    self.cy,
    self.gunType,
    {color=self.gun.color, centered=true}
  )
  self:destroy()

  addScore(500)
end