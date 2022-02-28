local debug         = require("src.debug")
local assets_loader = require("src.assets_loader")
local keyboard      = require("src.keyboard")
local tilemap       = require("src.tilemap")
local level_data    = require("src.level_data")
local player        = require("src.player")
local hud           = require("src.hud")

function love.load(arg)
    love.graphics.setDefaultFilter('nearest', 'nearest')
    --load assets
    assets_load()
    --create an object player
    player_init()
    
    main_theme:play()
end
    
    
function love.update(dt)
    keyp_keypress(dt)
end
      
function love.draw(dt)
    tilemap_back_draw()
    player_draw()
    debug_draw()
end