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

function GameObject:move(goalX, goalY)
  if self.area.world then
    local _x, _y, _cols, _l = self.area.world:move(self, goalX, goalY)
    self.x = _x
    self.y = _y
    return _cols, _l
  else
    self.x = goalX
    self.y = goalY
    return {}, 0
  end
end

return GameObject