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
---@field image love.Drawable
---@field sprite_size number
---@field sprite_count number
---@field quads table
-- A simple class for creating one dimensional sprite sheets.
SpriteSheet = {}

---@return SpriteSheet
---@param path string
---@param sprite_size integer The size of each sprite within the sheet
---@param sprite_count? integer The number of sprites in the sprite sheet (defaults to 1)
function SpriteSheet:new(path, sprite_size, sprite_count)
	sprite_count = sprite_count or 1
	newObj = {
		image = love.graphics.newImage(path),
		sprite_size = sprite_size,
		sprite_count = sprite_count,
		quads = get_quads(sprite_size, sprite_size),
	}
	self.__index = self
	return setmetatable(newObj, self)
end

---@param sprite_index integer
---@param pos_x integer
---@param pos_y integer
-- Draws a specific quad from the sprite sheet
function SpriteSheet:draw_sprite(sprite_index, pos_x, pos_y)
	love.graphics.draw(self.image, quads[sprite_index], pos_x, pos_y)
end
