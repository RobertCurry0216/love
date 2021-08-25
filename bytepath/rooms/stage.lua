Stage = Room:extend()

function Stage:new()
  self.main_canvas = love.graphics.newCanvas(gw, gh)
  self.area = Area(self)
  self.area:addCollisionWorld()
  self.player = self.area:addObject("Player", gw/2, gh/2)
  self.director = Director(self)
  self.score = 0
end

function Stage:update(dt)
  camera.smoother = Camera.smooth.damped(5)
  camera:lockPosition(dt, gw/2, gh/2)
  self.director:update(dt)
  self.area:update(dt)
end

function Stage:draw()
  love.graphics.setCanvas(self.main_canvas)
  love.graphics.clear(background_color)
    camera:attach(0,0,gw,gh)
    self.area:draw()
    camera:detach()
  
    -- draw ui
    -- score
    love.graphics.setColor(skill_point_color)
    love.graphics.setFont(fonts.m5x7_16)
    love.graphics.print(padLeft(self.score, 8, "0"),10,10)

    local p = current_room.player
    local d = self.director

    drawUIBar(gw/2-50, 25, p.ammo.."/"..p.ammoMax, "AMMO", p.ammo/p.ammoMax, ammo_color)
    drawUIBar(gw/2+50, 25, math.floor(p.boost).."/"..p.boostMax, "BOOST", p.boost/p.boostMax, boost_color)

    drawUIBar(gw/2-50, gh-25, "HP", p.hp.."/"..p.hpMax, p.hp/p.hpMax, hp_color)
    drawUIBar(gw/2+50, gh-25, "CYCLE", "", d.roundTimer/d.roundDuration, default_color)


  love.graphics.setCanvas()

  love.graphics.setColor(1,1,1,1)
  love.graphics.setBlendMode("alpha", "premultiplied")
  love.graphics.draw(self.main_canvas, 0,0,0,sx,sy)
  love.graphics.setBlendMode("alpha")

end

function Stage:finish()
  timer:after(1, function()
    gotoRoom("Stage")
  end)
end

