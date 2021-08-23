Shooter = GameObject:extend()

function Shooter:new(area)
  local d = table.random({-1, 1})
  local x, y = d==1 and -48 or gw+48, random(48, gh-48)
  Shooter.super.new(self, area, x, y)

  self.collide.canBeShot = true
  self.collide.canHurtPlayer = true

  self.size = 16 + random(-4,4)
  self.vel = random(20,40) * d
  self.ang = d == 1 and 0 or math.pi
  self.outline = {-0.6,0, 0,-0.6, 1.5,0, 0,0.6}
  self.color = hp_color
  self.tipX = self.size*d*2

  -- stats
  self.hp = 100
  self.damage = 30

  -- shooting
  self.timer:every(
    random(3,5),
    function()
      local handle = self.timer:every(0.05, function()
        local d = random(0, math.pi*2)
        local x, y = V.fromPolar(d,15)
        self.area:addObject(
          "ExplodeEffect",
          self.cx + self.tipX - x,
          self.cy - y,
          {dir=d, color=hp_color}
        )
      end)
      self.timer:after(
        1,
        function()
          if current_room.player then
            self.area:addObject(
              "EnemyProjectile",
              self.cx + self.tipX,
              self.cy,
              current_room.player.cx,
              current_room.player.cy
            )
          end
          self.timer:cancel(handle)
        end
      )
    end
  )
end

function Shooter:update(dt)
  Shooter.super.update(self,dt)

  local cols, l = self:move(self.x+self.vel*dt, self.y)

  if l > 0 then
    for _, col in ipairs(cols) do
      if col.other.collide.canHurtEnemy then
        col.other:attack(self)
      end
    end
  end

  -- check off screen
  if outsideScreen(self.x, self.y, 50) then
    self:destroy()
  end
end

function Shooter:draw()
  local points = M.map(self.outline, function(v, i)
    return i%2 == 0 and (v*self.size)+self.cy or (v*self.size)+self.cx
  end)
  pushRotate(self.cx, self.cy, self.ang)
  love.graphics.setColor(self.color)

  love.graphics.polygon("line", points)

  love.graphics.setColor(default_color)
  love.graphics.pop()
end

function Shooter:filter(other)
  if other.collide.canPush then
    return "push"
  end
  return Shooter.super.filter(self, other)
end

function Shooter:die()
  self:destroy()
  self.area:addObject("ProjectileDeathEffect",self.cx, self.cy, self.size*1.5, hp_color)
  self.area:addObject("AmmoPickup", self.cx, self.cy)
end

function Shooter:hit(damage)
  self.hp = self.hp - damage
  if self.hp <= 0 then
    self:die()
  else
    self.color = default_color
    self.timer:after(0.2, function() self.color = hp_color end)
  end
end

function Shooter:attack(other)
  other:hit(self.damage)
end