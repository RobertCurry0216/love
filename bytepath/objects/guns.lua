guns = {
  Neutral = {
    shoot = function(shooter, area)
      local px, py = V.rotate(shooter.dir, shooter.size*1.5, 0)
      area:addObject("ShootEffect", shooter.cx+px, shooter.cy+py, shooter)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir)
    end,
    ammoCost = 0,
    coolDown = 0.24,
    abbr = "N",
    color = hp_color
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
    abbr = "2",
    color = ammo_color
  },
  Triple = {
    shoot = function(shooter, area)
      local px, py = V.rotate(shooter.dir, shooter.size*1.5, 0)
      area:addObject("ShootEffect", shooter.cx+px, shooter.cy+py, shooter)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir+math.pi/8, boost_color)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir-math.pi/8, boost_color)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir, boost_color)
    end,
    ammoCost = 3,
    coolDown = 0.32,
    abbr = "3",
    color = boost_color
  },
  Rapid = {
    shoot = function(shooter, area)
      local px, py = V.rotate(shooter.dir, shooter.size*1.5, 0)
      area:addObject("ShootEffect", shooter.cx+px, shooter.cy+py, shooter)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir, default_color)
    end,
    ammoCost = 1,
    coolDown = 0.12,
    abbr = "R",
    color = default_color
  },
  Spread = {
    shoot = function(shooter, area)
      local px, py = V.rotate(shooter.dir, shooter.size*1.5, 0)
      area:addObject("ShootEffect", shooter.cx+px, shooter.cy+py, shooter)
      area:addObject("Projectile", shooter.cx+px, shooter.cy+py, shooter.dir+random(-math.pi/8, math.pi/8), default_color)
    end,
    ammoCost = 1,
    coolDown = 0.16,
    abbr = "RS",
    color = default_color
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
    abbr = "Ba",
    color = skill_point_color
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
    abbr = "Si",
    color = boost_color
  },
  Homing = {
    shoot = function(shooter, area)
      local px, py = V.rotate(shooter.dir, shooter.size*1.5, 0)
      area:addObject("ShootEffect", shooter.cx+px, shooter.cy+py, shooter)
      area:addObject("HomingProjectile", shooter.cx+px, shooter.cy+py, shooter.dir, skill_point_color)
      
    end,
    ammoCost = 4,
    coolDown = 0.56,
    abbr = "H",
    color = skill_point_color
  }
}