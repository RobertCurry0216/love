TrailEffect = GameObject:extend()

function TrailEffect:new(area, x, y, opts)
  TrailEffect.super.new(self, area, x, y)
  self.collide = nil
  self.depth = 30
  opts = opts or {}

  local size = opts.size or 5

  self.r = random(size-1,size+1)
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