Player = {}

function Player:load()
    self.x = 50
    self.y = love.graphics.getHeight() / 2
    self.width = 20
    self.height = 100
    self.speed = 500
end

function Player:update(dt)
    self:move(dt)
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:move(dt)
           -- We will increase the variable by 1 for every second the key is held down.
           if love.keyboard.isDown("w") then
            if self.y > 0 then
                self.y = self.y - self.speed * dt
            end
            print(self.y)
        end
    
        -- We will decrease the variable by 1/s if any of the wasd keys is pressed. 
        if love.keyboard.isDown("s") then
            if self.y <= 621 then
                 self.y = self.y + self.speed * dt
            end
            print(self.y)
        end
    end
