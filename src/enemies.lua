local enemies_src = {}

enemy_timer_max = 2
enemy_timer = enemy_timer_max
enemies = {}

function enemies_init()
    Enemies              = {}
    Enemies.texture      = planes_sprite[2]
    Enemies.x            = 0
    Enemies.y            = 0
    Enemies.size         = 2
    Enemies.speed        = 75 
    Enemies.r            = 3.141592654
  end

function spawn_enemies(dt)
 enemy_timer = enemy_timer - (1 * dt)
 if enemy_timer < 0 then
   enemy_timer = enemy_timer_max

   local rand_num = love.math.random(80, love.graphics.getWidth() - 80)
   new_enemy = { x = rand_num, y = -10, sprite = planes_sprite[2], shoot_timer = true, can_shoot_timer = 0, shoot_timer_max = 2}
   table.insert(enemies, new_enemy)
 end
end

function update_enemies(dt)
  -- update the positions of enemies
  local rand_num = love.math.random(0, 100)
  for i, enemy in ipairs(enemies) do
    enemy.y = enemy.y + (Enemies.speed * dt)
    enemy.x = enemy.x + (love.math.random(-1, 1) * Enemies.speed) * dt

    enemy.can_shoot_timer = enemy.can_shoot_timer - (1 * dt)
    if enemy.can_shoot_timer < 0 then
      enemy.shoot_timer = true
    end

    if enemy.shoot_timer == true and In_Game == true then
      -- Create some bullet
      new_enemy_bullet = {x = enemy.x -35, y = enemy.y -35, bullet_img}
      table.insert(enemy_bullets, new_enemy_bullet)
      love.audio.play(fire_sound)
      enemy.shoot_timer = false
      enemy.can_shoot_timer = enemy.shoot_timer_max + love.math.random(-1.5, 1.5)
    end

    if enemy.y > 720 then -- remove enemies when they pass off the screen
      table.remove(enemies, i)
    end
  end
end

function draw_enemies()
    for i, enemy in ipairs(enemies) do
        love.graphics.draw(enemy.sprite, enemy.x, enemy.y, Enemies.r, Enemies.size, Enemies.size)

        --debug collision box
        --love.graphics.setColor(1,0.1,0.1)
        --love.graphics.rectangle("line", enemy.x - 52, enemy.y - 50, enemy.sprite:getWidth() + 10, enemy.sprite:getHeight() + 10)
    end
      --love.graphics.setColor(1,1,1)
end

return enemies_src