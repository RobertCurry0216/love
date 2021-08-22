function responsePush(world, col, x,y,w,h, goalX, goalY, filter)
  goalX = goalX or x
  goalY = goalY or y

  local tch, move  = col.touch, col.move
  if move.x ~= 0 or move.y ~= 0 then
    local diffX = col.item.cx - col.other.cx
    local diffY = col.item.cy - col.other.cy

    if math.abs(diffX) > math.abs(diffY) then
      if diffX > 0 then
        goalX = col.other.x + col.other.size
      else
        goalX = col.other.x - col.item.size
      end
    else
      if diffY > 0 then
        goalY = col.other.y + col.other.size
      else
        goalY = col.other.y - col.item.size
      end
    end
  end

  col.push = {x = goalX, y = goalY}

  x,y = tch.x, tch.y
  local cols, len  = world:project(col.item, x,y,w,h, goalX, goalY, filter)
  return goalX, goalY, cols, len
end
