function UUID()
  local fn = function(x)
      local r = love.math.random(16) - 1
      r = (x == "x") and (r + 1) or (r % 4) + 9
      return ("0123456789abcdef"):sub(r, r)
  end
  return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"):gsub("[xy]", fn))
end

function resize(s)
  love.window.setMode(s*gw, s*gh)
  sx, sy = s, s
end

function pushRotate(x, y, r)
  love.graphics.push()
  love.graphics.translate(x, y)
  love.graphics.rotate(r or 0)
  love.graphics.translate(-x, -y)
end

function pushRotateScale(x, y, r, sx, sy)
  love.graphics.push()
  love.graphics.translate(x, y)
  love.graphics.rotate(r or 0)
  love.graphics.scale(sx or 1, sy or sx or 1)
  love.graphics.translate(-x, -y)
end

function outsideScreen(x,y,buffer)
  buffer = buffer or 0
  return x < -buffer or y < -buffer or x > gw+buffer or y > gh+buffer
end

function slow(amount, duration)
  slow_amount = amount
  if slow_timer then timer:cancel(slow_timer) end
  slow_timer = timer:tween(duration, _G, {slow_amount=1}, "in-out-cubic", function() slow_timer = nil end)
end

function flash(frames)
  if not flash_frames or flash_frames < frames then 
    flash_frames = frames
  end
end

function createIrregularCircle(size, sides)
  sides = sides or 8
  local ang = math.pi / sides * 2
  local points = {}
  for i=1,sides do
    local x, y = V.fromPolar(ang*i, random(size*0.75,size*1.25))
    table.insert(points, x)
    table.insert(points, y)
  end
  return points
end

function padLeft(t, w, f)
  if type(t) ~= string then
    t = tostring(t)
  end
  f = f or " "
  local filled = ""
  for i=1,w do
    filled = filled..f
  end

  return filled:utf8sub(1, #filled-#t)..t
end

function drawUIBar(cx, cy, t1, t2, v, c)
  local font = fonts.m5x7_16
  local yOff = font:getHeight()/2

  local w, h = 75, 6
  local x, y = cx - w/2, cy - h/2 

  love.graphics.setFont(font)
  love.graphics.setColor(c)

  love.graphics.print(t1, cx, cy-14, 0, 1, 1, font:getWidth(t1)/2, yOff)
  love.graphics.rectangle("line", x, y, w, h)
  love.graphics.rectangle("fill", x, y, w*v, h)
  love.graphics.print(t2, cx, cy+12, 0, 1, 1, font:getWidth(t2)/2, yOff)

  love.graphics.setColor(1,1,1)
end