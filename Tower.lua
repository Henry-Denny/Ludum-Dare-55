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
	sprites = SpriteSheet:new("/Assets/Tower files/Tower.png", 64, 1),
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
	local world_size = {
		x = self.size * CELL_SIZE,
		y = self.size * CELL_SIZE,
	}
	-- Display functional / distroyed castle based on current state
	if not self.destroyed then
		love.graphics.setColor(1, 0, 0)
		love.graphics.rectangle("line", world_pos.x, world_pos.y, world_size.x, world_size.y)
		love.graphics.setColor(1, 1, 1)
		self.sprites:draw_sprite(1, world_pos.x, world_pos.y)
	else
		love.graphics.setColor(0.2, 0.2, 0.2)
		love.graphics.rectangle("line", world_pos.x, world_pos.y, world_size.x, world_size.y)
		love.graphics.setColor(1, 1, 1)
		self.sprites:draw_sprite(2, world_pos.x, world_pos.y)
	end
end
