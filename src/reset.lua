local reset_src = {}

function reset_game()
    In_Game = false
    Pause = false
    Menu = true
    End_Game = false
    End_Game_Win = false
    Boss_Mode = false
    Ready_Timer = false
    menu_shake = true
    boss_spawn = false
    boss_shake[1] = false
    boss_shake[2] = false
    boss_shake[3] = false

    return_key = false
    played = false
    back_map_y = 0
    
    hud_init()
    player_init()
    enemies_init()
    boss_init()

    bullets = {}
    enemy_bullets = {}
    boss_bullets = {}
    enemies = {}
    explosions = {}
    bosses = {}
    boss_spawn = false

    menu_music:play()
end

return reset_src