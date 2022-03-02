local reset_src = {}

function reset_game()
    In_Game = false
    Pause = false
    Menu = true
    End_Game = false
    Ready_Timer = false
    menu_shake = true

    return_key = false
    played = false
    back_map_y = 0
    
    hud_init()
    --create an object player
    player_init()
    enemies_init()

    bullets = {}
    enemy_bullets = {}
    enemies = {}
    explosions = {}

    menu_music:play()
end

return reset_src