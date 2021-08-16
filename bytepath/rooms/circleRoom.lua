local CircleRoom = Room:extend()

function CircleRoom:new()
  self.area = Area(self)
  self.area:addObject("HyperCircle", 400, 300, 50, 75)
end

function CircleRoom:update(dt)
  self.area:update(dt)
end

function CircleRoom:draw()
  self.area:draw()
end

return CircleRoom