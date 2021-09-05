function UUID()
  local fn = function(x)
      local r = love.math.random(16) - 1
      r = (x == "x") and (r + 1) or (r % 4) + 9
      return ("0123456789abcdef"):sub(r, r)
  end
  return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"):gsub("[xy]", fn))
end

function pushRotate(x, y, r)
  love.graphics.push()
  love.graphics.translate(x, y)
  love.graphics.rotate(r or 0)
  love.graphics.translate(-x, -y)
end

function pushRotateScale(x, y, r, sx, sy)
  love.graphics.push()
  love.graphics.translate(x, y)
  love.graphics.rotate(r or 0)
  love.graphics.scale(sx or 1, sy or sx or 1)
  love.graphics.translate(-x, -y)
end


-- balloon segment helpers

function findRadius(segments)
  local biggest = M.sum(segments) / 2
  local smallest = M.min(segments)
  local cur, best, bestR = 0, math.pi * 2, biggest
  local maxAng = twoPi + math.pi * 0.01

  for r=biggest,smallest,-1 do
    local ang = 0

    for _, segment in ipairs(segments) do
      ang = ang + math.asin((segment / 2) / r) * 2
    end
    cur = math.abs(twoPi - ang)
    if cur < best and cur < maxAng then
      best = cur
      bestR = r
    end
  end

  return bestR
end

function getSegmentsPointsAndRadius(segments)
  -- todo handle <4 segments
  -- todo handle when 1 segment is longer than the rest combined
  local r = findRadius(segments)

  local ang = math.pi / 2
  local x1, y1, x2, y2 = 0, r, 0, 0
  local points = {Vector(x1, y1)}
  local segs = {}

  for _, segment in ipairs(segments) do
    ang = ang + (math.asin((segment / 2) / r) * 2)
    M.push(points, Vector.fromPolar(ang, r))
    M.push(segs, Segment(segment, segment))
  end

  
  print("-------------")
  print("segments: "..#segs)
  print("points: "..#points)
  print("radius: "..r)
  print("-------------")


  return segs, points, r
end
