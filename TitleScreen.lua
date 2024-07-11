TitleScreen = {}

function TitleScreen: draw()
    love.graphics.print(TITLE, gameFont, 180, 100)
    love.graphics.print("Press Enter to play", textFont, 370, 250)
    love.graphics.print("Press escape to quit", textFont, 360, 300)
end
