ExplodeEffect = GameObject:extend()

function ExplodeEffect:new(area, x, y, opts)
  ExplodeEffect.super.new(self, area, x, y)
  self.collide = nil
  self.depth = 30
  self.dir = opts.dir or random(0, 2*math.pi)
  self.size = opts.size or random(2,3)
  self.vel = opts.vel or random(75, 150)
  self.lineWidth = 2
  self.color = opts.color or default_color
  self.timer:tween(
    opts.life or random(0.3, 0.5),
    self,
    {size=0, vel=0, lineWidth=0}, 
    "linear",
    function() self:destroy() end
  )
end

function ExplodeEffect:update(dt)
  ExplodeEffect.super.update(self, dt)
  local dx, dy = V.fromPolar(self.dir, self.vel*dt)
  self.x = self.x + dx
  self.y = self.y + dy
end

function ExplodeEffect:draw()
  pushRotate(self.x, self.y, self.dir)
  love.graphics.setLineWidth(self.lineWidth)
  love.graphics.setColor(self.color)
    love.graphics.line(self.x-self.size, self.y, self.x+self.size, self.y)
  love.graphics.setLineWidth(1)
  love.graphics.setColor(1,1,1)
  love.graphics.pop()
end
