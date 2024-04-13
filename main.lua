--- @diagnostic disable: lowercase-global
_G.love = require "love"

function love.load()
	_G.mouse = { x = 0, y = 0 }
end

function love.update(dt)
	mouse.x, mouse.y = love.mouse.getPosition()
end

function love.draw()
end
