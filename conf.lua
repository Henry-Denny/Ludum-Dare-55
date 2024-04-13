-- INFO: This is a special configuration file that is run before the other LÖVE modules are loaded.
function love.conf(app)
	-- Version of the game
	-- t.version = "1.0.0"

	-- Set window properties
	app.window.title = "<GAME NAME>"
	app.window.width = 1280
	app.window.height = 720
	app.window.resizable = false

	-- Remove unused modules (reduces startup time)
	app.modules.physics = false
	app.modules.joystick = false
	app.modules.touch = false
end
