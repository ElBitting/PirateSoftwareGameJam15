TitleScreen = {}


function TitleScreen: draw()
     screenWidth = love.graphics.getWidth()
     screenHeight = love.graphics.getHeight()
     butt = 0 
    love.graphics.print("Project Sloth", gameFont, 180, 100)
    love.graphics.print("Press Enter to play", textFont, 370, 250)
    love.graphics.print("Press escape to quit", textFont, 360, 300)
end
