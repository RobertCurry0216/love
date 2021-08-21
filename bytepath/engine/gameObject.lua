GameObject = Object:extend()

function GameObject:new(area, x, y)
  self.id = UUID()
  self.type = "GameObject"
  self.creationTime = love.timer.getTime()
  self.collide = {
    canGetShot = false,
    canPickUp = false,
    canPush = false,
    canOverlap = true
  }
  self.depth = 50
  self.area = area
  self.x = x
  self.y = y
  self.cx = x + 5
  self.cy = y + 5
  self.size = 10
  self.dead = false
  self.timer = Timer()
end

function GameObject:update(dt)
  if self.timer then self.timer:update(dt) end
  self.cx, self.cy = self:getCenter()
end

function GameObject:draw()
  
end

function GameObject:destroy()
  self.dead = true
  if self.timer then
    self.timer:clear()
    self.timer = nil
  end
end

function GameObject:getCenter()
  return self.x + self.size/2, self.y + self.size/2
end

function GameObject:drawCollider()
  love.graphics.rectangle("line", self.x, self.y, self.size, self.size)
end

function GameObject:move(goalX, goalY)
  if self.area.world then
    local _x, _y, _cols, _l = self.area.world:move(self, goalX, goalY, self.filter)
    self.x = _x
    self.y = _y
    return _cols, _l
  else
    self.x = goalX
    self.y = goalY
    return {}, 0
  end
end

function GameObject:filter(other)
  return "cross"
end
