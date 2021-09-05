
function random(min, max)
  local min, max = min or 0, max or 1
  return (min > max and (love.math.random()*(min - max) + max)) or (love.math.random()*(max - min) + min)
end

function mid(a,b,c)
  local t = {a,b,c}
  table.sort(t)
  return t[2]
end