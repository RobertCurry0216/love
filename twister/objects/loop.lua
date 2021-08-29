Loop = GameObject:extend()


-- helper functions

local function findRadius(segments)
  local biggest = M.max(segments)
  local smallest = biggest / 2
  local cur, best = 0, math.pi * 2
  local twoPi = math.pi * 2

  for r=biggest,smallest,-1 do
    local ang = 0

    for _, segment in ipairs(segments) do
      ang = ang + math.asin((segment / 2) / r) * 2
    end
    cur = math.abs(twoPi - ang)
    if cur < best then
      best = cur
    else
      return r
    end
  end

  return biggest
end

local function getPointsAndRadius(segments)
  -- todo handle <4 segments
  -- todo handle when 1 segment is longer than the rest combined
  local r = findRadius(segments)

  local ang = math.pi / 2
  local x1, y1, x2, y2 = 0, r, 0, 0
  local points = {}

  for _, segment in ipairs(segments) do
    ang = ang + math.asin((segment / 2) / r) * 2
    table.insert(points, Vector.fromPolar(ang, r))
  end
  return points, r
end


function Loop:new(...)
  Loop.super.new(self, nil)

  self.segments = {...}
  self.points, self.radius = getPointsAndRadius(self.segments)

end

function Loop:update(dt)
  Loop.super.update(self, dt)
end

function Loop:draw(cx, cy)
  --love.graphics.circle("line",cx,cy,self.radius)

  local c = Vector(cx, cy)
  local p1, p2
  for _, point in ipairs(self.points) do
    p1 = point + c
    if p2 then
      love.graphics.line(p1.x, p1.y, p2.x, p2.y)
    end
    p2 = p1
  end
  p2 = self.points[1] + c
  love.graphics.line(p1.x, p1.y, p2.x, p2.y)
end
