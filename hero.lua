local hero = {}

hero.sprites = {}
hero.sprites[1] = love.graphics.newImage('images/player_1.png')
hero.sprites[2] = love.graphics.newImage('images/player_2.png')
hero.sprites[3] = love.graphics.newImage('images/player_3.png')
hero.sprites[4] = love.graphics.newImage('images/player_4.png')
hero.activeSprite = 1
hero.positionColumn = 1
hero.positionRow = 1
hero.move = false

hero.clearFog = function(map)
  local row, column
  
  for row = (hero.positionRow - 1), (hero.positionRow + 1) do
    for column = (hero.positionColumn - 1), (hero.positionColumn + 1) do
      if row > 0 and row <= map.rows and column > 0 and column <= map.columns then
        map.fog[row][column] = 0      
      end
    end
  end
end

hero.update = function(dt, map)
  -- hero sprite animation
    hero.activeSprite = hero.activeSprite + (5 * dt)
    
    if math.floor(hero.activeSprite) > #hero.sprites then
      hero.activeSprite = 1
    end
  
  -- hero movement
  if love.keyboard.isDown('up', 'right', 'down', 'left') then
    if hero.move == false then
      local initialColum = hero.positionColumn
      local initialRow = hero.positionRow
    
      if love.keyboard.isDown('up') and hero.positionRow > 1 then
        hero.positionRow = hero.positionRow - 1
      end
      
      if love.keyboard.isDown('right') and hero.positionColumn < map.columns then
        hero.positionColumn = hero.positionColumn + 1
      end
      
      if love.keyboard.isDown('down') and hero.positionRow < map.rows then
        hero.positionRow = hero.positionRow + 1
      end
      
      if love.keyboard.isDown('left') and hero.positionColumn > 1 then
        hero.positionColumn = hero.positionColumn - 1
      end
      
      -- Collision checker
      local hoverTile = map.grid[hero.positionRow][hero.positionColumn]
      if map.isSolid(hoverTile) == true then
        hero.positionColumn = initialColum
        hero.positionRow = initialRow
      end
      
      hero.move = true
    end
  else
    hero.move = false
  end
end


hero.draw = function(map)
  love.graphics.draw(hero.sprites[math.floor(hero.activeSprite)], (hero.positionColumn - 1) * map.tileWidth, (hero.positionRow - 1) * map.tileHeight, 0, 2, 2)
end


return hero