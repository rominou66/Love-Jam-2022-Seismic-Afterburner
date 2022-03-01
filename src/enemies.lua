local enemies = {}

enemy_timer_max = 2
enemy_timer = enemy_timer_max

function enemies_init()
    Enemies              = {}
    Enemies.texture      = planes_sprite[2]
    Enemies.x            = love.graphics.getWidth()/2
    Enemies.y            = love.graphics.getHeight()/2
    Enemies.size         = 2
    Enemies.speed        = 50 
    Enemies.r            = 3.141592654
  end

function spawn_enemies(dt)
 enemy_timer = enemy_timer - (1 * dt)
 if enemy_timer < 0 then
   enemy_timer = enemy_timer_max

   rand_num = math.random(80, love.graphics.getWidth() - 80)
   new_enemy = { x = rand_num, y = -10, sprite = planes_sprite[2]}
   table.insert(enemies, new_enemy)
 end
end

function update_enemies(dt)
 -- update the positions of enemies
 for i, enemy in ipairs(enemies) do
   enemy.y = enemy.y + (Enemies.speed * dt)

   if enemy.y > 720 then -- remove enemies when they pass off the screen
     table.remove(enemies, i)
   end
 end
end

function draw_enemies()
    for i, enemy in ipairs(enemies) do
        love.graphics.draw(enemy.sprite, enemy.x, enemy.y, Enemies.r, Enemies.size, Enemies.size)
      end
    end

return enemies