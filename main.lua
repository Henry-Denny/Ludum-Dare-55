---@diagnostic disable: lowercase-global
love = require "love"

require("StatBar")

local Player = require "Player"
local Camera = require "Camera"
local Hud = require "Hud"

-- [[ LÖVE callbacks ]]
function love.load()
	mouse = { x = 0, y = 0 }

	player = Player()
	camera = Camera()
	hud = Hud()
end

function love.update(dt)
	camera:set_position(player.pos.x, player.pos.y)
	mouse.x, mouse.y = camera:mouse_position()
	player:move(dt)
end

function love.wheelmoved(x, y)
	if y > 0 then
		camera:zoom(1 / camera.zoom_scale, 1 / camera.zoom_scale)
	else
		camera:zoom(camera.zoom_scale, camera.zoom_scale)
	end
end

function love.draw()
	camera:set_position(player.pos.x, player.pos.y)
	camera:set()
	player:draw()
	camera:unset()
	-- Draw health and mana bars
	hud:draw(player.health, player.max_health, player.mana, player.max_mana)

	-- Add FPS to top right of screen for debugging purposes
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
	love.graphics.print(
		"player pos: (" .. player.pos.x .. ", " .. player.pos.y .. ")",
		10, 30
	)
	love.graphics.print(
		"mouse pos: (" .. mouse.x .. ", " .. mouse.y .. ")",
		10, 50
	)
end
