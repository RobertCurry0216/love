function explode(area, x, y, opts)
  opts = opts or {}
  local n = opts.n or 10
  for i=1,random(n-2,n+2) do
    area:addObject("ExplodeEffect", x, y, opts.size, opts.vel, opts.life, opts.color)
  end
end

function text(area, x, y, t, opts)
  opts = opts or {}
  local font = opts.font or fonts.m5x7_16
  local color = opts.color or default_color
  local centered = opts.centered or false
  area:addObject("TextEffect", x, y, t, font, color, centered)
end
