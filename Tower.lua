--- @diagnostic disable: lowercase-global

_G.love = require "love"

---@class Tower
---@field pos table
---@field size table
Tower = {
	--- these fields were copied from the statbar file and may need to be removed
	border = {
		padding = 4,
		colour = { r = 0.2, g = 0.2, b = 0.2 },
	},
}

---@param pos_x integer
---@param pos_y integer
---@param max_health integer maximum health
---@param attack_speed integer attack speed (units of damage per frames)
---@param damage integer the damage done by each attack (units of health)
---@param range integer range of attack
---@return Tower
function Tower:new(pos_x, pos_y, max_health, attack_speed, damage, range)
	local SPRITE_SIZE = 64 --Sets the size of the Tower

	newObj = {
		pos = { x = pos_x, y = pos_y },
		size = { w = SPRITE_SIZE, h = SPRITE_SIZE },
		max_health = max_health,
        attack_speed = attack_speed,
		health = max_health, --initialise the health to max_health
		damage = damage, --important to note that when calling it would be self.damage 
		timer = 0, --timer to keep track of when to attack
		range = range
	}
	self.__index = self
	return setmetatable(newObj, self)
end

-- Tower takes damage, where damage is an integer
function Tower:takeDamage(damage)
    self.health = self.health - damage
    if self.health <= 0 then
        self:die()
    end
end

-- Tower is destroyed (need to add code to change the spritesheet to destroyed, maybe drop loot
function Tower:die()
    self.health = 0
end

-- NEED MORE WORK HERE
function Tower:attack(target)
    -- Attack a target (only if it has the same class format!)
	-- The "target" is the object being attacked eg. player, ally minion, etc. 
	local dx = self.pos.x - target.pos.x
	local dy = self.pos.y - target.pos.y
	local distance = math.sqrt(dx * dx + dy *dy)
	if type(target) == 'table' and type(target.takeDamage) == 'function' then
		if distance <= self.range then
        	target:takeDamage(self.damage)
		end
    end
end

function Tower:draw()
	love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.W, self.size.h)

	-- Bar shadow
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("fill", self.pos.x + pad, self.pos.y + pad, self.size.w - (pad * 2),
		self.size.h - (pad * 2))

	-- Bar
	love.graphics.setColor(self.colour.r, self.colour.g, self.colour.b)
	love.graphics.rectangle("fill", self.pos.x + pad, self.pos.y + pad, self.size.w * ratio - (pad * 2),
		self.size.h - (pad * 2))
end