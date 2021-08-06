local Box = require("actors.box")

local Actor = Box:extend()

function Actor:new(_x, _y, _w, _h, _imgpath)
  Actor.super.new(self, _x, _y, _w, _h)
  self.spriteMap = love.graphics.newImage(_imgpath)
  self.sprites = {}

  for y=0,self.spriteMap:getHeight-_h,_h do
    for x=0,self.spriteMap:getWidth()-_w,_w do
      table.insert(self.sprites, love.graphics.newQuad(x, y, _w, _h, self.spriteMap:getWidth(), self.spriteMap:getHeight()))
    end
  end

  -- state
  self.state = {
    idle={
      frames={ 1 },
      fps=1
    }
  }
  self.curState = "idle"

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
end

function Actor:update(dt) 
  Actor.super.update(self, dt)

  self.gravity = self.gravity + self.weight * dt
end

function Actor:draw()
  love.graphics.draw(self.spriteMap, self.sprite, self.x, self.y)
end

return Actor