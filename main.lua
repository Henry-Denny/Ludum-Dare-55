---@diagnostic disable: lowercase-global
love = require "love"

require("StatBar")

local Player = require "Player"
local Hud = require "Hud"

-- [[ LÖVE callbacks ]]
function love.load()
	mouse = { x = 0, y = 0 }

	player = Player()

	hud = Hud()
end

function love.update(dt)
	mouse.x, mouse.y = love.mouse.getPosition()
	player:move(dt)
end

function love.draw()
	player:draw()
	-- Draw health and mana bars
	hud:draw(player.health, player.max_health, player.mana, player.max_mana)

	-- Add FPS to top right of screen for debugging purposes
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
end
