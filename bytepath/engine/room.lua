Room = Object:extend()

function Room:new()

end

function Room:update(dt)

end

function Room:draw()

end

function Room:finish()

end

--helper functions
function gotoRoom(roomType, ...)
  current_room = _G[roomType](...)
end

function addScore(s)
  if current_room and current_room.score then
    current_room.score = current_room.score + s
  end
end
