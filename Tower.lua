--- @diagnostic disable: lowercase-global

_G.love = require("love")

require("SpriteSheet")

-- TODO: Move this into a file which can be included in other modules
_G.CELL_SIZE = 32

---@class Tower
---@field sprites SpriteSheet
---@field pos table
---@field size integer
---@field destroyed boolean
Tower = {
	sprites = SpriteSheet:new("Assets/SS-Player/Wizard facing up.png", 32, 1),
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
		y = self.pos.y * CELL_SIZE,
	}
	-- Display functional / distroyed castle based on current state
	if not self.destroyed then
		self.sprites:draw_sprite(1, world_pos.x, world_pos.y)
	else
		self.sprites:draw_sprite(2, world_pos.x, world_pos.y)
	end
end
