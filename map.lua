local map = {}

map.columns = 32
map.rows = 23
map.tileWidth = 32
map.tileHeight = 32
map.tileSheet = nil
map.tiles = {}
map.tileTypes = {}
map.grid =  {
  {10, 10, 10, 10, 10, 10, 10, 10, 10, 61, 10, 13, 10, 10, 10, 10, 10, 10, 13, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15},
  {10, 10, 10, 10, 10, 11, 11, 11, 10, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 14, 15, 15, 129, 15, 15, 15, 15, 15, 15, 68, 15, 15},
  {10, 10, 61, 10, 11, 19, 19, 19, 11, 10, 10, 13, 10, 10, 169, 10, 10, 10, 10, 13, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15},
  {10, 10, 10, 11, 19, 19, 19, 19, 19, 11, 10, 13, 10, 10, 10, 10, 10, 10, 10, 10, 13, 14, 15, 15, 15, 68, 15, 15, 15, 15, 15, 15},
  {10, 10, 10, 11, 19, 19, 19, 19, 19, 11, 10, 13, 10, 10, 10, 10, 10, 10, 61, 10, 10, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15},
  {10, 10, 61, 10, 11, 19, 19, 19, 11, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 10, 10, 14, 15, 15, 129, 15, 15, 15, 68, 15, 129, 15},
  {10, 10, 10, 10, 10, 11, 11, 11, 10, 10, 61, 13, 10, 10, 10, 10, 10, 10, 10, 10, 10, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15},
  {10, 10, 10, 10, 10, 13, 13, 13, 13, 13, 13, 13, 10, 10, 10, 10, 10, 169, 10, 10, 10, 13, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15},
  {10, 10, 10, 10, 10, 10, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 61, 10, 13, 14, 14, 14, 14, 14, 14, 14, 15, 129},
  {10, 10, 10, 10, 10, 10, 10, 10, 13, 55, 10, 58, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 13, 14, 14},
  {10, 10, 10, 10, 10, 10, 10, 10, 13, 10, 10, 10, 55, 10, 58, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10},
  {10, 10, 10, 10, 10, 10, 10, 10, 13, 10, 58, 10, 10, 10, 10, 10, 10, 169, 10, 10, 10, 10, 10, 10, 61, 10, 10, 10, 10, 10, 1, 1},
  {10, 10, 10, 10, 10, 10, 10, 10, 13, 10, 10, 10, 58, 10, 10, 10, 10, 10, 10, 10, 10, 61, 10, 10, 10, 10, 10, 10, 10, 1, 37, 37},
  {13, 13, 13, 13, 13, 13, 13, 13, 13, 10, 55, 10, 10, 10, 55, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 37, 37, 37},
  {10, 10, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 55, 10, 10, 10, 10, 169, 10, 10, 10, 10, 10, 10, 10, 10, 1, 37, 37, 37, 37, 37},
  {10, 10, 10, 10, 13, 10, 10, 10, 10, 142, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 37, 37, 37, 37, 37, 37},
  {10, 10, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 10, 142, 10, 10, 10, 10, 10, 10, 10, 169, 10, 10, 1, 37, 37, 37, 37, 37, 37, 37},
  {14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 1, 37, 37, 37, 37, 37, 37, 37},
  {14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 1, 37, 37, 37, 37, 37, 37, 37},
  {19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 1, 37, 37, 37, 37, 37, 37, 37},
  {20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 1, 37, 37, 37, 37, 37, 37},
  {21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 1, 37, 37, 37, 37},
  {21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 1, 37, 37, 37}
}
map.fog = {}


map.isSolid = function(case)
  if map.tileTypes[case] == 'Tree' or
     map.tileTypes[case] == 'Yellow Tree' or
     map.tileTypes[case] == 'Fir Tree' or
     map.tileTypes[case] == 'Cactus' or
     map.tileTypes[case] == 'Leafless Tree' or
     map.tileTypes[case] == 'Rock' or
     map.tileTypes[case] == 'Volcano' or
     map.tileTypes[case] == 'Lava' or
     map.tileTypes[case] == 'Ocean' then
       return true
  end
  
  return false
end


map.load = function()
  -- tilesheet cutting (quads)
  map.tileSheet = love.graphics.newImage('images/tilesheet.png')
  
  local tileId = 1
  local row, column
  
  for row = 1, (map.tileSheet:getHeight() / map.tileHeight) do
    for column = 1, (map.tileSheet:getWidth() / map.tileWidth) do
      map.tiles[tileId] = love.graphics.newQuad((column - 1) * map.tileWidth, (row - 1) * map.tileHeight, map.tileWidth, map.tileHeight, map.tileSheet:getWidth(), map.tileSheet:getHeight())
      
      tileId = tileId + 1
    end
  end
  
  map.tileTypes[10] = 'Grass Soft'
  map.tileTypes[11] = 'Grass Hard'
  map.tileTypes[13] = 'Sand Soft'
  map.tileTypes[14] = 'Sand Medium'
  map.tileTypes[15] = 'Sand Hard'
  map.tileTypes[1] = 'Gravel'
  map.tileTypes[55] = 'Tree'
  map.tileTypes[58] = 'Yellow Tree'
  map.tileTypes[61] = 'Fir Tree'
  map.tileTypes[68] = 'Cactus'
  map.tileTypes[142] = 'Leafless Tree'
  map.tileTypes[169] = 'Rock'
  map.tileTypes[129] = 'Volcano'
  map.tileTypes[37] = 'Lava'
  map.tileTypes[19] = 'Water'
  map.tileTypes[20] = 'Water deep'
  map.tileTypes[21] = 'Ocean'
  
  -- Fog map
  map.fog = {}
  
  local row, column
  for row = 1, map.rows do
    map.fog[row] = {}
    for column = 1, map.columns do
      map.fog[row][column] = 1
    end
  end
end


map.draw = function()
  local row, column
  
  -- draw map
  for row = 1, map.rows do
    for column = 1, map.columns do
      local scope = map.grid[row][column]
      
      if map.tiles[scope] ~= nil then
        love.graphics.draw(map.tileSheet, map.tiles[scope], (column - 1) * map.tileWidth, (row - 1) * map.tileHeight)
      end
    end
  end
  
  -- draw fog
  for row = 1, map.rows do
    for column = 1, map.columns do
      if map.fog[row][column] > 0 then
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle('fill', (column - 1) * map.tileWidth, (row - 1) * map.tileHeight, map.tileWidth, map.tileHeight)
        love.graphics.setColor(255,255,255)
      end
    end
  end
end


-- Display map logs
map.log = function()
  -- tile mouse hover detection
  local mouseX = love.mouse.getX()
  local mouseY = love.mouse.getY()
  local hoverTileRow = math.floor(mouseY / map.tileHeight) + 1
  local hoverTileColumn = math.floor(mouseX / map.tileWidth) +1

  if hoverTileRow > 0 and hoverTileRow <= map.rows and hoverTileColumn > 0 and hoverTileColumn <= map.columns then
    local hoverTileId = map.grid[hoverTileRow][hoverTileColumn]
    love.graphics.print('Tile Type: '..tostring(map.tileTypes[hoverTileId])..' (id: '..tostring(hoverTileId)..')', 10, (windowHeight-25))
  else
    love.graphics.print('Out of map', 10, (windowHeight-25))
  end
end

return map