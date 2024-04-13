---@diagnostic disable: lowercase-global
love = require "love"

require("StatBar")

local Player = require "Player"
local Display = require "Display"


function love.load()
	mouse = { x = 0, y = 0 }

	player = Player()

	local window = Display.window
	local hud = Display.hud
	health_bar = StatBar:new(
		window.width - (hud.statbar.width + hud.padding), hud.padding,
		hud.statbar.width, hud.statbar.height,
		{ 1, 0, 0 },
		"Health"
	)
	mana_bar = StatBar:new(
		window.width - (hud.statbar.width + hud.padding), hud.padding + hud.spacing,
		hud.statbar.width, hud.statbar.height,
		{ 0, 0, 1 },
		"Mana"
	)
end

function love.update(dt)
	mouse.x, mouse.y = love.mouse.getPosition()
	player:move(dt)
end

function love.draw()
	player:draw()
	health_bar:draw()
	mana_bar:draw()

	-- Add FPS to top right of screen for debugging purposes
	love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
end
