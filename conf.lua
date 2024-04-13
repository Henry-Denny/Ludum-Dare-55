-- INFO: This is a special configuration file that is run before the other LÖVE modules are loaded.
function love.conf(t)
	-- Version of the game
	-- t.version = "1.0.0"

	-- Set window properties
	t.window.title = "<GAME NAME>"
	t.window.width = 1280
	t.window.height = 720
	t.window.resizable = false

	-- Remove unused modules (reduces startup time)
	t.modules.physics = false
	t.modules.joystick = false
	t.modules.touch = false
end
