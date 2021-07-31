local Actor = require("actors.actor")

local Player = Actor:extend()

function Player:new(_x, _y)
  Player.super.new(self, _x, _y, "assets/player.png")
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
  local dx = getDirectionInput()
  self.x = self.x + dx * 200 * dt

  if not(self.y == self.last.y) then
    self.canJump = false
  end
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