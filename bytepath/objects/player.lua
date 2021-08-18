local Player = GameObject:extend()

function Player:new(area, x, y)
  Player.super.new(self, area, x, y)
  self.size = 20

  --movement vars
  self.dir = -math.pi/2
  self.turningSpeed = 1.66*math.pi
  self.vel = 0
  self.maxVel = 100
  self.acc = 100

  --shooting
  self.timer:every(0.24, function() self:shoot() end)

  input:bind("space", function() self:die() end)
end

function Player:update(dt)
  Player.super.update(self, dt)
  --movement
  if input:down("left") then self.dir = self.dir - self.turningSpeed*dt end
  if input:down("right") then self.dir = self.dir + self.turningSpeed*dt end
  self.vel = math.min(self.vel + self.acc*dt, self.maxVel)
  local _x, _y = V.fromPolar(self.dir, self.vel*dt)
  local _cols, _l = self:move(self.x + _x, self.y + _y)

  --keep in bounds
  if outsideScreen(self:getCenter()) then
    self:die()
  end 
end

function Player:draw()
  local cx,cy = self:getCenter()
  local fx,fy = V.fromPolar(self.dir, self.size)
  love.graphics.circle("line", cx, cy, self.size*0.7)
end

function Player:die()
  self:destroy()
  slow(0.15, 1)
  camera:shake(6,60, 0.4)
  flash(4)
  local x, y = self:getCenter()
  for i=1,random(8,12) do
    self.area:addObject("ExplodeEffect", x, y)
  end
end

function Player:shoot()
  local cx, cy = self:getCenter()
  local px, py = V.fromPolar(self.dir, self.size)
  self.area:addObject("ShootEffect", cx+px, cy+py, self)
  self.area:addObject("Projectile", cx+px, cy+py, self.dir)
end

return Player