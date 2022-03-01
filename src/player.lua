local player = {}

function player_init()
    Player              = {}
    Player.texture      = planes_sprite[1]
    Player.x            = love.graphics.getWidth()/2
    Player.y            = love.graphics.getHeight()/2
    Player.size         = 2
    Player.speed        = 75 
    Player.r            = 0
    Player.afterburner  = false
    Player.afttexture   = flame_sprite
    Player.aftsound     = afterburner_sound
  end

function player_draw()
    love.graphics.draw(Player.texture, Player.x, Player.y, Player.r, Player.size, Player.size)
    if Player.afterburner == true then
        love.graphics.draw(Player.afttexture, Player.x + 26.5, Player.y + 61, 0, 0.25, 1)
        love.audio.play(Player.aftsound)
    else
        love.audio.stop(Player.aftsound)
    end
end

return player