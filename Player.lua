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
		end
	}
end

return Player
