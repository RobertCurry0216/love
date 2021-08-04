local Box = require("actors.box")

local Actor = Box:extend()

function Actor:new(_x, _y, _imgpath, _qx, _qy, _qw, _qh)
  Actor.super.new(self, _x, _y, _qw, _qh)
  self.spriteMap = love.graphics.newImage(_imgpath)
  self.sprite = love.graphics.newQuad(_qx, _qy, _qw, _qh, self.spriteMap:getWidth(), self.spriteMap:getHeight())

  -- strength coltrols who gets pushed
  self.strength = 0
  self.tempStrength = 0

  -- physics
  self.weight = 400
  self.gravity = 250

  -- previous location
  self.last = {}
  self.last.x = _x
  self.last.y = _y
end

function Actor:update(dt) 
  self.last.x = self.x
  self.last.y = self.y
  --reset tempStrength
  self.tempStrength = self.strength

end

function Actor:draw()
  love.graphics.draw(self.spriteMap, self.sprite, self.x, self.y)
end

return Actor