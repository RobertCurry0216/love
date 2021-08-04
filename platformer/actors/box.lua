local Object = require("lib.classic")

local Box = Object:extend()

function Box:new(_x, _y, _w, _h)
  self.x = _x
  self.y = _y
  self.w = _w
  self.h = _h

  world:add(self, self.x, self.y, self.w, self.h)

  -- strength coltrols who gets pushed
  self.strength = 0
  self.tempStrength = 0

  -- physics
  self.weight = 400
  self.gravity = 0

  -- previous location
  self.last = {}
  self.last.x = _x
  self.last.y = _y

  -- color
  self.boxColor = {}
  self.boxColor.r = 1
  self.boxColor.g = 0
  self.boxColor.b = 0
end

function Box:update(dt) 
  self.last.x = self.x
  self.last.y = self.y
  --reset tempStrength
  self.tempStrength = self.strength
end

function Box:drawCollisionBox()
  love.graphics.setColor(self.boxColor.r,self.boxColor.g,self.boxColor.b,0.1)
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
  love.graphics.setColor(self.boxColor.r,self.boxColor.g,self.boxColor.b)
  love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
  love.graphics.setColor(1,1,1)
end

return Box