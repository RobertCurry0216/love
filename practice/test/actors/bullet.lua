local Object = require "lib.classic"
local Actor = require "actors.actor"

local Bullet = Actor:extend()

Bullets = {}

function Bullet:new(_x,_y)
  self.super.new(self, _x, _y)
  self.image = love.graphics.newImage("assets/kenney_pixelshmup/Tiles/tile_0000.png")
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()

  self.speed = 200
  table.insert(Bullets, self)
  self.dead = false
end

function Bullet:update(dt)
  local dy = self.speed * dt
  self.y = self.y + dy
end

function Bullet:draw()
  self.super.draw(self)

  love.graphics.draw(
    self.image,
    self.x + self.width / 2,
    self.y + self.height / 2,
    0,
    1,
    1,
    self.width / 2,
    self.height / 2
  )
end

return Bullet