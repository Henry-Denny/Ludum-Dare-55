--- @diagnostic disable: lowercase-global

_G.love = require "love"

function Player()
	local SPRITE_SIZE = 32

	return {
		pos = { x = 0, y = 0 },
		speed = 200,

		draw = function(self)
			love.graphics.setColor(1, 1, 1)
			love.graphics.circle(
				"fill",
				self.pos.x,
				self.pos.y,
				SPRITE_SIZE
			)
		end,

		move = function(self, dt)
			-- Get keyboard state and update position
			if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
				self.pos.y = self.pos.y - self.speed * dt
			elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
				self.pos.y = self.pos.y + self.speed * dt
			end
			if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
				self.pos.x = self.pos.x - self.speed * dt
			elseif love.keyboard.isDown("d") or love.keyboard.isDown("right") then
				self.pos.x = self.pos.x + self.speed * dt
			end
		end
	}
end

return Player
