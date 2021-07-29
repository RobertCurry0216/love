local Actor = require("actors.actor")

local Wall = Actor:extend()

function Wall:new(_x, _y)
  Wall.super.new(self, _x, _y, "assets/wall.png")
end

function Wall:update(dt)

end

return Wall