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

	if love.keyboard.isDown("w") then 
    dy = -1 
    if love.keyboard.isDown("lshift") then
      Player.afterburner = true
      back_scroll_speed = 50
    else
      Player.afterburner = false
      back_scroll_speed = 25
    end
  end

	if love.keyboard.isDown("a") then 
    dx = -1 
  end
	if love.keyboard.isDown("s") then 
    dy = 1 
    Player.afterburner = false
    back_scroll_speed = 25
  end
	if love.keyboard.isDown("d") then 
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

--call all the keyboard check function
function keyp_keypress(dt)
    check_escape()
    player_movement(dt)
end

return keyp