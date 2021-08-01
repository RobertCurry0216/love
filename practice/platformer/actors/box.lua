local Actor = require("actors.actor")

local Box = Actor:extend()

function Box:new(_x, _y)
  Box.super.new(self, _x, _y, "assets/box.png")
end

return Box