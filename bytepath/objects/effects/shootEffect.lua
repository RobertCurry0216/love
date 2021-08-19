ShootEffect = GameObject:extend()

function ShootEffect:new(area, x, y, shooter)
  ShootEffect.super.new(self, area, x, y)
  self.collidable = false
  self.shooter = shooter
  self.size = 8
  self.timer:tween(0.1, self, {size=0}, "in-out-cubic", function() self:destroy() end)
end

function ShootEffect:draw()
  if self.shooter then
    local cx, cy = self.shooter:getCenter()
    local u = self.shooter.size/2
    local px, py = V.rotate(self.shooter.dir, self.shooter.ship.gun[1]*u, self.shooter.ship.gun[2]*u)
    local x, y = cx+px, cy+py
    pushRotate(x,y,self.shooter.dir+math.pi/4)
      love.graphics.rectangle("fill", x-self.size/2, y-self.size/2, self.size, self.size)
    love.graphics.pop()
  end
end
