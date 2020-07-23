--[[function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image
    animation.quads = {}
 
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
 
    animation.duration = duration or 1
    animation.currentTime = 0
 
    return animation
end
   --(15799/37), 314, 
function love.load()
    animation = newAnimation(love.graphics.newImage("teste.png"), (15799/37), 314, 3)
end

function love.update(dt)    
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
end

function love.draw()
local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 0, 0, 0, 2)
end
--]]
function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image
    animation.quads = {}
 
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
 
    animation.duration = duration or 1
    animation.currentTime = 0
 
    return animation
end

function newAnimation2(image, width, height, duration)
    local animation2 = {}
    animation2.spriteSheet = image2
    animation2.quads = {}
 
    for y = 0, image2:getHeight() - height, height do
        for x = 0, image2:getWidth() - width, width do
            table.insert(animation2.quads, love.graphics.newQuad(x, y, width, height, image2:getDimensions()))
        end
    end
 
    animation2.duration = duration or 1
    animation2.currentTime = 0
 
    return animation2
end

function newAnimation3(image, width, height, duration)
    local animation3 = {}
    animation3.spriteSheet = image3
    animation3.quads = {}
 
    for y = 0, image3:getHeight() - height, height do
        for x = 0, image3:getWidth() - width, width do
            table.insert(animation3.quads, love.graphics.newQuad(x, y, width, height, image3:getDimensions()))
        end
    end
 
    animation3.duration = duration or 1
    animation3.currentTime = 0
 
    return animation3
end

function love.load()
    
    estrada = love.graphics.newImage("estrada.png")
    estrada2 = love.graphics.newImage("estrada.png")
    estrada3 = love.graphics.newImage("estrada.png")
    estrada4 = love.graphics.newImage("estrada.png")
	animation = newAnimation(love.graphics.newImage("cenario.png"), 500, 708, 1)
	animation2 = newAnimation(love.graphics.newImage("cenario.png"), 500, 708, 1)
    animation3 = newAnimation(love.graphics.newImage("cenario.png"), 500, 708, 1)
    love.window.setMode(1200,650)
    
    estradaX = 0
    estradaX2 = estradaX + 315
    estradaX3 = estradaX + estradaX2 + 315
    estradaX4 = estradaX3 + 315
    MovimentoDaEstrada = 300

    fundoX = 0
    fundoY = -70
    fundoX2 = fundoX + 500
    fundoX3 = fundoX + fundoX2 + 500
    MovimentoDoFundo = 100

end
 
function love.update(dt)    
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
    
    animation2.currentTime = animation2.currentTime + dt
    if animation2.currentTime >= animation2.duration then
        animation2.currentTime = animation2.currentTime - animation2.duration
    end
    
    animation3.currentTime = animation3.currentTime + dt
    if animation3.currentTime >= animation3.duration then
        animation3.currentTime = animation3.currentTime - animation3.duration
    end

    estradaX = estradaX - MovimentoDaEstrada * dt
    estradaX2 = estradaX2 - MovimentoDaEstrada * dt
    estradaX3 = estradaX3 - MovimentoDaEstrada * dt
    estradaX4 = estradaX4 - MovimentoDaEstrada * dt


    if estradaX < -329 then
        estradaX = estradaX4 + 315
    end
    if estradaX2 < -329 then
        estradaX2 = estradaX + 315
    end
    if estradaX3 < -329 then
        estradaX3 = estradaX2 + 315
    end
    if estradaX4 < -329 then
        estradaX4 = estradaX3 + 315
    end

    fundoX = fundoX - MovimentoDoFundo * dt
    fundoX2 = fundoX2 - MovimentoDoFundo * dt
    fundoX3 = fundoX3 - MovimentoDoFundo * dt

    if fundoX < -500 then
        fundoX = fundoX3 + 500 
    end
    if fundoX2 < -500 then
        fundoX2 = fundoX + 500 
    end
    if fundoX3 < -500 then
        fundoX3 = fundoX2 + 500
    end

end
 
function love.draw()
    
    local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], fundoX, fundoY, 0, 1)
    local spriteNum2 = math.floor(animation2.currentTime / animation2.duration * #animation2.quads) + 1
    love.graphics.draw(animation2.spriteSheet, animation2.quads[spriteNum2], fundoX2, fundoY, 0, 1)
    local spriteNum3 = math.floor(animation3.currentTime / animation3.duration * #animation3.quads) + 1
    love.graphics.draw(animation3.spriteSheet, animation3.quads[spriteNum3], fundoX3, fundoY, 0, 1)
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", 650, 0, 1, 900)
    love.graphics.draw(estrada, estradaX, 528, 0 , 1, 1.259)
    love.graphics.draw(estrada2, estradaX2, 528, 0 , 1, 1.259)
    love.graphics.draw(estrada3, estradaX3, 528, 0 , 1, 1.259)
    love.graphics.draw(estrada4, estradaX4, 528, 0 , 1, 1.259)

    if love.keyboard.isDown( "q" ) then 
        love.graphics.setColor(255,255,255)
        love.graphics.print("X "..love.mouse.getX().." Y ".. love.mouse.getY(), 10, 10)
    end
end
