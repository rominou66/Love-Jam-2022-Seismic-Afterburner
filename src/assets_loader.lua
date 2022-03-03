local assets_loader = {}

function assets_load()
    --font
    font8       = love.graphics.newFont("assets/font/PressStart2P-Regular.ttf", 8)
    font16      = love.graphics.newFont("assets/font/PressStart2P-Regular.ttf", 16)

    --menu background
    menu_background = love.graphics.newImage("assets/hud/menu.png")

    --background_tileset
    back_tileset = {}
	for i=1, 30 do
		back_tileset[i] = love.graphics.newImage("assets/tiles/tile_"..i..".png")
	end

    --planes loading
    planes_sprite = {}
    for i = 1, 2 do
        planes_sprite[i] = love.graphics.newImage("assets/planes/planes_"..i..".png")
    end
    bomb_crosshair_img = love.graphics.newImage("assets/planes/crosshair.png")
    bullet_img = love.graphics.newImage("assets/planes/bullet_1.png")

    --boss loading
    boss_sprite = {}
    for i = 1, 3 do
        boss_sprite[i] = love.graphics.newImage("assets/planes/boss_"..i..".png")
    end
    
    --afterburner flame
    flame_sprite = love.graphics.newImage("assets/flame/flame.png")
    afterburner_sound = love.audio.newSource("assets/sounds/engine_takeoff.wav", "static")
    afterburner_sound:setVolume(0.75)
    afterburner_sound:setLooping(true)

    --explosion sprite
    explosion_sprite = {}
    for i = 1, 4 do
        explosion_sprite[i] = love.graphics.newImage("assets/explosion/explo_"..i..".png")
    end
    explosion_sound = love.audio.newSource("assets/sounds/explodemini.wav", "static")

    --fire sound
    fire_sound = love.audio.newSource("assets/sounds/fire.mp3", "static")
    fire_sound:setVolume(0.5)

    --music loading
    main_theme = love.audio.newSource("assets/music/Mercury.wav", "stream")
    main_theme:setLooping(true)
    menu_music = love.audio.newSource("assets/music/Map.wav", "stream")
    menu_music:setLooping(true)
    pause_music = love.audio.newSource("assets/music/Map (basic version).wav", "stream")
    pause_music:setLooping(true)
    end_game_music = love.audio.newSource("assets/music/Warp Jingle.wav", "stream")
    win_game_music = love.audio.newSource("assets/music/Win Jingle.wav", "stream")
    boss_intro_music = love.audio.newSource("assets/music/BossIntro.wav", "stream")
    boss_music = love.audio.newSource("assets/music/BossMain.wav", "stream")
    boss_music:setLooping(true)

    life_bar_sprite = {}
    --hud loading
    for i = 1, 4 do
        life_bar_sprite[i] = love.graphics.newImage("assets/hud/life_bar_"..i..".png")
    end

    number_sprite = {}
    for i = 0, 10 do
        number_sprite[i] = love.graphics.newImage("assets/hud/number_"..i..".png")
    end
end

return assets_loader