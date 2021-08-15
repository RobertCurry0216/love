local HyperCircle = Circle:extend()

function HyperCircle:new(x,y,r,r2)
  HyperCircle.super.new(self,x,y,r)
  self.r2 = r2
end

function HyperCircle:update(dt)
  if input:down("move", 0.01) then
    self.x = love.mouse.getX()
    self.y = love.mouse.getY()
  end
  if input:pressed("move") then
    print "start moving"
  end
  if input:released("move") then
    print "finished moving"
  end
end

function HyperCircle:draw()
  HyperCircle.super.draw(self)
  love.graphics.circle("line", self.x, self.y, self.r2)
end

return HyperCircle