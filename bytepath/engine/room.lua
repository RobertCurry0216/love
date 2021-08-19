Room = Object:extend()

function Room:new()

end

function Room:update(dt)

end

function Room:draw()

end

--helper functions
function gotoRoom(roomType, ...)
  current_room = _G[roomType](...)
end
