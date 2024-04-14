--- @diagnostic disable: lowercase-global

_G.love = require "love"

-- TODO: Move this into a file which can be included in other modules
_G.CELL_SIZE = 32

---@class Tower
---@field sprite table
---@field pos table
---@field size integer
---@field destroyed boolean
Tower = {
	sprite = {
		sheet = love.graphics.newImage("Assets/SS-Player/Wizard facing up.png"),
		count = 2,
		size = 64,
	}
}

---@param grid_pos_x integer
---@param grid_pos_y integer
---@param grid_size integer
---@return Tower
function Tower:new(grid_pos_x, grid_pos_y, grid_size)
	newObj = {
		pos = { x = grid_pos_x, y = grid_pos_y },
		size = grid_size,
		destroyed = false,
	}
	self.__index = self
	return setmetatable(newObj, self)
end

function Tower:draw()
	local world_pos = {
		x = self.pos.x * CELL_SIZE,
		y = self.pos.y * CELL_SIZE
	}
end
