local Box = require("actors.box")

local Actor = Box:extend()

function Actor:new(_x, _y, _w, _h, _imgpath)
  Actor.super.new(self, _x, _y, _w, _h)
  self.spriteMap = love.graphics.newImage(_imgpath)
  self.sprites = {}

  local mapW = self.spriteMap:getWidth()
  local mapH = self.spriteMap:getHeight()

  for y=0,mapH-_h,_h do
    for x=0,mapW-_w,_w do
      table.insert(self.sprites, love.graphics.newQuad(x, y, _w, _h, mapW, mapH))
    end
  end

  -- anim state
  self.state = {
    idle={
      frames={ 1 },
      fps=1
    }
  }
  self.curState = "idle"
  self.curFrame = 1
  self.animTicks = 0

  -- strength controls who gets pushed
  self.strength = 0
  self.tempStrength = 0

  -- physics
  self.weight = 400
  self.gravity = 0

  -- previous location
  self.last = {}
  self.last.x = _x
  self.last.y = _y

  -- drawing
  self.flipX = false
end

function Actor:update(dt) 
  Actor.super.update(self, dt)
  self.gravity = self.gravity + self.weight * dt

  -- update anim state
  self.animTicks = self.animTicks + dt
  if self.animTicks > self:getState().fps then
    self.curFrame = self.curFrame + 1
    if self.curFrame > #self:getState().frames then
      self.curFrame = 1
    end
    self.animTicks = 0
  end
end

function Actor:getState()
  return self.state[self.curState]
end

function Actor:setState(s)
  if self.curState ~= s then
    self.curState = s
    self.curFrame = 1
    self.animTicks = 0
  end
end

function Actor:draw()
  local quad = self.sprites[self:getState().frames[self.curFrame]]
  love.graphics.draw(
    self.spriteMap,
    quad,
    self.flipX and self.x + self.w or self.x,
    self.y,
    0,
    self.flipX and -1 or 1,
    1
  )
end

return Actor