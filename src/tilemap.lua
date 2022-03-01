local tilemap = {}

-- map variables
--size in tile
back_map_w = 24

map_h = 45
--init x to 0
back_map_x = 0
back_map_y = 0
--load off screen 2 tile for smooth scroling
local map_display_buffer = 2
--number of tile to render on display
map_display_w = 24
map_display_h = 45
--size of a tile
tile_h = 16
tile_w = 16

back_scroll_speed = 25

function tilemap_scroll(dt)
  back_map_y = back_map_y + back_scroll_speed * dt

  if back_map_y > back_map_picture:getHeight() then
    back_map_y = back_map_y - back_map_picture:getHeight() 
  end
end

function back_map_draw()
  love.graphics.draw(back_map_picture, 0, back_map_y, 0, 1, 1, 0)
  love.graphics.draw(back_map_picture, 0, back_map_y - back_map_picture:getHeight())
end

  return tilemap