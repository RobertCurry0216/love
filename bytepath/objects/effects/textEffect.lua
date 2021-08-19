TextEffect = GameObject:extend()

function TextEffect:new(area, x, y, t, opts)
  TextEffect.super.new(self, area, x, y)
  opts = opts or {}
  self.collidable = false
  self.depth = 80
  self.color = opts.color or default_color
  self.text = t
  self.chars = {}
  for i=1,#t do table.insert(self.chars, t:utf8sub(i,i)) end
end

function TextEffect:draw()
  love.graphics.setColor(self.color)
  draft:rhombus(self.x, self.y, self.size, self.size, "fill")
  love.graphics.setColor(default_color)
end
