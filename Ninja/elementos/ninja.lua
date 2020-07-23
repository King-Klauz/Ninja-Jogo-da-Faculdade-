function ninjaload()

	--atributos do ninja.
	
	posX=10
	posY=500
	MovimentoNinja=200
	forcaDePulo=0
	PuloNinja=800
	gravidade = 2000
	vivo = true
	SomDoPulo = love.audio.newSource("sons/ninja/SomDoPulo.wav", "static") -- som do pulo.
	ImagemDoPulo = love.graphics.newImage("imagens/personagem/Pulo.png")

	--ataque corpo a corpo.

	Espadada = false
	AnimacaoDaEspada = 0.5
	DelayEspada = 1
	TempoAteEspadada = DelayEspada
	SaqueDeEspada = 60
	SomDaEspada = love.audio.newSource("sons/ninja/SomDaEspada.wav", "static") -- som do ataque corpo a corpo.
	ImagemDaEspada = love.graphics.newImage("imagens/personagem/AtaqueEspada.png")

	--tiros.
	
	tiro = false
	DelayTiro = 1
	VeloicidadeDoTiro = 1500
	TempoAteAtirar = DelayTiro
	tiros = {}
	ImagemDoTiro = love.graphics.newImage("imagens/personagem/Shuriken.png")
	SomDoTiro = love.audio.newSource("sons/ninja/SomDaShuriken.wav","static") 

	--sistema de pontos.

	checarpontos = false
	pontos = 0
		
		--sons dos pontos.
		love.audio.setVolume(1.1)
		firstblood = love.audio.newSource("sons/pontos/firstblood.wav","static")
		SomFirstblood = true
		multikill = love.audio.newSource("sons/pontos/multikill.wav","static")
		SomMultiKill = true 
		rampage = love.audio.newSource("sons/pontos/rampage.wav","static")
		SomRampage = true
		dominating = love.audio.newSource("sons/pontos/dominating.wav","static")
		SomDominating = true
		megakill = love.audio.newSource("sons/pontos/megakill.wav","static")
		SomMegaKill = true
		ultrakill = love.audio.newSource("sons/pontos/ultrakill.wav","static")
		SomUltraKill = true
		godlike = love.audio.newSource("sons/pontos/godlike.wav","static")
		SomGodLike = true

function ninjaupdate(dt)

	--atualização da quantidade de pontos e dos seus sons.

	if checarpontos == true then
		pontos = pontos + 1
		checarpontos = false
	end 
	
	if pontos == 1 and SomFirstblood then
		firstblood:play()
		SomFirstblood = false
	elseif pontos == 5 and SomMultiKill then
		multikill:play()
		SomMultiKill = false
	elseif pontos == 10 and SomRampage then
		rampage:play()
		SomRampage = false
	elseif pontos == 15 and SomDominating then
		dominating:play()
		SomDominating = false
	elseif pontos == 20 and SomMegaKill then
		megakill:play()
		SomMegaKill = false
	elseif pontos == 25 and SomUltraKill then
		ultrakill:play()
		SomUltraKill = false
	elseif pontos == 30 and SomGodLike then
		godlike:play()
		SomGodLike = false
	end 

	--tela de "gameover".

	if vivo == false and love.keyboard.isDown("r") then 
		Inimigos = {}
		InimigosCeu = {}
		TempoCriarInimigo = DelayInimigo
		TempoCriarInimigoCeu = DelayInimigoCeu
		posX=10
		posY=500
		vivo = true
		MovimentoCeu = 300
		Movimento = 100
		pontos = 0
		SomFirstblood = true
		SomMultiKill = true 
		SomRampage = true
		SomDominating = true
		SomMegaKill = true
		SomUltraKill = true
		SomGodLike = true
	elseif vivo == false and love.keyboard.isDown("f") then
		love.event.quit(0)
	end

	--efeito de gravidade no pulo.

	if forcaDePulo ~=0 then 
		posY = posY - forcaDePulo*dt
		forcaDePulo = forcaDePulo - gravidade*dt
		if posY > 500 then
			forcaDePulo = 0
			posY = 500
		end
	end 

	--moviemntos do ninja.

	if vivo then
		if posX<600 then -- condição aplicada para o personagem não sair da tela.
			if love.keyboard.isDown("d") then 
				posX=posX+dt*MovimentoNinja
			end
		end 
		if posX>0 then	
			if love.keyboard.isDown("a") then 
				posX=posX-dt*MovimentoNinja
			end
		end 
	end

	--tecla para atirar.

	if vivo then
		if love.keyboard.isDown("k") and TempoAteAtirar <= 0 then 
			tiro = true 
			TempoAteAtirar = DelayTiro
			SomDoTiro:play()
		end
	end

	--geração de tiros.

	TempoAteAtirar = TempoAteAtirar - (dt*1)

	if tiro then
		NovoTiro = {x = posX, y = posY+30, h = 10, e = 20}  
		table.insert(tiros,NovoTiro)
		tiro = false
	end

	--desaparecimento dos tiros gerados.

	for i, tiro in ipairs( tiros ) do
		tiro.x = tiro.x + (VeloicidadeDoTiro * dt)
		if tiro.x > 950 then
			table.remove( tiros, i)
		end
	end

	--tecla para ataque corpo a corpo.

	TempoAteEspadada = TempoAteEspadada - (dt*1)

	if vivo then
		if love.keyboard.isDown("j") and TempoAteEspadada <= 0 then 
			Espadada = true
			TempoAteEspadada = DelayEspada
			SomDaEspada:play()
			SomDaEspada:setVolume(0.5)
		elseif TempoAteEspadada < 0.95 then
			Espadada = false
		end
	end
end

function love.keypressed(key)	--pulo ninja. (difícil pra krl de fazer isso pqp...)
	if vivo and gamestatus==true then
		if key == "w" then 
			if forcaDePulo == 0  then
				forcaDePulo = PuloNinja
				SomDoPulo:play()
				SomDoPulo:setVolume(0.5)
			end
		end
	end 
end




function ninjadraw()

	--desenha a quantidade de pontos.
	love.graphics.setFont(love.graphics.newFont("njnaruto.ttf",24))
	love.graphics.print("pontos: ".. pontos, 20,20)

	--uma ferramenta para medir os píxeis do eixo X e Y da tela. (aplicada no mouse.)

	if love.keyboard.isDown( "p" ) then 
        love.graphics.setColor(255,255,255)
        love.graphics.print("X "..love.mouse.getX().." Y ".. love.mouse.getY(), 40, 40)
    end
 	
    --desenho dos tiros.
 	
 	for i, tiro in ipairs( tiros ) do
		love.graphics.draw(ImagemDoTiro, tiro.x, tiro.y, math.rad(90), 1, 1, tiro.e, tiro.h)
	end

	--desenho do ataque corpo a corpo.

	if vivo then
		if Espadada == true then 
			--love.graphics.rectangle("fill", posX, posY+15, 150, 20)
			love.graphics.draw(ImagemDaEspada, posX, posY, 0, 2, 2)
		end
	end

 	--desenho do ninja e da "tela de gameover". 

 	if vivo and Espadada~=true and posY == 500 then
 		--love.graphics.rectangle("fill",posX,posY, 38, 37)
 		local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    	love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], posX-20, posY, 0, 2)
	elseif vivo and posY<500 then
		love.graphics.draw(ImagemDoPulo, posX, posY, 0, 2, 2)
	elseif vivo == false then
		love.graphics.setFont(love.graphics.newFont("njnaruto.ttf",20))
		love.graphics.setColor(255,255,255)
		love.graphics.print("You failed your mission. Press 'r' for another chance.", 150,650/2)
		love.graphics.print("Press 'f' to quit the game.", 300,750/2)
	end
end
end
