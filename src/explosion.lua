local explosion_src = {}

explosions = {}

function explo_anim()
    
    for i, explosion in ipairs(explosions) do
        explosion.currdt = love.timer.getDelta()
        explosion.timedt = explosion.currdt + explosion.prevdt
        explosion.y = explosion.y + Enemies.speed * love.timer.getDelta()

        if (explosion.timedt > 0.25) then
            explosion.frame = explosion.frame + 1
            explosion.timedt = 0
        end
        explosion.prevdt = explosion.timedt
        if explosion.frame > 4 then 
          table.remove(explosions, i)
        end
    end
end

function explo_draw()
    for i, explosion in ipairs(explosions) do
        love.graphics.draw(explosion_sprite[explosion.frame], explosion.x, explosion.y, 0, 2.5, 2.5)
    end
end

return explosion_src