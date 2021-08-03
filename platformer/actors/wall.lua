local Box = require("actors.box")

local Wall = Box:extend()

function Wall:new(_x, _y)
  Wall.super.new(self, _x, _y, 16, 16)
  self.strength = 100
  self.weight = 0
end

function Wall:update(dt)
  Wall.super.update(self, dt)
end

return Wall