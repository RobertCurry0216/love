local Object = require "lib.classic"
local Actor = require "actors.actor"
Bullet = require "actors.bullet"

local Player = Actor:extend()


function Player:new(_x,_y)
  self.super.new(self, _x, _y)
  self.image = love.graphics.newImage("assets/Ships/ship_0005.png")
  self.width = 16
  self.height = 16

  self.speed = 100
end

function Player:update(dt)
  local kb = love.keyboard
  local kbLeft = kb.isDown("left") and 1 or 0
  local kbRight = kb.isDown("right") and 1 or 0

  self.x = self.x + (kbRight - kbLeft) * self.speed * dt
end

function Player:keypressed(key)
  if key == "down" then
    Bullet(self.x + self.width / 2, self.y + self.height)
  end
end

function Player:draw()
  self.super.draw(self)

  love.graphics.draw(
    self.image,
    self.x + self.width / 2,
    self.y + self.height / 2,
    math.pi,
    1,
    1,
    16,
    16
  )
end

return Player