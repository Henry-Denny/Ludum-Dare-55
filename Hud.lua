--- @diagnostic disable: lowercase-global

_G.love = require "love"

require "StatBar"

Display = require "Display"

function Hud()
	local window = Display.window
	local hud = {
		padding = 30,
		spacing = 30,
		statbar = { width = 200, height = 20 }
	}

	statbar_start_x, statbar_start_y = window.width - (hud.statbar.width + hud.padding), hud.padding

	return {
		--[[ PROPERTIES ]]
		health_bar = StatBar:new(
			statbar_start_x, statbar_start_y,
			hud.statbar.width, hud.statbar.height,
			{ 1, 0, 0 },
			"Health"
		),
		mana_bar = StatBar:new(
			statbar_start_x, statbar_start_y + hud.spacing,
			hud.statbar.width, hud.statbar.height,
			{ 0, 0, 1 },
			"Mana"
		),

		--[[ METHODS ]]
		draw = function(self, current_health, max_health, current_mana, max_mana)
			self.health_bar:draw(current_health, max_health)
			self.mana_bar:draw(current_mana, max_mana)
		end,
	}
end

return Hud
