-- vars
slow_amount = 1
slow_timer = nil
flash_frames = 0
current_room = nil

-- colors
default_color = {222/255, 222/255, 222/255}
background_color = {16/255, 16/255, 16/255}
ammo_color = {123/255, 200/255, 164/255}
hp_color = {241/255, 103/255, 69/255}
skill_point_color = {255/255, 198/255, 93/255}
boost_color = {76/255, 195/255, 217/255}
trail_color = skill_point_color
dwindle_color = boost_color

--fonts
fonts = {}
fonts["m5x7_8"] = love.graphics.newFont("fonts/m5x7.ttf", 8)
fonts["m5x7_9"] = love.graphics.newFont("fonts/m5x7.ttf", 9)
fonts["m5x7_10"] = love.graphics.newFont("fonts/m5x7.ttf", 10)
fonts["m5x7_11"] = love.graphics.newFont("fonts/m5x7.ttf", 11)
fonts["m5x7_12"] = love.graphics.newFont("fonts/m5x7.ttf", 12)
fonts["m5x7_13"] = love.graphics.newFont("fonts/m5x7.ttf", 13)
fonts["m5x7_14"] = love.graphics.newFont("fonts/m5x7.ttf", 14)
fonts["m5x7_15"] = love.graphics.newFont("fonts/m5x7.ttf", 15)
fonts["m5x7_16"] = love.graphics.newFont("fonts/m5x7.ttf", 16)