Player = GameObject:extend()

function Player:new(area, x, y)
  Player.super.new(self, area, x, y)
  self.size = 20
  self.cx, self.cy = self:getCenter()

  self.ship = player_ships.fighter

  --movement vars
  self.dir = -math.pi/2
  self.turningSpeed = 1.66*math.pi
  self.vel = 0
  self.maxVel = 100
  self.baseMaxVel = 100
  self.acc = 100

  --shooting
  self.timer:every(0.24, function() self:shoot() end)

  --tick
  self.timer:every(5, function() self:tick() end)

  --trail
  self.trailColor = trail_color
  self.timer:every(0.01, function() self:trails() end)

  input:bind("space", function() self:die() end)
end

function Player:update(dt)
  Player.super.update(self, dt)
  self.cx, self.cy = self:getCenter()
  self.maxVel = self.baseMaxVel
  self.trailColor = trail_color

  --movement
  if input:down("left") then self.dir = self.dir - self.turningSpeed*dt end
  if input:down("right") then self.dir = self.dir + self.turningSpeed*dt end
  if input:down("boost") then
    self.maxVel = self.baseMaxVel*1.5
    self.trailColor = boost_color
  end
  if input:down("dwindle") then
    self.maxVel = self.baseMaxVel*0.5
    self.trailColor = boost_color
  end

  self.vel = math.min(self.vel + self.acc*dt, self.maxVel)
  local _x, _y = V.fromPolar(self.dir, self.vel*dt)
  local _cols, _l = self:move(self.x + _x, self.y + _y)

  --keep in bounds
  if outsideScreen(self:getCenter()) then
    self:die()
  end 
end

function Player:draw()
  --love.graphics.circle("line", self.cx, self.cy, self.size*0.7)
  local u = self.size / 2
  pushRotate(self.cx, self.cy, self.dir)
  for _, poly in ipairs(self.ship.polygons) do
    local points = {}
    for i=1,#poly,2 do
       table.insert( points, poly[i]*u + self.cx )
       table.insert( points, poly[i+1]*u + self.cy )
    end
    love.graphics.polygon("line", points)
  end
  love.graphics.pop()
end

function Player:trails()
  local u = self.size/2
  for i=1,#self.ship.trails,2 do
    local x, y = self.ship.trails[i]*u, self.ship.trails[i+1]*u
    local px, py = V.rotate(self.dir, x, y)
    self.area:addObject("TrailEffect", self.cx+px, self.cy+py, {color=self.trailColor})
  end

end

function Player:die()
  self:destroy()
  slow(0.15, 1)
  camera:shake(6,60, 0.4)
  flash(4)
  for i=1,random(8,12) do
    self.area:addObject("ExplodeEffect", self.cx, self.cy)
  end
end

function Player:shoot()
  local cx, cy = self:getCenter()
  local px, py = V.fromPolar(self.dir, self.size)
  self.area:addObject("ShootEffect", cx+px, cy+py, self)
  self.area:addObject("Projectile", cx+px, cy+py, self.dir)
end

function Player:tick()
  local cx, cy = self:getCenter()
  self.area:addObject("TickEffect", cx, cy, self)
end