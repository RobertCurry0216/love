TextEffect = GameObject:extend()

function TextEffect:new(area, x, y, t, f, c)
  TextEffect.super.new(self, area, x, y)
  self.collidable = false
  self.vis = true
  self.depth = 80
  self.font = f
  self.chars = {}
  self.color = c
  for i=1,#t do table.insert(self.chars, t:utf8sub(i,i)) end

  --colors
  self.bgColors = {}
  self.fgColors = {}
  for i=1,#t do
    self.bgColors[i] = nil
    self.fgColors[i] = c
  end

  --anim timers
  self.timer:after(0.7, function()
    self.timer:every(0.05, function() self.vis = not self.vis end, 6)
    self.timer:every(0.035, function() self:scramble() end)
  end)
  self.timer:after(1.1, function() self:destroy() end)
end

function TextEffect:draw()
  --flash
  if not self.vis then return end

  love.graphics.setFont(self.font)
  local w = 0
  local yOff = self.font:getHeight()/2
  for i, c in ipairs(self.chars) do
    --background
    if self.bgColors[i] then
      love.graphics.setColor(self.bgColors[i])
      love.graphics.rectangle(
        'fill',
        self.x+w,
        self.y-yOff,
        self.font:getWidth(c),
        self.font:getHeight()
      )
    end
    --forground
    love.graphics.setColor(self.fgColors[i])
    love.graphics.print(c, self.x+w, self.y, 0,1,1,0,yOff)
    w = w+self.font:getWidth(c)
  end
  love.graphics.setColor(default_color)
end

function TextEffect:scramble() 
  local rndChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%&<>{}()[]"
  for i,c in ipairs(self.chars) do
    --scramble chars
    if love.math.random(20) <= 1 then
      local rnd = love.math.random(#rndChars)
      self.chars[i] = rndChars:utf8sub(rnd, rnd)
    end
    --scramble color
    if love.math.random(10) <= 1  then
      self.bgColors[i] = all_colors[love.math.random(#all_colors)]
    else
      self.bgColors[i] = nil
    end

    if love.math.random(10) <= 1 then
      self.fgColors[i] = all_colors[love.math.random(#all_colors)]
    else
      self.fgColors[i] = self.color
    end
  end
end