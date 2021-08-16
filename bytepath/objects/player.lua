local Player = GameObject:extend()

function Player:new(area, x, y)
  Player.super.new(self, area, x, y)
  self.size = 25
end

function Player:update(dt)
  Player.super.update(self, dt)
end

function Player:draw()
  local x,y = self:getCenter()
  love.graphics.circle("line", x, y, self.size*0.7)
  love.graphics.rectangle("line", self.x, self.y, self.size, self.size)
end

return Player