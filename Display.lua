--- @diagnostic disable: lowercase-global

_G.love = require "love"

Display = {
	window = {
		width = love.graphics.getWidth(),
		height = love.graphics.getHeight(),
	},
	hud = {
		padding = 30,
		spacing = 30,
		statbar = { width = 200, height = 20 }
	},
}

return Display
