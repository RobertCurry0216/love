local Actor = require("actors.actor")

local Wall = Actor:extend()

function Wall:new(_x, _y)
  Wall.super.new(self, _x, _y, "assets/wall.png")
  self.strength = 100
end

function Wall:update(dt)
  Wall.super.update(self, dt)
end

return Wall