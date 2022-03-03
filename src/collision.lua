local collision = {}

function update_collision()
    for i, enemy in ipairs(enemies) do
        for j, bullet in ipairs(bullets) do
            if check_collision(enemy.x - 52, enemy.y - 50, enemy.sprite:getWidth() + 10, enemy.sprite:getHeight() + 10, bullet.x + 5, bullet.y, bullet_collision_w, bullet_collision_h) then
                new_explosion = {x = enemy.x - 48, y = enemy.y - 50, frame = 1, currdt = 0, prevdt = 0, timedt = 0}
                table.insert(explosions, new_explosion)
                explosion_sound:play()
                enemy_hit_shake = true
                table.remove(bullets, j)
                table.remove(enemies, i)
                Hud.score = Hud.score + 1
            end
        end

        if check_collision(enemy.x - 52, enemy.y - 50, enemy.sprite:getWidth() + 10, enemy.sprite:getHeight() + 10, Player.x + 9, Player.y + 4, Player.texture:getWidth() + 10, Player.texture:getHeight() + 10) then
            new_explosion = {x = enemy.x - 48, y = enemy.y - 50, frame = 1, currdt = 0, prevdt = 0, timedt = 0}
            table.insert(explosions, new_explosion)
            table.remove(enemies, i)
            explosion_sound:play()
            player_hit_shake = true
            is_hit = true
        end
        for z, enemy_bullet in ipairs(enemy_bullets) do
            if check_collision(enemy_bullet.x, enemy_bullet.y, bullet_collision_w , bullet_collision_h, Player.x + 9, Player.y + 4, Player.texture:getWidth() + 10, Player.texture:getHeight() + 10) then
                table.remove(enemy_bullets, z)
                explosion_sound:play()
                player_hit_shake = true
                is_hit = true
            end
        end  
    end
    for b, boss in ipairs(bosses) do
        for j, bullet in ipairs(bullets) do
            if check_collision(boss.x , boss.y + 30, boss.sprite:getWidth() + 64, boss.sprite:getHeight() + 10, bullet.x + 5, bullet.y, bullet_collision_w, bullet_collision_h) then
                new_explosion = {x = bullet.x , y = boss.y + 30, frame = 1, currdt = 0, prevdt = 0, timedt = 0}
                table.insert(explosions, new_explosion)
                explosion_sound:play()
                enemy_hit_shake = true
                table.remove(bullets, j)
                if boss.health > 0 then
                    boss.health = boss.health - 1
                else
                    boss.is_alive = false
                end
                Hud.score = Hud.score + 1
            end
        end
        for a, boss_bullet in ipairs(boss_bullets) do
            if check_collision(boss_bullet.x, boss_bullet.y, bullet_collision_w , bullet_collision_h, Player.x + 9, Player.y + 4, Player.texture:getWidth() + 10, Player.texture:getHeight() + 10) then
                table.remove(boss_bullets, a)
                explosion_sound:play()
                player_hit_shake = true
                is_hit = true
            end
        end  
        if check_collision(boss.x , boss.y + 30, boss.sprite:getWidth() + 64, boss.sprite:getHeight() + 10, Player.x + 9, Player.y + 4, Player.texture:getWidth() + 10, Player.texture:getHeight() + 10) then
            new_explosion = {x = Player.x ,y = boss.y + 30, frame = 1, currdt = 0, prevdt = 0, timedt = 0}
            table.insert(explosions, new_explosion)
            explosion_sound:play()
            boss.health = boss.health - 1
            if boss.health == 0 then
                boss.is_alive = false
            end
            player_hit_shake = true
            is_hit = true
        end
    end
end


function check_collision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
  end

return collision