local shake = {}

player_hit_shake    = false
enemy_hit_shake     = false
menu_shake          = false
boss_shake = {}
boss_shake[1]        = false
boss_shake[2]        = false
boss_shake[3]        = false

after_shake_manitude    = 2
enemy_shake_manitude    = 10
player_shake_manitude   = 5
menu_shake_manitude     = 1
boss_shake_manitude     = 1

after_shake_duration    = 1
enemy_shake_duration    = 1
player_shake_duration   = 4
menu_shake_duration     = 0.5
boss_shake_duration     = 1

local t_enemy = 0
local t_player = 0

function screen_shake_update(dt)
    if enemy_hit_shake == true then
        if t_enemy < enemy_shake_duration then
            t_enemy = t_enemy + dt
        else
           enemy_hit_shake = false
            t_enemy = 0 
        end
    end
    if player_hit_shake == true then
        if t_player < player_shake_duration then
            t_player = t_player + dt
        else
            player_hit_shake = false
            t_player = 0
        end
    end
end

function screen_shake_draw()
    if Player.afterburner == true then
        local dx = love.math.random(-after_shake_duration, after_shake_duration)
        local dy = love.math.random(-after_shake_duration, after_shake_duration)
        love.graphics.translate(dx, dy)
    end
    if t_enemy < enemy_shake_duration and enemy_hit_shake == true then
        local dx = love.math.random(-enemy_shake_duration, enemy_shake_duration)
        local dy = love.math.random(-enemy_shake_duration, enemy_shake_duration)
        love.graphics.translate(dx, dy)
    end
    if t_player < player_shake_duration and player_hit_shake == true then
        local dx = love.math.random(-player_shake_duration, player_shake_duration)
        local dy = love.math.random(-player_shake_duration, player_shake_duration)
        love.graphics.translate(dx, dy)
    end
    if  menu_shake == true then
        local dx = love.math.random(-menu_shake_duration, menu_shake_duration)
        local dy = love.math.random(-menu_shake_duration, menu_shake_duration)
        love.graphics.translate(dx, dy)
    end
    if  boss_shake[1] == true then
        local dx = love.math.random(-boss_shake_duration, boss_shake_duration)
        local dy = 0
        love.graphics.translate(dx, dy)
    end
    if  boss_shake[3] == true then
        local dy = love.math.random(-boss_shake_duration, boss_shake_duration)
        local dx = 0
        love.graphics.translate(dx, dy)
    end
    if  boss_shake[2] == true then
        local dx = love.math.random(-boss_shake_duration, boss_shake_duration)
        local dy = love.math.random(-boss_shake_duration, boss_shake_duration)
        love.graphics.translate(dx, dy)
    end
end

return shake