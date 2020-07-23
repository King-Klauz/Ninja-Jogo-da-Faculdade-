function	inimigoload()
	--inimigos gerados no chão.
	
	Inimigos={}
	Movimento = 100
	DelayInimigo = math.random(1,2)
	TempoCriarInimigo = DelayInimigo

	Inimigos1={}
	Movimento1 = 100
	DelayInimigo1 = math.random(1,2)
	TempoCriarInimigo1 = DelayInimigo1
	
	--inimigos gerados no céu.

	InimigosCeu={}
	MovimentoCeu = 300
	DelayInimigoCeu = math.random(1,3)
	TempoCriarInimigoCeu = DelayInimigoCeu

	InimigosCeu1={}
	MovimentoCeu1 = 300
	DelayInimigoCeu1 = 2
	TempoCriarInimigoCeu1 = DelayInimigoCeu1


	--sons do inimigo.

	dano = love.audio.newSource("sons/inimigos/SomDeDano.wav","static")
	SomDeDano = true

end 

function 	inimigoupdate(dt)

	--inimigos gerados no chão.

	TempoCriarInimigo = TempoCriarInimigo - (dt*1)
	Movimento = Movimento + (50*dt)
	
	if vivo then
		if TempoCriarInimigo < 0 then 
			TempoCriarInimigo = DelayInimigo
			NovoInimigo = {x = 950, y = 500, h = 60, e = 60}  
			table.insert(Inimigos,NovoInimigo)
		end
	end 



	TempoCriarInimigo1 = TempoCriarInimigo1 - (dt*1)
	Movimento1 = Movimento1 + (50*dt)
	
	if vivo then
		if TempoCriarInimigo1 < 0 then 
			TempoCriarInimigo1 = DelayInimigo1
			NovoInimigo1 = {x = 950, y = 500, h = 60, e = 60}  
			table.insert(Inimigos1,NovoInimigo1)
		end
	end 


	--desaparecimento dos inimigos gerados no chão.

	for i, inimigo in ipairs( Inimigos) do
		inimigo.x = inimigo.x - (Movimento * dt)
		if inimigo.x < -60 then
			table.remove( Inimigos, i)
		end
	end

	--inimigos gerados no céu.

	TempoCriarInimigoCeu = TempoCriarInimigoCeu - (dt*1)
	MovimentoCeu = MovimentoCeu + (50*dt)

	if vivo then
		if TempoCriarInimigoCeu < 0 then 
			TempoCriarInimigoCeu = DelayInimigoCeu
			NovoInimigoCeu = {x = 950, y = math.random(300,posY), h = 110, e = 70}  
			table.insert(InimigosCeu,NovoInimigoCeu)
		end
	end 

	TempoCriarInimigoCeu1 = TempoCriarInimigoCeu1 - (dt*1)
	MovimentoCeu1 = MovimentoCeu1 + (50*dt)

	if vivo then
		if TempoCriarInimigoCeu1 < 0 then 
			TempoCriarInimigoCeu1 = DelayInimigoCeu1
			NovoInimigoCeu1 = {x = 950, y = 300, h = 110, e = 70}  
			table.insert(InimigosCeu1,NovoInimigoCeu1)
		end
	end 

	--desaparecimento dos inimigos gerados no céu.
--[[
	for i, inimigoCeu1 in ipairs( InimigosCeu1) do
		inimigoCeu1.x = inimigoCeu1.x - (MovimentoCeu1 * dt)
		if inimigoCeu1.x < -70 then
			table.remove( InimigosCeu1, i)
		end
	end
--]]
	for i, inimigoCeu in ipairs( InimigosCeu) do
		inimigoCeu.x = inimigoCeu.x - (MovimentoCeu * dt)
		if inimigoCeu.x < -70 then
			table.remove( InimigosCeu, i)
		end
	end
end


function 	inimigodraw()

	if vivo then  
		--desenha os inimigos gerados no chão.
		
		for i, inimigo in ipairs( Inimigos ) do
			--love.graphics.setColor(0,0,0)
			--love.graphics.rectangle("fill",inimigo.x,inimigo.y, inimigo.e, inimigo.h)
			local spriteNum4 = math.floor(animation4.currentTime / animation4.duration * #animation4.quads) + 1
		    love.graphics.draw(animation4.spriteSheet, animation4.quads[spriteNum4], inimigo.x, inimigo.y, 0, 2)
		end

		--desenha os inimigos gerados no céu.
		
		for i, inimigoCeu in ipairs( InimigosCeu ) do
			--love.graphics.setColor(0,0,0)
			--love.graphics.rectangle("fill",inimigoCeu.x,inimigoCeu.y, inimigoCeu.e, inimigoCeu.h)
			local spriteNum1 = math.floor(animation1.currentTime / animation1.duration * #animation1.quads) + 1
	    	love.graphics.draw(animation1.spriteSheet, animation1.quads[spriteNum1], inimigoCeu.x, inimigoCeu.y, 0, 2)
		end 

		for i, inimigoCeu1 in ipairs( InimigosCeu1 ) do
			--love.graphics.setColor(0,0,0)
			love.graphics.rectangle("fill",inimigoCeu1.x,inimigoCeu1.y, inimigoCeu1.e, inimigoCeu1.h)
			--local spriteNum1 = math.floor(animation1.currentTime / animation1.duration * #animation1.quads) + 1
	    	--love.graphics.draw(animation1.spriteSheet, animation1.quads[spriteNum1], inimigoCeu1.x, inimigoCeu1.y, 0, 2)
		end 
	end
end