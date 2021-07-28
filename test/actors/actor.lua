local Object = require "lib.classic"
local Actor = Object:extend()

function Actor:new(_x,_y,_w,_h)
  self.x = _x or 0
  self.y = _y or 0
  self.width = _w or 10
  self.height = _h or 10
  self.filled = false
end

function Actor:update(dt)

end

function Actor:draw()
  love.graphics.rectangle(
    self.filled and "fill" or "line",
    self.x,
    self.y,
    self.width,
    self.height
  )
end

local function AABB(a, b)
  local a_left = a.x
  local a_right = a.x + a.width
  local a_top = a.y
  local a_bottom = a.y + a.height

  local b_left = b.x
  local b_right = b.x + b.width
  local b_top = b.y
  local b_bottom = b.y + b.height

  return a_right > b_left 
    and a_left < b_right
    and a_top < b_bottom
    and a_bottom > b_top
end

function Actor:collidesWith(other)
  return AABB(self, other)
end

function checkCollision(actor1, actor2)
  return AABB(actor1, actor2)
end

return Actor