_G.love = require "love"

function Camera()
	return {
		pos = { x = 0, y = 0 },
		scale = { x = 1, y = 1 },
		zoom_scale = 1.1,
		rotation = 0,

		set = function(self)
			love.graphics.push()
			love.graphics.rotate(-self.rotation)
			love.graphics.scale(1 / self.scale.x, 1 / self.scale.y)
			love.graphics.translate(-self.pos.x, -self.pos.y)
		end,

		unset = function(self)
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
			self.pos.x = x or self.pos.x
			self.pos.y = y or self.pos.y
		end,

		set_scale = function(self, sx, sy)
			self.scale.x = sx or self.scale.x
			self.scale.y = sy or self.scale.y
		end,

		mouse_position = function(self)
			return love.mouse.getX() * self.scale.x + self.pos.x, love.mouse.getY() * self.scale.y + self.pos.y
		end
	}
end

return Camera
