--- @diagnostic disable: lowercase-global

_G.love = require("love")

local function get_quads(sprite_size, sprite_count)
	quads = {}
	for i = 1, sprite_count do
		quads[i] = love.graphics.newQuad(sprite_size * (i - 1), 0, sprite_size, sprite_size, sprite_size, sprite_size)
	end
	return quads
end

---@class SpriteSheet
-- A simple class for creating one dimensional sprite sheets.
SpriteSheet = {}

---@return SpriteSheet
function SpriteSheet:new(path, sprite_size, sprite_count)
	newObj = {
		image = love.graphics.newImage(path),
		sprite_size = sprite_size,
		sprite_count = sprite_count,
		quads = get_quads(sprite_size, sprite_size),
	}
	self.__index = self
	return setmetatable(newObj, self)
end
