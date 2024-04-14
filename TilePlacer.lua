--- @diagnostic disable: lowercase-global

_G.love = require "love"

require "StatBar"

Display = require "Display"

function TilePlacer(posx, posy)
    imager = {0,255}
    imageg = {0,255}
    imageb = {0,255}
    imageref = {"/Assets/BackgroundTiles/water-lilypad.png","/Assets/BackgroundTiles/tree-1.png"}

    local imagedata = love.image.newImageData('/Assets/Maps/empty-map.png')
    local image     = love.graphics.newImage(imagedata)
    local scale = 3
	return {
        tilegen = function(self, posx, posy)
        for i = 0,10,1
        do
            for j = 0,10,1
            do
                local r, g, b = imagedata:getPixel(i, j)
                for num = 1,3,1 -- change dependant on number of tiles
                do
                    if imager[num] == r and imageg[num] == g and imageb[num] == b then
                        newtile = love.graphics.newImage(imageref[num])
                        love.graphics.push()
                        love.graphics.scale(scale, scale)
                        love.graphics.draw(newtile, ((i*32)-posx), ((j*32)-posy))
                        love.graphics.pop()
                    end
                end
            end
        end
        end

	}
end

return TilePlacer