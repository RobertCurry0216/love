local Object = require "lib.classic"
local Actor = require "actors.actor"
local Enemy = Actor:extend()

function Enemy:new(_x,_y)
  self.super.new(self, _x, _y)
  self.image = love.graphics.newImage("assets/Ships/ship_0002.png")
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()

  self.speed = 75
  self.dir = 1
  self:randomSwap()

  self.dead = false
end

function Enemy:update(dt)
  local dx = self.dir * self.speed * dt
  self.x = self.x + dx
  if self.x < 0 then
    self.x = 0
    self:swapDir()
  elseif self.x > 400 - self.width then
    self.x = 400 - self.width
    self:swapDir()
  end
end

function Enemy:draw()
  self.super.draw(self)

  love.graphics.draw(
    self.image,
    self.x + self.width / 2,
    self.y + self.height / 2,
    0,
    1,
    1,
    16,
    16
  )
end

function Enemy:randomSwap()
  tick.delay(
    function() 
      self:swapDir()
      self:randomSwap()
    end, love.math.random(10))
end

function Enemy:swapDir()
  self.dir = self.dir * -1
end

return Enemy