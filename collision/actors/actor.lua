local Object = require("lib.classic")

local Actor = Object:extend()

function Actor:new(_x, _y, _imgpath)
  self.x = _x
  self.y = _y
  self.image = love.graphics.newImage(_imgpath)
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()

  -- strength coltrols who gets pushed
  self.strength = 0
  self.tempStrength = 0

  -- previous location
  self.last = {}
  self.last.x = _x
  self.last.y = _y
end

function Actor:update(dt) 
  self.last.x = self.x
  self.last.y = self.y
  --reset tempStrength
  self.tempStrength = self.strength
end

function Actor:draw()
  love.graphics.draw(self.image, math.floor(self.x), math.floor(self.y))
end

function Actor:wasAlignedWithVert(other)
  return self.last.y + self.height > other.last.y
    and self.last.y < other.last.y + other.height
end

function Actor:wasAlignedWithHoriz(other)
  return self.last.x + self.width > other.last.x
    and self.last.x < other.last.x + other.width
end

function Actor:collidesWith(other)
  return self.x + self.width > other.x
    and self.x < other.x + other.width
    and self.y + self.height > other.y
    and self.y < other.y + other.height
end

function Actor:resolveCollision(other)
  if self.tempStrength > other.tempStrength then
    return other:resolveCollision(self)
  end

  if self:collidesWith(other) then
    self.tempStrength = other.tempStrength
    if self:wasAlignedWithVert(other) then
      local pushbackX = 0
      if self.x + self.width / 2 < other.x + other.width / 2 then
        pushbackX = other.x - self.x - self.width
      else
        pushbackX = other.x + other.width - self.x
      end
      self.x = self.x + pushbackX
    elseif self:wasAlignedWithHoriz(other) then
      local pushbackY = 0
      if self.y + self.height / 2 < other.y + other.height / 2 then
        pushbackY = other.y - self.y - self.height
      else
        pushbackY = other.y + other.height - self.y
      end
      self.y = self.y + pushbackY
    end
    return true
  end
  return false
end

return Actor