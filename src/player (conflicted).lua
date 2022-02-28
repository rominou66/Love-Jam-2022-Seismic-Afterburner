local player = {}

function player_init()
    player         = {}
    player.texture = planes_sprite[13]
    player.x       = love.graphics.getWidth()/2
    player.y       = love.graphics.getHeight()/2
    player.size    = 1
    player.speed   = 50 
    player.r       = 0
  end

function player_draw()
    love.graphics.draw(player.texture, player.x, player.y)
end

return player