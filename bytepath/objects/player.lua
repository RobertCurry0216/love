Player = GameObject:extend()

function Player:new(area, x, y)
  Player.super.new(self, area, x, y)
  self.collide.canPush = true

  self.depth = 75
  self.size = 20
  self.cx, self.cy = self:getCenter()

  self.ship = player_ships.fighter

  --movement vars
  self.dir = -math.pi/2
  self.turningSpeed = 1.66*math.pi
  self.vel = 0
  self.velMax = 100
  self.velMaxBase = 100
  self.acc = 100

  --player stats
  self.hpMax = 100
  self.hp = self.hpMax
  self.ammoMax = 100
  self.ammo = self.ammoMax
  self.invincible = false
  self.flash = false

  --weapons
  self.gun = guns.Neutral
  self.gunCoolDown = 0

  --boost stats
  self.boost = 100
  self.boostMax = 100
  self.boostRegen = 10
  self.boostRate = 50
  self.boostCoolDownPeriod = 2
  self.canBoost = true


  --tick
  self.timer:every(5, function() self:tick() end)

  --trail
  self.trailColor = trail_color
  self.timer:every(0.01, function() self:trails() end)
end

function Player:update(dt)
  Player.super.update(self, dt)
  self.velMax = self.velMaxBase
  self.trailColor = trail_color

  --movement
  if input:down("left") then self.dir = self.dir - self.turningSpeed*dt end
  if input:down("right") then self.dir = self.dir + self.turningSpeed*dt end
  if input:down("boost") and self.canBoost then
    self.boost = self.boost - self.boostRate*dt
    self.velMax = self.velMaxBase*1.5
    self.trailColor = boost_color
  end
  if input:down("dwindle") and self.canBoost then
    self.boost = self.boost - self.boostRate*dt
    self.velMax = self.velMaxBase*0.5
    self.trailColor = dwindle_color
  end

  self.vel = math.min(self.vel + self.acc*dt, self.velMax)
  local _x, _y = V.fromPolar(self.dir, self.vel*dt)
  local _cols, _l = self:move(self.x + _x, self.y + _y)

  --collisions
  for _, c in ipairs(_cols) do
    local other = c.other
    local collider = other.collide
    if collider.canBePickedUp then
      other:onPickup(self)
    end

    if collider.canHurtPlayer then
      other:attack(self)
    end

  end

  --boost
  if self.boost < 1 and self.canBoost then
    self.canBoost = false
    self.timer:tween(
      self.boostCoolDownPeriod,
      self,
      {boost = self.boostMax},
      "linear",
      function() self.canBoost = true end
    )
  else
    self.boost = math.min(self.boost + self.boostRegen*dt, self.boostMax)
  end

  --shooting
  self.gunCoolDown = self.gunCoolDown + dt
  if self.gunCoolDown >= self.gun.coolDown then
    self.gun.shoot(self, self.area)
    self.gunCoolDown = 0
    self.ammo = math.max(self.ammo - self.gun.ammoCost, 0)
    if self.ammo == 0 then self.gun = guns.Neutral end
  end

  --keep in bounds
  if outsideScreen(self:getCenter()) then
    self:die()
  end 
end

function Player:draw()
  -- draw nothing if flashing
  if self.flash then return end

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
  explode(self.area, self.cx, self.cy)

  current_room:finish()
end

function Player:tick()
  self.area:addObject("TickEffect", self.cx, self.cy, self)
end

function Player:addResource(resource, amount)
  if type(self[resource] == "number") and type(self[resource.."Max"]) == "number" then
    self[resource] = mid(self[resource]+amount, self[resource.."Max"], 0)
  else
    print("error-Player:addResource => "..resource)
  end
end

function Player:hit(damage, opts)
  if self.invincible then return end
  opts = opts or {}
  damage = damage or 10
  self:addResource("hp", -damage)
  if self.hp == 0 then
    self:die()
  else
    explode(self.area, self.cx, self.cy, {n=6, color= opts.color or default_color})
    if damage >= 30 then
      self.invincible = true
      self.timer:after(2, function() self.invincible = false; self.flash = false end)
      self.timer:every(0.4, function() self.flash = not self.flash end, 4)
      flash(3)
      slow(0.25, 0.5)
    end
  end
end