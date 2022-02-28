local assets_loader = {}

function assets_load()
    --font
    font8       = love.graphics.newFont("assets/font/PressStart2P-Regular.ttf", 8)
    font16      = love.graphics.newFont("assets/font/PressStart2P-Regular.ttf", 16)
    kenfont     = love.graphics.newFont("assets/font/kenvector_future.ttf", 16)
    kenfontthin = love.graphics.newFont("assets/font/kenvector_future_thin.ttf", 16)

    --background_tileset
    back_tileset = {}
	for i=1, 120 do
		back_tileset[i] = love.graphics.newImage("assets/tiles/tile_"..i..".png")
	end

    --planes loading
    planes_sprite = {}
    for i = 1, 24 do
        planes_sprite[i] = love.graphics.newImage("assets/planes/planes_"..i..".png")
    end
    
    --afterburner flame
    flame_sprite = love.graphics.newImage("assets/flame/flame.png")
    afterburner_sound = love.audio.newSource("assets/sounds/engine_takeoff.wav", "static")
    afterburner_sound:setLooping(true)

    --music loading
    main_theme = love.audio.newSource("assets/music/Mercury.wav", "stream")
    main_theme:setLooping(true)

    --hud loading
    --for i = 1, 10 do
    --    hud_blue_sprite[i] = love.graphics.newImage("assets/hud/")
    --end
end

return assets_loader