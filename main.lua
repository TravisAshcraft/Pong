require("player")
require("Ball")
require("aiplayer")


function love.load()
    Player:load()
    Ball:load()
    AiPlayer:load()
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    AiPlayer:update(dt)
end


function love.draw()
    Player:draw()
    Ball:draw()
    AiPlayer:draw()
end

function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end