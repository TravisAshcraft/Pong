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

    if checkCollision(self, AiPlayer) then
        self.XVel = -self.speed 
        local middleBall = self.y + self.width / 2
        local middleAiPlayer = AiPlayer.y + AiPlayer.height / 2
        local collisionPostion = middleBall - middleAiPlayer
        self.YVel = collisionPostion * 5
    end

    if self.y < 0 then
      self.y = 0
      self.YVel = -self.YVel
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight - self.height
        self.YVel = -self.YVel
    end
end


