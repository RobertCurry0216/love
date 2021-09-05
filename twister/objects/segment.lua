Segment = GameObject:extend()

function Segment:new(length, maxLength)
  maxLength = maxLength or length
  maxLength = mid(50, maxLength, length)

  local bow = length > 100 and -5 or 0
  bow = bow - math.abs(maxLength - length) * 0.6

  self.w = 16
  self.innerW = 12

  -- define points
  local sp, ep = Vector(self.w/2, 0), Vector(maxLength - self.w/2, 0)
  local segmentLength = 50
  local segments = math.floor(length / segmentLength)
  local stepLength = maxLength / segments
  self.points = { sp }
  for i=stepLength,maxLength-stepLength,stepLength do
    local dy = math.sin((i/maxLength)*math.pi) * bow
    M.push(self.points, Vector(i, dy))
  end
  M.push(self.points, ep)


  -- print("-------------")
  -- print("new segment")
  -- print("length: "..length)
  -- print("maxLength: "..maxLength)
  -- print("bow: "..bow)
  -- print("points: "..#self.points)
  -- print("-------------")

end

function Segment:draw(sp, ep)
  local diff = (ep - sp)
  local phi = math.atan2(diff.y, diff.x)


  pushRotate(sp.x, sp.y, phi)
    local base = sp
    local points = M.map(self.points, function(p) return p+base end)

    --new
    love.graphics.setColor(1,1,1)
    love.graphics.setLineWidth(self.w)
    love.graphics.circle("fill", points[1].x, points[1].y, self.w/2)
    for i=2,#points do
      local p1 = points[i-1]
      local p2 = points[i]

      love.graphics.circle("fill", p2.x, p2.y, self.w/2)
      love.graphics.line(p1.x, p1.y, p2.x, p2.y)
    end

    love.graphics.setColor(0,0,0)
    love.graphics.setLineWidth(self.innerW)
    love.graphics.circle("fill", points[1].x, points[1].y, self.innerW/2)
    for i=2,#points do
      local p1 = points[i-1]
      local p2 = points[i]

      love.graphics.circle("fill", p2.x, p2.y, self.innerW/2)
      love.graphics.line(p1.x, p1.y, p2.x, p2.y)
    end
  
    love.graphics.setColor(1,1,1)
    love.graphics.setLineWidth(1)
    
  love.graphics.pop()
  --love.graphics.line(sp.x, sp.y, ep.x, ep.y)
end