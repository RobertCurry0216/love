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

function outsideScreen(x,y)
  return x < 0 or y < 0 or x > gw or y > gh
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