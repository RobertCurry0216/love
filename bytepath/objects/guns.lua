guns = {
  Neutral = {
    shoot = function(shooter, area)
      local px, py = V.rotate(shooter.dir, shooter.size*1.5, 0)
      area:addObject("ShootEffect", shooter.cx+px, shooter.cy+py, shooter)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir)
    end,
    ammoCost = 0,
    coolDown = 0.24,
    abbr = "N"
  },
  Double = {
    shoot = function(shooter, area)
      local px, py = V.rotate(shooter.dir, shooter.size*1.5, 0)
      area:addObject("ShootEffect", shooter.cx+px, shooter.cy+py, shooter)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir+math.pi/12, ammo_color)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir-math.pi/12, ammo_color)
    end,
    ammoCost = 2,
    coolDown = 0.32,
    abbr = "2"
  },
  Triple = {
    shoot = function(shooter, area)
      local px, py = V.rotate(shooter.dir, shooter.size*1.5, 0)
      area:addObject("ShootEffect", shooter.cx+px, shooter.cy+py, shooter)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir+math.pi/12, boost_color)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir-math.pi/12, boost_color)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir, boost_color)
    end,
    ammoCost = 3,
    coolDown = 0.32,
    abbr = "3"
  },
  Rapid = {
    shoot = function(shooter, area)
      local px, py = V.rotate(shooter.dir, shooter.size*1.5, 0)
      area:addObject("ShootEffect", shooter.cx+px, shooter.cy+py, shooter)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir, default_color)
    end,
    ammoCost = 1,
    coolDown = 0.12,
    abbr = "R"
  },
  Spread = {
    shoot = function(shooter, area)
      local px, py = V.rotate(shooter.dir, shooter.size*1.5, 0)
      area:addObject("ShootEffect", shooter.cx+px, shooter.cy+py, shooter)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir+random(-math.pi/8, math.pi/8), default_color)
    end,
    ammoCost = 1,
    coolDown = 0.16,
    abbr = "RS"
  },
  Back = {
    shoot = function(shooter, area)
      local px, py = V.rotate(shooter.dir, shooter.size*1.5, 0)
      area:addObject("ShootEffect", shooter.cx+px, shooter.cy+py, shooter)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir, skill_point_color)
      
      px, py = V.rotate(shooter.dir+math.pi, shooter.size*1.5, 0)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir+math.pi, skill_point_color)
    end,
    ammoCost = 2,
    coolDown = 0.32,
    abbr = "Ba"
  },
  Side = {
    shoot = function(shooter, area)
      local px, py = V.rotate(shooter.dir, shooter.size*1.5, 0)
      area:addObject("ShootEffect", shooter.cx+px, shooter.cy+py, shooter)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir, boost_color)
      
      px, py = V.rotate(shooter.dir+math.pi/2, shooter.size*1.5, 0)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir+math.pi/2, boost_color)
      
      px, py = V.rotate(shooter.dir-math.pi/2, shooter.size*1.5, 0)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir-math.pi/2, boost_color)
    end,
    ammoCost = 2,
    coolDown = 0.32,
    abbr = "Si"
  }
}