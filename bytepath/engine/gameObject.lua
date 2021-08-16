local GameObject = Object:extend()

function GameObject:new(area, x, y)
  self.area = area
  self.x = x
  self.y = y
  self.size = 10
  self.id = UUID()
  self.dead = false
  self.timer = Timer()
end

function GameObject:update(dt)
  if self.timer then self.timer:update(dt) end
end

function GameObject:draw()
  
end

function GameObject:getCenter()
  local _x = self.x + self.size/2
  local _y = self.y + self.size/2
  return _x,_y
end

return GameObject