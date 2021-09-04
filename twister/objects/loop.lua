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

local function drawSegment(w, s, e)
  local a = math.atan2(e.x-s.x, e.y-s.y)
  local off = Vector.fromPolar(a, w/2)

  p1 = s + off
  p2 = e - off

  love.graphics.setLineWidth(w)
  love.graphics.setColor(1,1,1)
  love.graphics.circle("fill", p1.x, p1.y, w/2)
  love.graphics.circle("fill", p2.x, p2.y, w/2)
  love.graphics.line(p1.x, p1.y, p2.x, p2.y)

  w = w-6
  love.graphics.setLineWidth(w)
  love.graphics.setColor(0,0,0)
  love.graphics.circle("fill", p1.x, p1.y, w/2)
  love.graphics.circle("fill", p2.x, p2.y, w/2)
  love.graphics.line(p1.x, p1.y, p2.x, p2.y)

  love.graphics.setLineWidth(1)
  love.graphics.setColor(1,1,1)

  love.graphics.line(s.x, s.y, e.x, e.y)

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
      drawSegment(32, p1, p2)
    end
    p2 = p1
  end
  p2 = self.points[1] + c
  drawSegment(32, p1, p2)
end
