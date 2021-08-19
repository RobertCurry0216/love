TickEffect = GameObject:extend()

function TickEffect:new(area, x, y, parent)
  TickEffect.super.new(self, area, x, y)
  self.collidable = false
  self.parent = parent
  self.yOffset = 0
  self.w = parent and parent.size or 10
  self.h = parent and parent.size or 10

  self.timer:tween(
    0.13,
    self,
    {yOffset=self.h, h=0},
    "in-out-cubic",
    function() self:destroy() end
  )
end

function TickEffect:update(dt)
  TickEffect.super.update(self, dt)
  if self.parent then
    self.x, self.y = self.parent:getCenter()
  end
end

function TickEffect:draw()
  local x = self.x - self.w
  local y = self.y - self.yOffset
  local w = self.w * 2
  local h = self.h
  love.graphics.rectangle("fill", x, y, w, h)
end