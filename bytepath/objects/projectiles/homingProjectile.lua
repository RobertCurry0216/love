HomingProjectile = Projectile:extend()

function HomingProjectile:new(area, x, y, d, c)
  HomingProjectile.super.new(self, area, x, y, d, c)

  self.attackType = "homing"

  self.timer:every(0.02, function()
    self.area:addObject("TrailEffect", self.cx, self.cy, {color=self.color, size=3})
  end)
end

function HomingProjectile:draw()
  draft:rhombus(self.cx, self.cy, self.size*2, self.size*2, "fill")
end