local Object = require("lib.classic")

local Actor = Object:extend()

function Actor:new(_x, _y, _imgpath)
  self.x = _x
  self.y = _y
  self.image = love.graphics.newImage(_imgpath)
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()

  -- previous location
  self.last = {}
  self.last.x = _x
  self.last.y = _y
end

function Actor:update(dt) 
  self.last.x = self.x
  self.last.y = self.y
end

function Actor:draw()
  love.graphics.draw(self.image, self.x, self.y)
end

function Actor:collidesWith(other)
  return self.x + self.width > other.x
    and self.x < other.x + other.width
    and self.y + self.height > other.y
    and self.y < other.y + other.height
end

function Actor:resolveCollision(other)
  if self:collidesWith(other) then
    self.x = self.last.x
    self.y = self.last.y
  end
end

return Actor