Loop = GameObject:extend()


function Loop:new(...)
  Loop.super.new(self, nil)

  self.segments, self.points, self.radius = getSegmentsPointsAndRadius({...})

end

function Loop:update(dt)
  Loop.super.update(self, dt)
end

function Loop:draw(cx, cy)
  love.graphics.setColor(0.3,0.3,0.3)
  love.graphics.circle("line",cx,cy,self.radius)

  -- for i=1, #self.points do
  --   local p = self.points[i] + Vector(cx, cy)
  --   love.graphics.circle("line",p.x,p.y,5)
  -- end
  love.graphics.setColor(1,1,1)
  
  local c = Vector(cx, cy)
  --love.graphics.circle("fill",(self.points[1] + c).x,(self.points[1] + c).y,5)
  local p1, p2
  for i=1,#self.segments do
    p1 = self.points[i] + c
    p2 = self.points[i+1] + c
    self.segments[i]:draw(p1, p2)
  end
end
