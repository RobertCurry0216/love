local Actor = require("actors.actor")

local Player = Actor:extend()

function Player:new(_x, _y)
  Player.super.new(self, _x, _y, 32, 32, "/assets/astro_hero_spritesheet.png")
  self.strength = 10
  self.canJump = true
  self.grounded = false

  self.flipX = false

  -- movement vars
  self.acc = 2.5
  self.dcc = 0.8
  self.maxSpeed = 3

  self.dx = 0
  self.dy = 0

  -- state
  self.state = {
    idle={
      frames={ 1, 1, 2 },
      fps=1/2
    },
    shoot={
      frames={ 3 },
      fps=1
    },
    run={
      frames={ 4,5 },
      fps=1/8
    },
    jump={
      frames={ 7 },
      fps=1
    },
    fall={
      frames={ 8 },
      fps=1
    },
  }

  self.boxColor.r = 0
  self.boxColor.g = 1
  self.boxColor.b = 0
end

local function getDirectionInput()
  local btnLeft = love.keyboard.isDown("left") and 1 or 0
  local btnRight = love.keyboard.isDown("right") and 1 or 0
  return btnRight - btnLeft
end

function Player:update(dt)
  Player.super.update(self, dt)
  
  if not(self.y == self.last.y) then
    self.canJump = false
  end
  
  --movement
  local dirX = getDirectionInput()
  if not self.grounded then
    self.dy = self.gravity * dt
  end
  
  if dirX ~= 0 then
    self.dx = math.max(math.min(self.dx + dirX * self.acc * dt, self.maxSpeed), -self.maxSpeed)
    self.flipX = dirX < 0
  else
    self.dx = self.dx * self.dcc
  end

  -- apply movements
  local new_x, new_y, cols, len = world:move(self, self.x + self.dx, self.y + self.dy)
  
  --check collisions
  self:checkCollisions(cols)

  --set state
  if self.grounded then
    if dirX == 0 then
      self:setState "idle"
    else
      self:setState "run"
    end
  else
    if new_y < self.y then
      self:setState "jump"
    else
      self:setState "fall"
    end
  end

  self.x = new_x
  self.y = new_y
end

function Player:checkCollisions(cols)
  local cAbove, cBelow, cLeft, cRight
  for _, col in ipairs(cols) do
    cRight = col.normal.x < 0 or cRight
    cLeft = col.normal.x > 0 or cLeft
    cAbove = col.normal.y > 0 or cAbove
    cBelow = col.normal.y < 0 or cBelow
  end

  if cBelow then
    self.gravity = 0
    self.canJump = true
    self.grounded = true
  else
    self.grounded = false
  end

  if cAbove then
    self.gravity = self.gravity * 0.3
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
    self.grounded = false
  end
end

return Player