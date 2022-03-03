local debug = {}

debug_flag = false

function debug_draw()
  if debug_flag == true then
    mem = collectgarbage('count')
    stats = love.graphics.getStats(stats)

    love.graphics.setFont(font8, 4)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("FPS: "..love.timer.getFPS(),                             5, 5)
    love.graphics.print("DT: "..math.floor(love.timer.getDelta() * 1000),         5, 15)
    love.graphics.print("Memory:"..math.floor(mem * 10) / 100,                    5, 25)
    love.graphics.print("Drawcalls:"..stats.drawcalls,                            5, 35)
    love.graphics.print("Texture Mem:"..math.floor(stats.texturememory) / 100,    5, 45)
    love.graphics.print("Player X:"..Player.x,                                    5, 55)
    love.graphics.print("Player Y:"..Player.y,                                    5, 65)
    love.graphics.print("Map Y:"..back_map_y,                                     5, 75)
    love.graphics.print("Score:"..Hud.score,                                      5, 85)
    love.graphics.print("Player Health:"..Player.health,                          5, 95)
    love.graphics.print("Boss Mode:".. tostring(Boss_Mode),                       5, 105)
    love.graphics.print("Boss Health:"..prev_all_boss_health,                     5, 115)
    love.graphics.setFont(font16, 16)
    love.graphics.setColor(1, 1, 1)
  end
end

return debug