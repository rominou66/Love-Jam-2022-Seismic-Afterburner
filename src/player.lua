local player = {}

function player_init()
    Player              = {}
    Player.texture      = planes_sprite[1]
    Player.x            = love.graphics.getWidth()/2
    Player.y            = love.graphics.getHeight()/2
    Player.size         = 2
    Player.speed        = 200
    Player.speed_af     = 300
    Player.r            = 0
    Player.afterburner  = false
    Player.afttexture   = flame_sprite
    Player.aftsound     = afterburner_sound
    Player.collision_w  = 20
    Player.collision_h  = 27
    Player.health       = 3
  end

function player_draw()
    love.graphics.draw(Player.texture, Player.x, Player.y, Player.r, Player.size, Player.size)
        --debug collision box
        --love.graphics.setColor(1,0.1,0.1)
        --love.graphics.rectangle("line", Player.x + 9, Player.y + 4, Player.texture:getWidth() + 10, Player.texture:getHeight() + 10)
    if Player.afterburner == true then
        love.graphics.draw(Player.afttexture, Player.x + 26.5, Player.y + 61, 0, 0.25, 1)
        love.audio.play(Player.aftsound)
    else
        love.audio.stop(Player.aftsound)
    end
end

function player_logic()
    if is_hit == true then
        Player.health = Player.health - 1
        is_hit = false
        new_explosion = {x = Player.x + 11, y = Player.y + 10, frame = 3, currdt = 0, prevdt = 0, timedt = 0}
        table.insert(explosions, new_explosion)
    end
    if Player.health == 0 then
        End_Game = true
    end
end


return player