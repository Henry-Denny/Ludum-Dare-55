--- @diagnostic disable: lowercase-global
_G.love = require "love"

local Player = require "Player"

function love.load()
	_G.mouse = { x = 0, y = 0 }

	player = Player()
end

function love.update(dt)
	mouse.x, mouse.y = love.mouse.getPosition()
	player:move(dt)
end

function love.draw()
	player:draw()

	-- Add FPS to top right of screen for debugging purposes
	love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
end
