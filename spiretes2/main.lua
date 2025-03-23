function love.load()
    love.window.setTitle('Sprites 1 (background dan karakter)')

    love.window.setMode(800, 600)
    windowWidth, windowHeight = love.graphics.getDimensions()
    characterX = windowWidth / 2
    characterY = windowHeight
    background = love.graphics.newImage('background.png')
    character = love.graphics.newImage('character.png')


end

function love.draw()
    local scaleX = windowWidth / background:getWidth()
    local scaleY = windowHeight / background:getHeight()

    love.graphics.draw(background, 0, 0, 0, scaleX, scaleY)

    -- Skala karakter kecilin dikit (opsional)
    local scaleChar = 0.5

    -- Gambar karakter di tengah bawah
    love.graphics.draw(
        character,
        characterX, characterY,
        0,
        scaleChar, scaleChar,
        character:getWidth() / 2, character:getHeight()
    )
end

