MainMenu = {}

local buttons = {}
local font = nil

BUTTON_HEIGHT = 64

function MainMenu:load()
    font = love.graphics.newFont(32)

    table.insert(buttons, newButton(
        "Start Game",
        function()
            print("Start game")
        end
    ))
    table.insert(buttons, newButton(
        "Settings",
        function()
            print("Start game")
        end
    ))
    table.insert(buttons, newButton(
        "Leader Board",
        function()
            print("Start game")
        end
    ))
    table.insert(buttons, newButton(
        "Exit Game",
        function()
            love.event.quit(0)
        end
    ))
end

function MainMenu:update(dt)
    
end

function MainMenu:draw()
    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()

    --calculated in pixels
    local margin = 16

    local buttonWidth = windowWidth * (1/3)
    local totalHeight = (BUTTON_HEIGHT + margin) * #buttons

    local currentLocationY = 0

    for i, button in ipairs(buttons) do
        button.last = button.now
        local color = {.4, .4, .4, 1.0}

        local buttonX = (windowWidth * 0.5) - (buttonWidth * 0.5)
        local buttonY = (windowHeight * 0.5) - (totalHeight * 0.5) + currentLocationY

        local mouseX, mouseY = love.mouse.getPosition()
        

        
        local buttonHovered = mouseX > buttonX and mouseX < buttonX + buttonWidth and mouseY > buttonY and mouseY < buttonY + BUTTON_HEIGHT
        
        if buttonHovered then
            color = {0.8, 0.8, 0.8, 1.0}
        end

        button.now = love.mouse.isDown(1)
        if button.now and not button.last and buttonHovered then
            button.fn()
        end

        love.graphics.setColor(unpack(color))

        love.graphics.rectangle(
            "fill", 
            buttonX,
            buttonY,
            buttonWidth,
            BUTTON_HEIGHT

        )

        love.graphics.setColor(1,1,1,1)
        local textW = font:getWidth(button.text)
        local textH = font:getHeight(button.text)
        love.graphics.print(
            button.text,
            font,
            (windowWidth * 0.5) - textW * 0.5,
            buttonY + textH * 0.5
        )
        currentLocationY = currentLocationY + (BUTTON_HEIGHT + margin)
    end
end

function newButton(text, fn)
    return {
        text = text,
        fn = fn,
        now = false,
        last = false
    }
end