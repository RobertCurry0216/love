local Actor = require("actors.actor")

local Player = Actor:extend()

function Player:new(_x, _y)
  Player.super.new(self, _x, _y, "assets/player.png")
end

local function getDirectionInput()
  local btnLeft = love.keyboard.isDown("left") and 1 or 0
  local btnRight = love.keyboard.isDown("right") and 1 or 0
  local btnUp = love.keyboard.isDown("up") and 1 or 0
  local btnDown = love.keyboard.isDown("down") and 1 or 0
  return btnRight - btnLeft, btnDown - btnUp
end

function Player:update(dt)
  Player.super.update(self, dt)

  local dx, dy = getDirectionInput()
  self.x = self.x + dx * 200 * dt
  self.y = self.y + dy * 200 * dt
end

return Player