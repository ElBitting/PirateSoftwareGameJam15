tutorial = {}

function tutorial:enter()
    gameMap = sti('Art/MapDesign/Maps/Tutorial_map_2.lua')
    launch_level(gameMap)
end

function tutorial:leave()
    tutorial_bool = false
    end_level()
end

function tutorial:update(dt)
    update_level(dt)
end


function tutorial:draw()
    local stages = {'BG', 'FG', 'fg2'}
    draw_level(gameMap, stages)
end