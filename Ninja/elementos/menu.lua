function newAnimation4(image, width, height, duration)
    local animation4 = {}
    animation4.spriteSheet = image4
    animation4.quads = {}
 
    for y = 0, image4:getHeight() - height, height do
        for x = 0, image4:getWidth() - width, width do
            table.insert(animation4.quads, love.graphics.newQuad(x, y, width, height, image4:getDimensions()))
        end
    end
 
    animation4.duration = duration or 1
    animation4.currentTime = 0
 
    return animation4
end

function Menuload()

    time = 0

    alturaButton = 40
    larguraButton = 300

    MusicaDoMenu = love.audio.newSource("sons/menu/menu.mp3", "static")
    SomMusicaDoMenu = true
    MusicaDeGamePlay = love.audio.newSource("sons/jogo/MusicaDeGamePlay.mp3", "static")
    --MusicaDeGamePlay = love.audio.newSource("sons/flamengo/ÁUDIO DO TORCEDOR DO FLAMENGO FALANDO SOBRE O BALOTELLI.mp3", "static")

    gamestatus=false

    animation6 = newAnimation(love.graphics.newImage("imagens/menu/spriteMenu.png"),  (15799/37), 314, 3) -- Gif do menu

end

function Menuupdate(dt)

    time = time + dt

    if SomMusicaDoMenu then
        MusicaDoMenu:play()
        MusicaDoMenu:setVolume(1.5)
    else
        MusicaDoMenu:stop()
    end

    if gamestatus==true then
        MusicaDeGamePlay:setVolume(0.4)
        MusicaDeGamePlay:play()
    end
   
    if love.mouse.isDown(1) and Start  then
        gamestatus=true
        SomMusicaDoMenu = false
    end
    if love.mouse.isDown(1) and Exit  then
        love.event.quit(0)
        gamestatus=false
    end
    animation6.currentTime = animation6.currentTime + dt
    if animation6.currentTime >= animation6.duration then
        animation6.currentTime = animation6.currentTime - animation6.duration
    end
 end

function Menudraw()

    	Start = love.mouse.getX() > 300 and love.mouse.getY() > 400 and love.mouse.getX() < 700 and love.mouse.getY() < 500
    	Exit =  love.mouse.getX() > 300 and love.mouse.getY() > 500 and love.mouse.getX() < 700 and love.mouse.getY() < 660
  
    if time>4 and time<8.5 then
        love.graphics.setFont(love.graphics.newFont("njnaruto.ttf",36))
        love.graphics.print("NINJA",370,300)
    end

    if  gamestatus==false and time>9.7 then

    	Start= love.mouse.getX() > 300 and love.mouse.getY() > 400 and love.mouse.getX() < 700 and love.mouse.getY() < 500
    	Exit=  love.mouse.getX() > 300 and love.mouse.getY() > 500 and love.mouse.getX() < 700 and love.mouse.getY() < 660
  
        local spriteNum6 = math.floor(animation6.currentTime / animation6.duration * #animation6.quads) + 1
        love.graphics.draw(animation6.spriteSheet, animation6.quads[spriteNum6], 0, 0, 0, 2.1)
        
        love.graphics.setFont(love.graphics.newFont("njnaruto.ttf",24))
        love.graphics.setColor(255,255,255)
        love.graphics.print("Start",400,450)
        love.graphics.setColor(255,255,255)
        love.graphics.print("Exit",400,520)
    end 

end