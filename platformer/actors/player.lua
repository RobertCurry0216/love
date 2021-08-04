local Actor = require("actors.actor")

local Player = Actor:extend()

function Player:new(_x, _y)
  Player.super.new(self, _x, _y, "/assets/1bit_tileset.png", 96, 32, 16, 16)
  self.strength = 10
  self.canJump = true
end

local function getDirectionInput()
  local btnLeft = love.keyboard.isDown("left") and 1 or 0
  local btnRight = love.keyboard.isDown("right") and 1 or 0
  return btnRight - btnLeft
end

function Player:update(dt)
  Player.super.update(self, dt)
  self.boxColor.r = 0
  self.boxColor.g = 1
  self.boxColor.b = 0
  
  if not(self.y == self.last.y) then
    self.canJump = false
  end
  
  --movement
  local _x = self.x + getDirectionInput() * 100 * dt
  local _y = self.y + self.gravity * dt

  -- apply movements
  local new_x, new_y, cols, len = world:move(self, _x, _y)
  self.x = new_x
  self.y = new_y
end

function Player:keypressed(key)
  if key == "up" then
    self:jump()
  end
end

function Player:jump()
  if self.canJump then
    self.gravity = -300
    self.canJump = false
  end
end

function Player:collideDown(other)
  Player.super.collideDown(self, other)
  self.canJump = true
end

function Player:checkResolve(other, direction) 
  if other:is(Box) then
    return direction == "down"
  end
  return true
end

return Player