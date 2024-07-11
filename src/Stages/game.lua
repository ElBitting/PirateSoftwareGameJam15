game = {}

function game:enter()

    gameMap = sti('Art/Graphics/Maps/Tutorial_map_2.lua')

    walls = {}
    hazards = {}

    add_col_class_obj(walls, 'Platform', 'Walls',true)
    add_col_class_obj(hazards, 'Hazards', 'Hazards',true)
end

function game:draw()
    -- Logic for level select may go here... maybe not tho
    gameMap:drawLayer(gameMap.layers['BG'])
    gameMap:drawLayer(gameMap.layers['FG'])
end