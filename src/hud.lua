local hud_src = {}

function hud_init()
    Hud = {}
    Hud.score = 0
    Hud.ammo  = 100
    Hud.calc_score = {}
    Hud.ammo_count = {}
    Hud.score_string = "Score"
    Hud.ammo_string = "Ammo"
end

function hud_update()

    function getDigit(num, digit)
        local n = 10 ^ digit
        local n1 = 10 ^ (digit - 1)
        return math.floor((num % n) / n1)
    end

    Hud.calc_score[1] = getDigit(Hud.score, 3)
    Hud.calc_score[2] = getDigit(Hud.score, 2)
    Hud.calc_score[3] = getDigit(Hud.score, 1)

    Hud.ammo_count[1] = getDigit(Hud.ammo, 3)
    Hud.ammo_count[2] = getDigit(Hud.ammo, 2)
    Hud.ammo_count[3] = getDigit(Hud.ammo, 1)
end

function hud_draw()
    love.graphics.draw(life_bar_sprite[4], love.graphics.getWidth() - 110, 5, 0, 3, 3)
    love.graphics.draw(life_bar_sprite[Player.health], love.graphics.getWidth() - 110, 5, 0, 3, 3)

    local y = 150
    for i = 1, 3 do
        love.graphics.draw(number_sprite[10], 10, y, 0, 0.75, 0.75)
        y = y + 30
    end

    y =150
    for i = 1, 3 do
        love.graphics.draw(number_sprite[Hud.calc_score[i]], 10, y, 0, 0.75, 0.75)
        y = y + 30
    end

    y = 150
    for i = 1, 3 do
        love.graphics.draw(number_sprite[10], love.graphics.getWidth() - 30, y, 0, 0.75, 0.75)
        y = y + 30
    end

    y =153
    for i = 1, 5 do
        love.graphics.print(string.sub(Hud.score_string, i, i), 40, y)
        y = y + 16
    end

    y =150
    for i = 1, 3 do
        love.graphics.draw(number_sprite[Hud.ammo_count[i]], love.graphics.getWidth() - 30, y, 0, 0.75, 0.75)
        y = y + 30
    end
    
    y =153
    for i = 1, 4 do
        love.graphics.print(string.sub(Hud.ammo_string, i, i), love.graphics.getWidth() - 50, y)
        y = y + 16
    end
end

return hud_src