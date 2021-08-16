local Circle = GameObject:extend()

function Circle:new(area, x, y, r)
  Circle.super.new(self, area, x, y)
  self.r = r
end

function Circle:update(dt)

end

function Circle:draw()
  love.graphics.circle("fill",self.x, self.y, self.r)
end

return Circle