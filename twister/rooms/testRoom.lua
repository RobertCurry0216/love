TestRoom = Room:extend()

function TestRoom:new()
  self.loop = Loop(
    150,150,150,250
  )
end

function TestRoom:update(dt)
  self.loop:update(dt)
end

function TestRoom:draw()
  self.loop:draw(400, 300)
end
