TestRoom = Room:extend()

function TestRoom:new()
  self.loop = Loop(
    20,
    love.math.random(32,160),
    love.math.random(32,160),
    love.math.random(32,160),
    20
  )

  --sLength = 250
  --sMaxLength = 250

  --self.seg = Segment(sLength, sMaxLength)
end

function TestRoom:update(dt)
  self.loop:update(dt)
  -- if input:pressed("up") then
  --   sMaxLength = sMaxLength + 10
  --   self.seg = Segment(sLength, sMaxLength)
  -- end

  -- if input:pressed("down") then
  --   sMaxLength = sMaxLength - 10
  --   self.seg = Segment(sLength, sMaxLength)
  -- end
end

function TestRoom:draw()
  self.loop:draw(gw/2, gh/2)
  --self.seg:draw(40, gh/2, 0)
  --love.graphics.line(40, gh/2, 40+sMaxLength, gh/2)
end
