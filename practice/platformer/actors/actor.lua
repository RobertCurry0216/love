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

  -- physics
  self.weight = 400
  self.gravity = 0

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

  -- physics
  self.gravity = self.gravity + self.weight * dt
  self.y = self.y + self.gravity * dt
end

function Actor:draw()
  love.graphics.draw(self.image, self.x, self.y)
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

function Actor:collideRight(other)
  self.x = other.x - self.width
end

function Actor:collideLeft(other)
  self.x = other.x + other.width
end

function Actor:collideDown(other)
  self.y = other.y - self.height
  self.gravity = 0
end

function Actor:collideUp(other)
  self.y = other.y + other.height
  self.gravity = 0
end

function Actor:checkResolve(other, direction)
  return true
end

function Actor:resolveCollision(other)
  if self.tempStrength > other.tempStrength then
    return other:resolveCollision(self)
  end

  if self:collidesWith(other) then
    self.tempStrength = other.tempStrength
    if self:wasAlignedWithVert(other) then
      if self.x + self.width / 2 < other.x + other.width / 2 then
        if self:checkResolve(other, "right") and other:checkResolve(self, "left") then
          self:collideRight(other)
        else 
          return false
        end
      else
        if self:checkResolve(other, "left") and other:checkResolve(self, "right") then
          self:collideLeft(other)
        else 
          return false
        end
      end
    elseif self:wasAlignedWithHoriz(other) then
      if self.y + self.height / 2 < other.y + other.height / 2 then
        if self:checkResolve(other, "down") and other:checkResolve(self, "up") then
          self:collideDown(other)
        else 
          return false
        end
      else
        if self:checkResolve(other, "up") and other:checkResolve(self, "down") then
          self:collideUp(other)
        else 
          return false
        end
      end
    end
    return true
  end
  return false
end

return Actor