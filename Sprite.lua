--- @diagnostic disable: lowercase-global

_G.love = require "love"

---@class Sprite
Sprite = {}

---@return Sprite
function Sprite:new(path, sprite_size, sprite_count)
	newObj = {
		sheet =
		{
			image = love.graphics.newImage(path),
			size = sprite_size,
			count = sprite_count,
		},
		quads = get_quads(sprite_size, sprite_size)
	}
	self.__index = self
	return setmetatable(newObj, self)
end

local function get_quads(sprite_size, sprite_count)
	quads = {}
	for i = 1, sprite_count do
		quads[i] = love.graphics.newQuad(sprite_size * (i - 1), 0, sprite_size, sprite_size, sprite_size, sprite_size)
	end
	return quads
end
