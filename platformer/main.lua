function love.load()
  player1 = {
      x = 100,
      y = 100,
      size = 25,
      image = love.graphics.newImage("face.png")
  }

  player2 = {
      x = 300,
      y = 100,
      size = 25,
      image = love.graphics.newImage("face.png")
  }

  coins = {}

  for i=1,25 do
      table.insert(coins,
          {
              x = math.random(50, 650),
              y = math.random(50, 450),
              size = 10,
              image = love.graphics.newImage("dollar.png")
          }
      )
  end

  score1 = 0
  score2 = 0

  screenCanvas = love.graphics.newCanvas(300, 400)
end

function love.update(dt)
  if love.keyboard.isDown("left") then
      player1.x = player1.x - 200 * dt
  elseif love.keyboard.isDown("right") then
      player1.x = player1.x + 200 * dt
  end

  if love.keyboard.isDown("up") then
      player1.y = player1.y - 200 * dt
  elseif love.keyboard.isDown("down") then
      player1.y = player1.y + 200 * dt
  end

  if love.keyboard.isDown("a") then
      player2.x = player2.x - 200 * dt
  elseif love.keyboard.isDown("d") then
      player2.x = player2.x + 200 * dt
  end

  if love.keyboard.isDown("w") then
      player2.y = player2.y - 200 * dt
  elseif love.keyboard.isDown("s") then
      player2.y = player2.y + 200 * dt
  end

  for i=#coins,1,-1 do
      if checkCollision(player1, coins[i]) then
          table.remove(coins, i)
          player1.size = player1.size + 1
          score1 = score1 + 1
      elseif checkCollision(player2, coins[i]) then
          table.remove(coins, i)
          player2.size = player2.size + 1
          score2 = score2 + 1
      end
  end
end

function love.draw()
  local gfx = love.graphics
  gfx.setCanvas(screenCanvas)
  gfx.clear()
  drawGame(player1)
  gfx.setCanvas()
  gfx.draw(screenCanvas)

  gfx.setCanvas(screenCanvas)
  gfx.clear()
  drawGame(player2)
  gfx.setCanvas()
  gfx.draw(screenCanvas, 300)

  gfx.line(300,0,300,400)

  gfx.print("Player 1 - " .. score1, 10, 10)
  gfx.print("Player 2 - " .. score2, 10, 30)
end

function drawGame(focus)
  local gfx = love.graphics
  gfx.push()
  gfx.translate(-focus.x + 150, -focus.y + 200)

  gfx.circle("line", player1.x, player1.y, player1.size)
  gfx.draw(player1.image, player1.x, player1.y, 0, 1, 1, player1.image:getWidth()/2, player1.image:getHeight()/2)

  gfx.circle("line", player2.x, player2.y, player2.size)
  gfx.draw(player2.image, player2.x, player2.y, 0, 1, 1, player2.image:getWidth()/2, player2.image:getHeight()/2)

  for i,v in ipairs(coins) do
    gfx.circle("line", v.x, v.y, v.size)
    gfx.draw(v.image, v.x, v.y, 0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
  end

  gfx.pop()
end

function checkCollision(p1, p2) 
  -- Calculating distance in 1 line
  -- Subtract the x's and y's, square the difference, sum the squares and find the root of the sum.
  local distance = math.sqrt((p1.x - p2.x)^2 + (p1.y - p2.y)^2)
  -- Return whether the distance is lower than the sum of the sizes.
  return distance < p1.size + p2.size
end