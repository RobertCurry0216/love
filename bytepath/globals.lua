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

main_colors = {
  default_color,
  background_color,
  ammo_color,
  hp_color,
  skill_point_color,
  boost_color,
  trail_color,
  dwindle_color
}

negative_colors = {}
for _,c in ipairs(main_colors) do
  table.insert( negative_colors, {1-c[1],1-c[2],1-c[3]})
end

all_colors = M.append(main_colors, negative_colors)

--fonts
fonts = {}
for i=8,16 do
  local font = love.graphics.newFont("fonts/m5x7.ttf", i)
  font:setFilter("nearest", "nearest")
  fonts["m5x7_"..i] = font
end