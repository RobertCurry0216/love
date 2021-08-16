local RectangleRoom = Room:extend()

function RectangleRoom:new()

end

function RectangleRoom:update(dt)

end

function RectangleRoom:draw()
  love.graphics.rectangle("fill", 350, 275, 100, 50)
end

return RectangleRoom