tick = require "lib.tick"
Player = require "actors.player"
Enemy = require "actors.enemy"

function love.load()
	rect = Enemy(160, 200)
	player = Player(160, 30)
end

function love.update(dt)
	tick.update(dt)
	player:update(dt)
	rect:update(dt)
	for k, v in ipairs(Bullets) do
		v:update(dt)
		v.dead = v:collidesWith(rect)
		if v.dead then
			table.remove(Bullets, k)
			print("hit")
		end
		if v.y > 250 then
			table.remove(Bullets, k)
		end
	end
end

function love.keypressed(key)
	player:keypressed(key)
end

function love.draw()
	rect:draw()
	player:draw()
	for k, v in ipairs(Bullets) do
		v:draw()
	end
end