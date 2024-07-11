game = {}

function game:enter()

    gameMap = sti('Art/Graphics/Maps/Tutorial_map_2.lua')

    walls = {}
    hazards = {}
    door = {}
    exit = {}

    add_col_class_obj(walls, 'Platform', 'Walls',true)
    add_col_class_obj(hazards, 'Hazards', 'Hazards',true)
    add_col_class_obj(door, 'TeleDoor','TeleDoor', true)
    add_col_class_obj(exit, 'FinalDoor','FinalDoor', true)

end

function game:draw()
    -- Logic for level select may go here... maybe not tho
    gameMap:drawLayer(gameMap.layers['BG'])
    gameMap:drawLayer(gameMap.layers['FG'])
end

function game:keypressed(key)
    if key == 'escape' then
        gs.switch(PauseScreen)
    end
    if key == 'p' then
        player:setX(20)
        player:setY(20)
    end
end