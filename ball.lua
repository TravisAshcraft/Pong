Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth() /2 
    self.y = love.graphics.getHeight() /2
    

    self.height = 20
    self.width = 20
    self.speed = 200
    self.XVel = -self.speed
    self.YVel = 0

end

function Ball:update(dt)
    self:move(dt)
    self:collide()
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.height, self.width)
end

function Ball:move(dt)
    self.x = self.x + self.XVel * dt
    self.y = self.y + self.YVel * dt
end

function Ball:collide()
    if checkCollision(self, Player) then
        self.XVel = self.speed 
        local middleBall = self.y + self.width / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPostion = middleBall - middlePlayer
        self.YVel = collisionPostion * 5
    end
end


