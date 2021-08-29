TestRoom = Room:extend()

function TestRoom:new()
  self.loop = Loop(
    love.math.random(50, 400),
    love.math.random(50, 400),
    love.math.random(50, 400),
    love.math.random(50, 400)
  )
end

function TestRoom:update(dt)
  self.loop:update(dt)
end

function TestRoom:draw()
  self.loop:draw(400, 300)
end
