local HyperCircle = Circle:extend()

function HyperCircle:new(x,y,r,r2)
  HyperCircle.super.new(self,x,y,r)
  self.r2 = r2
end

function HyperCircle:draw()
  HyperCircle.super.draw(self)
  love.graphics.circle("line", self.x, self.y, self.r2)
end

return HyperCircle