local bullet_src = {}

bullets = {}
enemy_bullets = {}

shoot_timer = true
shoot_timer_max = 0.3
can_shoot_timer = shoot_timer_max
bullet_collision_w = 5
bullet_collision_h = 16

function bullet_draw()
    for i, bullet in ipairs(bullets) do
        love.graphics.draw(bullet_img, bullet.x, bullet.y)

        --debug collission box
        --love.graphics.setColor(1,0.1,0.1)
        --love.graphics.rectangle("line", bullet.x + 5, bullet.y, bullet_collision_w, bullet_collision_h)
    end
    for i, enemy_bullet in ipairs(enemy_bullets) do
        love.graphics.draw(bullet_img, enemy_bullet.x, enemy_bullet.y)

        --debug collission box
        --love.graphics.setColor(1,0.1,0.1)
        --love.graphics.rectangle("line", enemy_bullet.x + 5, enemy_bullet.y, bullet_collision_w, bullet_collision_h)
    end
    --love.graphics.setColor(1, 1, 1)
    for i, boss_bullet in ipairs(boss_bullets) do
        love.graphics.draw(bullet_img, boss_bullet.x, boss_bullet.y)

        --debug collission box
        --love.graphics.setColor(1,0.1,0.1)
        --love.graphics.rectangle("line", boss_bullet.x + 5, boss_bullet.y, bullet_collision_w, bullet_collision_h)
    end
    --love.graphics.setColor(1, 1, 1)
end

function bullet_update(dt)
    for i, bullet in ipairs(bullets) do
        bullet.y = bullet.y - (250 * dt)
    
        if bullet.y < 0 then -- remove bullets when they pass off the screen
          table.remove(bullets, i)
        end
    end
    for i, enemy_bullet in ipairs(enemy_bullets) do
        enemy_bullet.y = enemy_bullet.y + (250 * dt)
    
        if enemy_bullet.y > 720 then -- remove bullets when they pass off the screen
          table.remove(enemy_bullets, i)
        end
    end
    for i, boss_bullet in ipairs(boss_bullets) do
        boss_bullet.y = boss_bullet.y + (250 * dt)
    
        if boss_bullet.y > 720 then -- remove bullets when they pass off the screen
          table.remove(boss_bullets, i)
        end
    end
end

function bullet_timer_update(dt)
    can_shoot_timer = can_shoot_timer - (1 * dt)
    if can_shoot_timer < 0 then
      shoot_timer = true
    end
end

return bullet_src