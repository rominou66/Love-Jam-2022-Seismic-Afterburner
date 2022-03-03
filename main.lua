local states        = require("src.state")
local debug         = require("src.debug")
local assets_loader = require("src.assets_loader")
local keyboard      = require("src.keyboard")
local tilemap       = require("src.tilemap")
local level_data    = require("src.level_data")
local player        = require("src.player")
local enemies_src   = require("src.enemies")
local hud_src       = require("src.hud")
local bullet        = require("src.bullet")
local collision     = require("src.collision")
local explosion_src = require("src.explosion")
local reset_src     = require("src.reset")
local shake         = require("src.shake")
local boss_src      = require("src.boss")

function love.load(arg)
    love.graphics.setDefaultFilter('nearest', 'nearest')
    --load assets
    assets_load()
    hud_init()
    --create an object player
    player_init()
    enemies_init()
    boss_init()
    menu_music:play()
end
    
function love.update(dt)
    keyp_keypress(dt)
    if Menu == true then
        menu()
        alpha_blink()
    end
    
    if In_Game == true then
        in_game()
        tilemap_scroll(dt)
        bullet_timer_update(dt)
        bullet_update(dt)
        if Boss_Mode == true then
            main_theme:stop()
            spawn_boss()
            boss_update(dt)
            boss_alive_check()
            if not boss_intro_music:isPlaying() then
                boss_music:play()
            end  
        else
            spawn_enemies(dt)
        end
        update_enemies(dt)
        explo_anim(dt)
        update_collision()
        player_logic()
        hud_update()
        screen_shake_update(dt)
    end

    if Pause == true then
        pause()
        alpha_blink()
    end

    if End_Game == true then
        end_game()
        alpha_blink()
    end
end
      
function love.draw(dt)
    if Menu == true then
        menu_draw()
    end

    if In_Game == true then
        screen_shake_draw()
        tilemap_back_draw()
        bullet_draw()
        if Boss_Mode == true then
            boss_mode_draw()
        end
        draw_enemies()
        player_draw()
        explo_draw(dt)
        hud_draw()
    end

    if Pause == true then
        tilemap_back_draw()
        bullet_draw()
        draw_enemies()
        player_draw()
        hud_draw()
        pause_draw()
    end

    if End_Game == true then
        tilemap_back_draw()
        bullet_draw()
        boss_mode_draw()
        draw_enemies()
        explo_draw(dt)
        if win == true then
            player_draw()
        end
        end_game_draw()
    end
    debug_draw()
end