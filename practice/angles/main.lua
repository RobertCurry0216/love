function love.load()
  ship = {
    x=300,
    y=300,
    speed=200,
    angle=0,
    image=love.graphics.newImage("assets/ship.png"),
  }
end

function getDistance(_x1, _y1, _x2, _y2)
  local _horiz = _x1 - _x2
  local _vert = _y1 - _y2
  return math.sqrt(_horiz^2 + _vert^2)
end

function love.update(dt)
  mouse_x, mouse_y = love.mouse.getPosition()
  ship.angle = math.atan2(mouse_y - ship.y, mouse_x - ship.x)
  
  local cos = math.cos(ship.angle)
  local sin = math.sin(ship.angle)

  if getDistance(ship.x, ship.y, mouse_x, mouse_y) > 10 then
    ship.x = ship.x + ship.speed * cos * dt
    ship.y = ship.y + ship.speed * sin * dt
  end

end

function love.draw()
  love.graphics.draw(
    ship.image,
    ship.x, 
    ship.y, 
    ship.angle + math.pi / 2,
    2,
    2,
    16,
    16
  )

  love.graphics.circle(
    "line",
    ship.x, 
    ship.y, 
    10
  )

end