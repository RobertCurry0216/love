local Wall = GameObject:extend()

function Wall:new(area, x, y, size)
  Wall.super.new(self,area,x,y)
  self.size = size
end

function Wall:draw()
  local cx,cy = self:getCenter()
  love.graphics.rectangle("line", self.x, self.y, self.size, self.size)
end

return Wall