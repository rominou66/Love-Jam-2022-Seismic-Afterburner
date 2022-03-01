local keyp = {}

function check_escape()
    --check if escape is pressed to close the application
    if love.keyboard.isDown("escape") then
        love.event.push('quit')
    end
end

function player_movement(dt)
	local dx = 0
  local dy = 0

	if love.keyboard.isDown("w") and Player.y > 0 then 
    dy = -1 
    if love.keyboard.isDown("lshift") then
      Player.afterburner = true
      back_scroll_speed = 50
      Enemies.speed = 100
    else
      Player.afterburner = false
      back_scroll_speed = 25
      Enemies.speed = 50
    end
  end

	if love.keyboard.isDown("a") and Player.x > 0 then 
    dx = -1 
  end
	if love.keyboard.isDown("s") and Player.y < 645 then 
    dy = 1 
    Player.afterburner = false
    back_scroll_speed = 25
    Enemies.speed = 50
  end
	if love.keyboard.isDown("d") and Player.x < 318 then 
    dx = 1 
  end

  if dx ~= 0 or dy ~= 0 then
		if dx ~= 0 and dy ~= 0 then
			dx = dx * 0.7071
			dy = dy * 0.7071
		end
		Player.x = Player.x + dx * Player.speed * dt
		Player.y = Player.y + dy * Player.speed * dt
  end
end

function key_fire()
  if love.keyboard.isDown('space') and shoot_timer then
    -- Create some bullet
    newBullet = {x = Player.x + 20, y = Player.y + 20, bullet_img}
    table.insert(bullets, newBullet)
    love.audio.play(fire_sound)
    shoot_timer = false
    can_shoot_timer = shoot_timer_max
  end
end

--call all the keyboard check function
function keyp_keypress(dt)
    check_escape()
    player_movement(dt)
    key_fire()
end

return keyp