local HyperCircle = Circle:extend()

local function bounce(self)
  if self.r2 - 5 > self.rSmall then
    timer:tween(3, self, {r2 = self.rSmall}, 'in-out-elastic', function() bounce(self) end)
  else
    timer:tween(3, self, {r2 = self.rBig}, 'in-out-elastic', function() bounce(self) end)
  end
end

function HyperCircle:new(area,x,y,r,r2)
  HyperCircle.super.new(self,area,x,y,r)
  self.r2 = r2
  self.rSmall = r2
  self.rBig = r2 * 2.5
  bounce(self)
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