Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth() /2 
    self.y = love.graphics.getHeight() /2
    
    self.img = love.graphics.newImage("assets/assets/ball/ball.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 200
    self.XVel = -self.speed
    self.YVel = 0

    paddleCollisionSound = love.audio.newSource("assets/assets/sounds/bullet.wav", "static")
    wallCollsionSound = love.audio.newSource("assets/assets/sounds/hit.wav", "static")
    scoreSound = love.audio.newSource("assets/assets/sounds/vgmenuselect.wav", "static")
end

function Ball:update(dt)
    self:move(dt)
    self:collide()
end

function Ball:draw()
    love.graphics.draw(self.img, self.x, self.y)
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
        self:playPaddleCollsionSound()
    end

    if checkCollision(self, AiPlayer) then
        self.XVel = -self.speed 
        local middleBall = self.y + self.width / 2
        local middleAiPlayer = AiPlayer.y + AiPlayer.height / 2
        local collisionPostion = middleBall - middleAiPlayer
        self.YVel = collisionPostion * 5
        self:playPaddleCollsionSound()
    end

    if self.y < 0 then
      self.y = 0
      self.YVel = -self.YVel
      self.playWallCollisionSound()
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.YVel = -self.YVel
        self.playWallCollisionSound()
    end
--check if the AI scores against the player
    if self.x < 0 then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.YVel = 0
        self.XVel = self.speed
        self:playScoreSound()
    end

--check if the player scores
    if self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.YVel = 0
        self.XVel = -self.speed
        self:playScoreSound()
    end
end

function Ball:playPaddleCollsionSound()
    paddleCollisionSound:play()
end

function Ball:playWallCollisionSound()
    wallCollsionSound:play()
end

function Ball:playScoreSound()
    scoreSound:play()
end