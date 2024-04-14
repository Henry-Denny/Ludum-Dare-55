--- @diagnostic disable: lowercase-global

_G.love = require "love"

Display = {
	window = {
		width = love.graphics.getWidth(),
		height = love.graphics.getHeight(),
	},
}

return Display
