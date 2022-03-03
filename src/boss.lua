local boss_src = {}


function boss_init()
    Boss              = {}
    Boss.size         = 3
    Boss.speed        = 25 
  end

  bosses = {}
  boss_spawn = false
  all_boss_health = 0
  prev_all_boss_health = 0
  boss_bullets = {}

local prevdt = 0
local currdt = {}
local timedt = {}

function spawn_boss()
    if boss_spawn == false then
        local offset_x = 46
        for i = 1, 3 do
            new_boss = { x = offset_x, y = - 125, sprite = boss_sprite[i], is_alive = true, health = 10, shoot_timer = true, can_shoot_timer = 0, shoot_timer_max = 1}
            table.insert(bosses, new_boss)
            offset_x = offset_x + 96
        end
        boss_intro_music:play()
        boss_spawn = true
    end
end

function boss_update(dt)
    for i , boss in ipairs(bosses) do
        if boss.y < 100 then
        boss.y = boss.y + (Boss.speed * dt)
        end

        boss.can_shoot_timer = boss.can_shoot_timer - (1 * dt)
        if boss.can_shoot_timer < 0 then
          boss.shoot_timer = true
        end
    
        if boss.shoot_timer == true and In_Game == true and boss.is_alive == true  then
          -- Create some bullet
          new_boss_bullet = {x = boss.x + 40, y = boss.y + 35, bullet_img}
          table.insert(boss_bullets, new_boss_bullet)
          love.audio.play(fire_sound)
          boss.shoot_timer = false
          boss.can_shoot_timer = boss.shoot_timer_max + love.math.random(-0.9, 1)
        end
    end
end

function boss_mode_draw()
    for i, boss in ipairs(bosses) do
        love.graphics.draw(boss.sprite, boss.x, boss.y, 0, Boss.size, Boss.size)

        --debug collision box
        --love.graphics.setColor(1,0.1,0.1)
        --love.graphics.rectangle("line", boss.x , boss.y + 30, boss.sprite:getWidth() + 64, boss.sprite:getHeight() + 10)
    end
      --love.graphics.setColor(1,1,1)
end

function boss_alive_check()
    all_boss_health = 0
    for b, boss in ipairs(bosses) do
        all_boss_health = all_boss_health + boss.health
        if boss.is_alive == false then
            new_explosion = {x = boss.x + love.math.random(-32, 64), y = boss.y + 30, frame = 3, currdt = 0, prevdt = 0, timedt = 0}
            table.insert(explosions, new_explosion)
            boss_shake[b] = true
        end
    end
    prev_all_boss_health = all_boss_health

    if prev_all_boss_health == 0 then
        win = true
        currdt = love.timer.getDelta()
        timedt = currdt + prevdt
        if (timedt > 10) then
            End_Game = true
        end
        prevdt = timedt
    end
end
return boss_sr