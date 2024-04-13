--- @diagnostic disable: lowercase-global

_G.love = require "love"

---@class StatBar
---@field text string
---@field pos table
---@field size table
---@field colour table
StatBar = {
	border = {
		padding = 4,
		colour = { r = 0.2, g = 0.2, b = 0.2 },
	},
}

---@param pos_x integer
---@param pos_y integer
---@param width integer
---@param height integer
---@param colour table The colour of the stat bar as { r, g, b } with 0 <= r, g, b <= 1
---@param text? string What the stat bar represents (health, mana, etc.). If this is not provided then no text will be displayed.
---@return StatBar
function StatBar:new(pos_x, pos_y, width, height, colour, text)
	newObj = {
		text = text,
		pos = { x = pos_x, y = pos_y },
		size = { w = width, h = height },
		colour = { r = colour[1], g = colour[2], b = colour[3] }
	}
	self.__index = self
	return setmetatable(newObj, self)
end

---@param current integer The currnet value of the stat being displayed (e.g. `player.health`)
---@param max integer The maximum value the stat can be (e.g. `player.max_health)
function StatBar:draw(current, max)
	local ratio = current / max
	local bg = StatBar.border.colour
	local pad = StatBar.border.padding

	-- Border
	love.graphics.setColor(bg.r, bg.g, bg.b)
	love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.w, self.size.h)
	-- Bar shadow
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("fill", self.pos.x + pad, self.pos.y + pad, self.size.w - (pad * 2),
		self.size.h - (pad * 2))
	-- Bar
	love.graphics.setColor(self.colour.r, self.colour.g, self.colour.b)
	love.graphics.rectangle("fill", self.pos.x + pad, self.pos.y + pad, self.size.w * ratio - (pad * 2),
		self.size.h - (pad * 2))
end
