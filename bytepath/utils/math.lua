function random(min, max)
  local min, max = min or 0, max or 1
  return (min > max and (love.math.random()*(min - max) + max)) or (love.math.random()*(max - min) + min)
end

function mid(a,b,c)
  return math.max(math.min(a,b),c)
end

function table.random(t)
  return t[love.math.random(#t)]
end

local function createChanceList(...)
  local chances = {}
  for _, v in ipairs({...}) do
    local value, n = v[1], v[2]
    for i=1,n do
      table.insert( chances, value )
    end
  end
  return M.shuffle(chances, love.math.random())
end

function chanceGenerator(...)
  local chanceList = {...}
  local chances = {}
  local function next()
    if #chances == 0 then
      chances = createChanceList(unpack(chanceList))
    end
    return M.pop(chances)
  end 
  return next
end


function steer(x, y, tx, ty, dir, turnSpeed)
  local twoPi = math.pi*2
  turnSpeed = turnSpeed or 0.1
  dir = dir % twoPi
  local steer = V.angleTo(tx - x, ty - y) - dir
  if steer > math.pi then steer = steer - twoPi end
  if steer < -math.pi then steer = steer + twoPi end

  return dir + steer * turnSpeed
end