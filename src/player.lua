local player = {}

function player_init()
    Player              = {}
    Player.texture      = planes_sprite[13]
    Player.x            = love.graphics.getWidth()/2
    Player.y            = love.graphics.getHeight()/2
    Player.size         = 1
    Player.speed        = 50 
    Player.r            = 0
    Player.afterburner  = false
    Player.afttexture   = flame_sprite
    Player.aftsound     = afterburner_sound
  end

function player_draw()
    love.graphics.draw(Player.texture, Player.x, Player.y, Player.r, Player.size, Player.size)
    if Player.afterburner == true then
        love.graphics.draw(Player.afttexture, Player.x + 11.5, Player.y + 55, -1.570796, 0.15, 0.05)
        love.audio.play(Player.aftsound)
    else
        love.audio.stop(Player.aftsound)
    end
end

return player