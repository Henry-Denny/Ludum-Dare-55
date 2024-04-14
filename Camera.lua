_G.love = require "love"
_G.window = require "Display".window

function Camera()
	return {
		pos = { x = 0, y = 0 },
		scale = { x = 1, y = 1 },
		zoom_scale = 1.1,

		set = function(self)
			love.graphics.push()
			love.graphics.translate(window.width / 2, window.height / 2)
			love.graphics.scale(1 / self.scale.x, 1 / self.scale.y)
			love.graphics.translate(-self.pos.x, -self.pos.y)
		end,

		unset = function()
			love.graphics.pop()
		end,

		move = function(self, dx, dy)
			self.pos.x = self.pos.x + (dx or 0)
			self.pos.y = self.pos.y + (dy or 0)
		end,

		zoom = function(self, sx, sy)
			sx = sx or 1
			self.scale.x = self.scale.x * sx
			self.scale.y = self.scale.y * (sy or sx)
		end,

		set_position = function(self, x, y)
			-- self.pos.x = x - (window.width / 2) or self.pos.x
			-- self.pos.y = y - (window.height / 2) or self.pos.y
			self.pos.x = x or self.pos.x
			self.pos.y = y or self.pos.y
		end,

		set_scale = function(self, sx, sy)
			self.scale.x = sx or self.scale.x
			self.scale.y = sy or self.scale.y
		end,

		mouse_position = function(self)
			return love.mouse.getX() * self.scale.x + self.pos.x - window.width / 2,
					love.mouse.getY() * self.scale.y + self.pos.y - window.height / 2
		end
	}
end

return Camera
