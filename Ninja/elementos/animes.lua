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

function newAnimation1(image, width, height, duration)
    local animation1 = {}
    animation1.spriteSheet = image1
    animation1.quads = {}
 
    for y = 0, image1:getHeight() - height, height do
        for x = 0, image1:getWidth() - width, width do
            table.insert(animation1.quads, love.graphics.newQuad(x, y, width, height, image1:getDimensions()))
        end
    end
 
    animation1.duration = duration or 1
    animation1.currentTime = 0
 
    return animation1
end



function newAnimation6(image, width, height, duration)
    local animation6 = {}
    animation6.spriteSheet = image6
    animation6.quads = {}
 
    for y = 0, image6:getHeight() - height, height do
        for x = 0, image6:getWidth() - width, width do
            table.insert(animation6.quads, love.graphics.newQuad(x, y, width, height, image6:getDimensions()))
        end
    end
 
    animation6.duration = duration or 1
    animation6.currentTime = 0
 
    return animation6
end


function Animeload()
    
    animation = newAnimation(love.graphics.newImage("imagens/personagem/corrida.png"), 38, 37, 0.2)
    animation1 = newAnimation(love.graphics.newImage("imagens/inimigos/InimigoCeu.png"), (240/5), 55, 0.5)
    animation4 = newAnimation(love.graphics.newImage("imagens/inimigos/InimigoChao.png"), (194/4), 40, 0.5)

end
 
function Animeupdate(dt)
    
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end

    animation1.currentTime = animation1.currentTime + dt
    if animation1.currentTime >= animation1.duration then
        animation1.currentTime = animation1.currentTime - animation1.duration
    end

    animation4.currentTime = animation4.currentTime + dt
    if animation4.currentTime >= animation4.duration then
        animation4.currentTime = animation4.currentTime - animation4.duration
    end
end

