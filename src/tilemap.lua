local tilemap = {}

-- map variables
--size in tile
back_map_w = 24

map_h = 1000
--init x to 0
back_map_x = 0
back_map_y = 0
--load off screen 2 tile for smooth scroling
local map_display_buffer = 2
--number of tile to render on display
map_display_w = 24
map_display_h = 44
--size of a tile
tile_h = 16
tile_w = 16

back_scroll_speed = 25

function tilemap_scroll(dt)
  back_map_y = back_map_y - back_scroll_speed * dt

  if back_map_y < 0 then
		back_map_y = map_h * tile_h - love.graphics.getHeight()
	end
end

function tilemap_back_draw()
  --set offset to match the border
  offset_x = back_map_x % tile_w
  offset_y = back_map_y % tile_h
  --set the first tile position
  firstTile_x = math.floor(back_map_x / tile_w)
  firstTile_y = math.floor(back_map_y / tile_h)

  --loop through the double array and display the corresponding tile
  for y=1, (map_display_h + map_display_buffer) do
    for x=1, (map_display_w + map_display_buffer) do
      -- Note that this condition block allows us to go beyond the edge of the map.
      if y+firstTile_y >= 1 and y+firstTile_y <= map_h
      and x+firstTile_x >= 1 and x+firstTile_x <= back_map_w
      then
        love.graphics.draw(
          back_tileset[back_map[y+firstTile_y][x+firstTile_x]], 
          ((x-1)*tile_w) - offset_x - tile_w/2, 
          ((y-1)*tile_h) - offset_y - tile_h/2)
      end
    end
  end
end

return tilemap