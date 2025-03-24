local animations = {}
local currentAnimation = "idle"
local currentFrame = 1
local frameTimer = 0
local frameDuration = 0.1

local characterX, characterY = 400, 472

local characterSpeed = 100
local direction = "right" -- atau "left"

function love.load()
    love.window.setTitle("Animasi Idle + Walk")
    love.window.setMode(800, 600)

    -- Load sprite sheet
    animations.idle = {
        sheet = love.graphics.newImage("idle.png"),
        quads = {},
        totalFrames = 6
    }

    animations.walk = {
        sheet = love.graphics.newImage("walk.png"),
        quads = {},
        totalFrames = 6
    }

    -- Potong frame idle
    local idleFrameWidth = animations.idle.sheet:getWidth() / animations.idle.totalFrames
    local idleFrameHeight = animations.idle.sheet:getHeight()
    for i = 0, animations.idle.totalFrames - 1 do
        table.insert(animations.idle.quads,
            love.graphics.newQuad(i * idleFrameWidth, 0, idleFrameWidth, idleFrameHeight, animations.idle.sheet:getDimensions()))
    end

    -- Potong frame walk
    local walkFrameWidth = animations.walk.sheet:getWidth() / animations.walk.totalFrames
    local walkFrameHeight = animations.walk.sheet:getHeight()
    for i = 0, animations.walk.totalFrames - 1 do
        table.insert(animations.walk.quads,
            love.graphics.newQuad(i * walkFrameWidth, 0, walkFrameWidth, walkFrameHeight, animations.walk.sheet:getDimensions()))
    end

    characterY = 600 - idleFrameHeight
end

function love.update(dt)
    local moving = false

    if love.keyboard.isDown("right") then
        characterX = characterX + characterSpeed * dt
        direction = "right"
        currentAnimation = "walk"
        moving = true
    elseif love.keyboard.isDown("left") then
        characterX = characterX - characterSpeed * dt
        direction = "left"
        currentAnimation = "walk"
        moving = true
    end

    if not moving then
        currentAnimation = "idle"
    end

    -- Update animasi
    frameTimer = frameTimer + dt
    if frameTimer >= frameDuration then
        frameTimer = 0
        currentFrame = currentFrame + 1
        if currentFrame > animations[currentAnimation].totalFrames then
            currentFrame = 1
        end
    end
end

function love.draw()
    local anim = animations[currentAnimation]
    local frame = anim.quads[currentFrame]
    local frameWidth = 128
    local frameHeight = 128

    local scaleX = direction == "left" and -1 or 1
    local offsetX = direction == "left" and frameWidth or 0

    love.graphics.draw(
        anim.sheet,
        frame,
        characterX, characterY,
        0,
        scaleX, 1,
        offsetX, 0
    )
end
