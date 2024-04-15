---@diagnostic disable: lowercase-global
---@module "Tower"
love = require("love")

require("StatBar")
require("Tower")

local Player = require("Player")
local Camera = require("Camera")
local Hud = require("Hud")
local TilePlacer = require("TilePlacer")

val = 1

-- [[ LÖVE callbacks ]]
function love.load()
	mouse = { x = 0, y = 0 }

	player = Player()
	towers = {}
	table.insert(towers, Tower:new(0, 0, 2))
	camera = Camera()
	hud = Hud()
	tileplacer = TilePlacer()

	hp_gem = love.graphics.newImage("/Assets/Icons/hp-gem.png") -- Will clean up these later into Hud function
	mana_gem = love.graphics.newImage("/Assets/Icons/mana-gem.png")
end

function love.update(dt)
	mouse.x, mouse.y = camera:mouse_position()
	player:move(dt)
	camera:set_position(player.pos.x, player.pos.y)

	if love.keyboard.isDown("escape") then
		love.event.quit(0)
	end
end

function love.wheelmoved(x, y)
	if y > 0 then
		camera:zoom(1 / camera.zoom_scale, 1 / camera.zoom_scale)
	else
		camera:zoom(camera.zoom_scale, camera.zoom_scale)
	end
end

function love.draw()
	camera:set()
	tileplacer:tilegen(player.pos.x, player.pos.y)
	player:draw()
	for i = 1, #towers do
		towers[i]:draw()
	end
	love.graphics.rectangle("line", 0, 0, 32, 32)
	camera:unset()

	-- Draw health and mana bars
	hud:draw(player.health, player.max_health, player.mana, player.max_mana)

	-- Add FPS to top right of screen for debugging purposes
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
	love.graphics.print("player pos: (" .. player.pos.x .. ", " .. player.pos.y .. ")", 10, 30)
	love.graphics.print("mouse pos: (" .. mouse.x .. ", " .. mouse.y .. ")", 10, 50)

	love.graphics.draw(hp_gem, 1005, 18) --Will clean up these later into Hud function
	love.graphics.draw(mana_gem, 1005, 57)
end
