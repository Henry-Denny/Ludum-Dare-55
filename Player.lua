--- @diagnostic disable: lowercase-global

_G.love = require "love"

function Player()
	local SPRITE_SIZE = 32

	local sprite_sheet = love.graphics.newImage("/Assets/SS-Player/Wizard facing up.png")
	local SHEET_COLS, SHEET_ROWS = 2, 1

	local sheet_width, sheet_height = sprite_sheet:getWidth(), sprite_sheet:getHeight()
	local sprite_width, sprite_height = sheet_width / SHEET_COLS, sheet_height / SHEET_ROWS
	local first_sprite = love.graphics.newQuad(0, 0, sprite_width, sprite_height, sprite_sheet)

	local direction = "up"
	return {
		--[[ PROPERTIES ]]
		pos = { x = 0, y = 0 },
		speed = 200,
		max_health = 100,
		health = 100, -- TODO: Find a better way to set two variables to same value
		max_mana = 100,
		mana = 100,

		--[[ METHODS ]]
		draw = function(self)
			love.graphics.setColor(1, 1, 1)
			love.graphics.circle(
				"fill",
				self.pos.x,
				self.pos.y,
				SPRITE_SIZE
			)

			local sprite_pick = first_sprite
			local x_scale, y_scale = 2, 2

			local x_shift  = sprite_width * x_scale / 2
			local y_shift  = sprite_height * y_scale / 2

			local x_origin = self.pos.x
			local y_origin = self.pos.y
			local rotation = 0
			if direction == "up" then
				rotation = 0
				x_origin = self.pos.x - x_shift
				y_origin = self.pos.y - y_shift
			elseif direction == "right" then
				rotation = 1
				x_origin = self.pos.x + x_shift
				y_origin = self.pos.y - y_shift
			elseif direction == "down" then
				rotation = 2
				x_origin = self.pos.x + x_shift
				y_origin = self.pos.y + y_shift
			elseif direction == "left" then 
				rotation = 3
				x_origin = self.pos.x - x_shift
				y_origin = self.pos.y + y_shift
			end

			love.graphics.draw(sprite_sheet, sprite_pick, x_origin, y_origin, math.pi * rotation/2, x_scale, y_scale)
		end,

		move = function(self, dt)
			-- Get keyboard state and update position
			if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
				self.pos.y = self.pos.y - self.speed * dt
				direction = "up"
			elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
				self.pos.y = self.pos.y + self.speed * dt
				direction = "down"
			end
			if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
				self.pos.x = self.pos.x - self.speed * dt
				direction = "left"
			elseif love.keyboard.isDown("d") or love.keyboard.isDown("right") then
				self.pos.x = self.pos.x + self.speed * dt
				direction = "right"
			end
		end
	}
end

return Player
