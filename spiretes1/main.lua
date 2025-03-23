function love.load()
    -- Set the title of our application window
    love.window.setTitle('Sprites 1')
    -- love.window.setMode(1024, 1024) -- atau ukuran sesuai keinginan kamu
    windowWidth, windowHeight = love.graphics.getDimensions()
    -- Load the love library
    background = love.graphics.newImage('background.png')
end

function love.draw()
    local backgroundWidth = background:getWidth()
    local backgroundHeight = background:getHeight()
    
    local scaleX = windowWidth / backgroundWidth
    local scaleY = windowHeight / backgroundHeight
    love.graphics.draw(background, 0, 0, 0, scaleX, scaleY)
end

