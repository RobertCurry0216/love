TrailEffect = GameObject:extend()

function TrailEffect:new(area, x, y, opts)
  TrailEffect.super.new(self, area, x, y)
  self.collidable = false
  self.depth = 30
  opts = opts or {}

  self.r = opts.r or random(4,6)
  self.color = opts.color or trail_color
  self.timer:tween(
    opts.life or random(0.2, 0.4),
    self,
    {r=0},
    "linear",
    function() self:destroy() end
  )
end

function TrailEffect:update(dt)
  TrailEffect.super.update(self,dt)
end

function TrailEffect:draw()
  love.graphics.setColor(self.color)
  love.graphics.circle("fill", self.x, self.y, self.r)
  love.graphics.setColor(1,1,1)
end