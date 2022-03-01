local states        = require("src.state")
local debug         = require("src.debug")
local assets_loader = require("src.assets_loader")
local keyboard      = require("src.keyboard")
local tilemap       = require("src.tilemap")
local level_data    = require("src.level_data")
local player        = require("src.player")
local enemies       = require("src.enemies")
local hud           = require("src.hud")
local bullet        = require("src.bullet")      

function love.load(arg)
    love.graphics.setDefaultFilter('nearest', 'nearest')
    --load assets
    assets_load()
    --create an object player
    player_init()
    enemies_init()
    menu_music:play()
end
    
function love.update(dt)
    keyp_keypress(dt)
    if Menu == true then
        menu()
    end
    
    if inGame == true then
        tilemap_scroll(dt)
        bullet_timer_update(dt)
        bullet_update(dt)
        spawn_enemies(dt)
        update_enemies(dt)
    end
end
      
function love.draw(dt)
    if Menu == true then
        menu_draw()
    end

    if inGame == true then
        tilemap_back_draw()
        bullet_draw()
        draw_enemies()
        player_draw()
    end
    debug_draw()
end