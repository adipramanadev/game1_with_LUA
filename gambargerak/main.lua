-- Variabel global
local character
local characterX, characterY
local characterSpeed = 200
local isJumping = false
local jumpForce = -500
local gravity = 1000
local velocityY = 0

function love.load()
    love.window.setTitle('character movement')
    love.window.setMode(800, 600)
    windowWidth, windowHeight = love.graphics.getDimensions()

    -- Gambar
    background = love.graphics.newImage('background.png')
    character = love.graphics.newImage('character.png')

    characterX = windowWidth / 2
    characterY = windowHeight -- dekat tanah
end

function love.update(dt)
    -- Gerakan kanan dan kiri
    if love.keyboard.isDown("right") then
        characterX = characterX + characterSpeed * dt
    elseif love.keyboard.isDown("left") then
        characterX = characterX - characterSpeed * dt
    end

    -- Gravitasi & lompat
    if isJumping then
        velocityY = velocityY + gravity * dt
        characterY = characterY + velocityY * dt

        -- Mendarat (kena tanah)
        if characterY >= windowHeight - 10 then
            characterY = windowHeight - 10
            isJumping = false
            velocityY = 0
        end
    end
end

function love.keypressed(key)
    if key == "up" and not isJumping then
        isJumping = true
        velocityY = jumpForce
    end
end

function love.draw()
    local scaleX = windowWidth / background:getWidth()
    local scaleY = windowHeight / background:getHeight()
    love.graphics.draw(background, 0, 0, 0, scaleX, scaleY)

    local scaleChar = 0.5
    love.graphics.draw(
        character,
        characterX, characterY,
        0,
        scaleChar, scaleChar,
        character:getWidth() / 2,
        character:getHeight()
    )
end
