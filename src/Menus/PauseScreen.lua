PauseScreen = {}

table.insert(PauseScreen, newButton("Resume", function() 
    gs.switch(game) 
end))
table.insert(PauseScreen, newButton("Inventory", function() end))
table.insert(PauseScreen, newButton("Save", function() gs.switch(game) end))
table.insert(PauseScreen, newButton("Settings", function() end))
table.insert(PauseScreen, newButton("Title Screen", function() 
    gs.switch(TitleScreen)

end))
table.insert(PauseScreen, newButton("Quit", function() safe_quit() end))


function PauseScreen: draw()
    butt = 0
    love.graphics.print('Paused', gameFont, 325,100)
    love.graphics.rectangle("line", GAME_WIDTH-MENU_WIDTH-10, GAME_HEIGHT /9, MENU_WIDTH, MENU_HEIGHT)
    for i, button in ipairs(PauseScreen) do
        local color = {0.5, 0.7, 0.8, 1}
        local bx, by = GAME_WIDTH-MENU_WIDTH+20, GAME_HEIGHT / 9 + 20 + butt * 50
        local hot = false 
        local mx, my = love.mouse.getPosition()
        if love.mouse.isVisible() then
            if (mx > bx and mx < bx + MENU_WIDTH) and (my >by and my < by +50) then
                SelectedButton = i
            end 
        end
        hot = SelectedButton == i
        if hot then
            color = {0.7, 0.7, 0.9}
            SelectedButton = i
        end
        selected = love.keyboard.isDown('return') or love.mouse.isDown(1)
        if selected and hot then
            button.fn()
        end
        love.graphics.setColor(unpack(color))
        love.graphics.print(button.text, textFont,bx,by )
        butt = butt +1
    end
    love.graphics.setColor(1,1,1)
end

function PauseScreen: update(dt)
    if SelectedButton > #PauseScreen then
        SelectedButton = 1
    end
    if SelectedButton < 1 then 
        SelectedButton = #PauseScreen
    end
end

function PauseScreen:enter(previous)
    SelectedButton = 1 
end

function PauseScreen: keypressed(key)
    if key == 's' then 
        SelectedButton = SelectedButton + 1
        love.mouse.setVisible(false)
    end
    if key == 'w' then 
        SelectedButton = SelectedButton - 1
        love.mouse.setVisible(false)
    end
    if key =='escape' then
        safe_quit()
    end
end