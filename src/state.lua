local states = {}

In_Game = false
Pause = false
Menu = true
End_Game = false
Ready_Timer = false

return_key = false
played = false

local blink = 0
local add = true

local prevdt = 0
local currdt = {}
local timedt = {}

function menu()
    menu_shake = true
    if return_key == true then
        In_Game = true
        Menu = false
        menu_music:stop()
        main_theme:play()
        return_key = false
        menu_shake = false
    end  
end

function menu_draw()
    screen_shake_draw()
    love.graphics.draw(menu_background)

    love.graphics.setFont(font16, 32)
    love.graphics.setColor(1,1,1,blink + 0.5)
    love.graphics.print("Made by:",love.graphics.getWidth() / 2 + 45,550,-0.4)
    love.graphics.print("rominou66",love.graphics.getWidth() / 2 + 45,580,-0.4)
    love.graphics.setColor(1,1,1)
end

function pause()
    if return_key == true then
        In_Game = true
        Pause = false
        pause_music:stop()
        main_theme:play()
        return_key = false
    end  
end

function pause_draw()
    love.graphics.setFont(font16, 32)
    love.graphics.setColor(1,1,1,blink + 0.5)
    love.graphics.print("Pause", love.graphics.getWidth() / 2 - 45, love.graphics.getHeight() / 2 - 50 , 0)
    love.graphics.setColor(1,1,1)
end

function in_game()
    if return_key == true then
        Pause = true
        In_Game = false
        main_theme:stop()
        pause_music:play()
        return_key = false
    end
end

function end_game()
    In_Game = false
    Pause   = false
    main_theme:stop()
    love.audio.stop(Player.aftsound)
    player_hit_shake = false
    if played == false then
        if win == true then
            win_game_music:play()
        else
            end_game_music:play()
        end
        played = true
    end
    if return_key == true then
        return_key = false
        reset_game()
    end
end

function end_game_draw()
    love.graphics.setFont(font16, 32)
    love.graphics.setColor(1,1,1,blink + 0.5)
    love.graphics.print("Game Over", love.graphics.getWidth() / 2 - 35, love.graphics.getHeight() / 2 - 50 , 0)
    love.graphics.setColor(1,1,1)
    love.graphics.print("Score "..Hud.score, love.graphics.getWidth() / 2 - 40, love.graphics.getHeight() / 2 - 20 , 0)
    love.graphics.setColor(1,1,1)
end

function alpha_blink()
    --go from zero to one alpha and then reverse
    if blink < 1 and add == true then
        blink = blink + 0.025
        elseif blink > 1 then
        add = false
    end
    if blink > 0 and add == false then
        blink = blink - 0.025
    elseif blink < 0 then
        add = true
    end
end

return states