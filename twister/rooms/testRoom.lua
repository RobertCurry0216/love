TestRoom = Room:extend()

function TestRoom:new()
  self.loop = Loop(
    50,
    love.math.random(32,160),
    love.math.random(32,160),
    love.math.random(32,160),
    love.math.random(32,160),
    love.math.random(32,160),
    50
  )
end

function TestRoom:update(dt)
  self.loop:update(dt)
end

function TestRoom:draw()
  self.loop:draw(gw/2, gh/2)
end
