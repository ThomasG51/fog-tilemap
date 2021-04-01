-- display logs in console during execution
io.stdout:setvbuf('no')

-- Pixel Art mode
love.graphics.setDefaultFilter("nearest")

-- General Math
function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end

local map = require 'map'
local hero = require 'hero'


function love.load()
  love.window.setMode(1024,768)
  windowWidth = love.graphics.getWidth()
  windowHeight = love.graphics.getHeight()
  
  map.load()
  hero.clearFog(map)
end


function love.update(dt)
  hero.update(dt, map)
  hero.clearFog(map)
end


function love.draw()
  map.draw()
  map.log()
  
  hero.draw(map)
end


function love.keypressed(key)
end