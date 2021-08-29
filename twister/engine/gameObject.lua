GameObject = Object:extend()

function GameObject:new(area)
  self.area = area
  self.id = UUID()
  self.timer = Timer()
end

function GameObject:update(dt)
  if self.timer then self.timer:update(dt) end
end

function GameObject:draw()
  
end

function GameObject:__tostring()
  return "<obj:"..tostring(self.id)..">"
end
