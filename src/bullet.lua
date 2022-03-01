local bullet_src = {}

bullets = {}

shoot_timer = true
shoot_timer_max = 0.2
can_shoot_timer = shoot_timer_max

function bullet_draw()
    for i, bullet in ipairs(bullets) do
        love.graphics.draw(bullet_img, bullet.x, bullet.y)
    end
end

function bullet_update(dt)
    for i, bullet in ipairs(bullets) do
        bullet.y = bullet.y - (250 * dt)
    
        if bullet.y < 0 then -- remove bullets when they pass off the screen
          table.remove(bullets, i)
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