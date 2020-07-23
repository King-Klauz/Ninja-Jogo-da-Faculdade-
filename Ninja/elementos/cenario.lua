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

function newAnimation5(image, width, height, duration)
    local animation5 = {}
    animation5.spriteSheet = image5
    animation5.quads = {}
 
    for y = 0, image5:getHeight() - height, height do
        for x = 0, image5:getWidth() - width, width do
            table.insert(animation5.quads, love.graphics.newQuad(x, y, width, height, image5:getDimensions()))
        end
    end
 
    animation5.duration = duration or 1
    animation5.currentTime = 0
 
    return animation5
end


function Animationload()

    --configuração do fundo. (depois colocar em um código de cenário próprio.)
    love.window.setMode(900,650)

    estrada = love.graphics.newImage("imagens/cenário/estrada.png")
    estrada2 = love.graphics.newImage("imagens/cenário/estrada.png")
    estrada3 = love.graphics.newImage("imagens/cenário/estrada.png")
    estrada4 = love.graphics.newImage("imagens/cenário/estrada.png")
    estradaX = 0
    estradaX2 = estradaX + 315
    estradaX3 = estradaX + estradaX2 + 315
    estradaX4 = estradaX3 + 315
    MovimentoDaEstrada = 300
    

    animation2 = newAnimation(love.graphics.newImage("imagens/cenário/cenario.png"), 500, 708, 1)
    animation3 = newAnimation(love.graphics.newImage("imagens/cenário/cenario.png"), 500, 708, 1)
    animation5 = newAnimation(love.graphics.newImage("imagens/cenário/cenario.png"), 500, 708, 1)
    fundoX = 0
    fundoY = -70
    fundoX2 = fundoX + 500
    fundoX3 = fundoX + fundoX2 + 500
    MovimentoDoFundo = 50

end
 
function Animationupdate(dt)
    
    animation2.currentTime = animation2.currentTime + dt
    if animation2.currentTime >= animation2.duration then
        animation2.currentTime = animation2.currentTime - animation2.duration
    end
    animation3.currentTime = animation3.currentTime + dt
    if animation3.currentTime >= animation3.duration then
        animation3.currentTime = animation3.currentTime - animation3.duration
    end
    animation5.currentTime = animation5.currentTime + dt
    if animation5.currentTime >= animation5.duration then
        animation5.currentTime = animation5.currentTime - animation5.duration
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
 
function Animationdraw()
   
    local spriteNum2 = math.floor(animation2.currentTime / animation2.duration * #animation2.quads) + 1
    love.graphics.draw(animation2.spriteSheet, animation2.quads[spriteNum2], fundoX, fundoY, 0, 1)
    local spriteNum3 = math.floor(animation3.currentTime / animation3.duration * #animation3.quads) + 1
    love.graphics.draw(animation3.spriteSheet, animation3.quads[spriteNum3], fundoX2, fundoY, 0, 1)
    local spriteNum5 = math.floor(animation5.currentTime / animation5.duration * #animation5.quads) + 1
    love.graphics.draw(animation5.spriteSheet, animation5.quads[spriteNum5], fundoX3, fundoY, 0, 1)

    love.graphics.draw(estrada, estradaX, 528, 0 , 1, 1.259)
    love.graphics.draw(estrada2, estradaX2, 528, 0 , 1, 1.259)
    love.graphics.draw(estrada3, estradaX3, 528, 0 , 1, 1.259)
    love.graphics.draw(estrada4, estradaX4, 528, 0 , 1, 1.259)

end