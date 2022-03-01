local states = {}

inGame = false
Pause = false
Menu = true

function menu()
    if love.keyboard.isDown("return") then
        inGame = true
        Menu = false
        menu_music:stop()
        main_theme:play()
    end   
end

function menu_draw()
    love.graphics.draw(menu_background)
end

return states