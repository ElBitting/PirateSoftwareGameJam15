mainLevel = {}

function mainLevel:enter()
    gameMap = sti('Art/MapDesign/Maps/Tutorial_map_3.lua')
    launch_level(gameMap)
end

function mainLevel:leave()
    tutorial_bool = true
    end_level()
end

function mainLevel:update(dt)
    update_level(dt)
end


function mainLevel:draw()
    local stages = {'Background', 'GroundLayer', 'Moss and Hazzards'}
    draw_level(gameMap, stages)
end