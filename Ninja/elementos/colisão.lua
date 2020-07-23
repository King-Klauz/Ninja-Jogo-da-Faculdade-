function checaColisao( x1, y1, w1, h1, x2, y2, w2, h2 )
	return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end

function colisao()

	--Colisão do personagem com os inimigos do chão.

	for i, inimigo in ipairs( Inimigos) do
		if checaColisao(inimigo.x,inimigo.y, inimigo.e, inimigo.h, posX-20, posY, 40, 40) then 
			table.remove(Inimigos, i)
			vivo = false
		end
	end 
	
	--Colisão dos tiros com os inimigos do chão.

	for i, inimigo in ipairs( Inimigos ) do
		for i,  tiro in ipairs( tiros ) do
			if	checaColisao(tiro.x, tiro.y, tiro.e, tiro.h, inimigo.x, inimigo.y, inimigo.e, inimigo.h) then
				table.remove(Inimigos, i)
				table.remove(tiros, i)
				checarpontos = true
				dano:play() -- SOM DE DANO DO MINECRAFT UAHISHAIUDHIASUDHIASUDH129DHUAOIDJSDA.
			end
		end
	end

	--Colisão da espada com os inimigos do chão.

	if Espadada == true then
		for i, inimigo in ipairs(Inimigos) do
			if checaColisao(inimigo.x,inimigo.y, inimigo.e, inimigo.h, posX, posY+15, 110, 20) then 
				table.remove(Inimigos, i)
				checarpontos = true
				dano:play() 
			end
		end 
	end

	--Colisão do personagem com os inimigos do céu.
	
	for i, inimigoCeu in ipairs( InimigosCeu) do
		if checaColisao(inimigoCeu.x,inimigoCeu.y, inimigoCeu.e, inimigoCeu.h, posX-20, posY, 40, 40) then
			table.remove( InimigosCeu, i)
			vivo = false	
		end
	end

	for i, inimigoCeu1 in ipairs( InimigosCeu1) do
		if checaColisao(inimigoCeu1.x,inimigoCeu1.y, inimigoCeu1.e, inimigoCeu1.h, posX-20, posY, 40, 40) then
			table.remove( InimigosCeu, i)
			vivo = false	
		end
	end
	
	--Colisão dos tiros com os inimigos do céu.

	
	for i, inimigoCeu in ipairs( InimigosCeu ) do
		for i,  tiro in ipairs( tiros ) do
			if	checaColisao(tiro.x, tiro.y, tiro.e, tiro.h, inimigoCeu.x, inimigoCeu.y, inimigoCeu.e, inimigoCeu.h) then
				table.remove(InimigosCeu, i)
				table.remove(tiros, i)
				checarpontos = true
				dano:play()
			end
		end
	end

	--Colisão da espada com os inimigos do céu.

	if Espadada == true then
		for i, inimigoCeu in ipairs( InimigosCeu) do
			if checaColisao(inimigoCeu.x,inimigoCeu.y, inimigoCeu.e, inimigoCeu.h, posX, posY+15, 150, 20) then
				table.remove( InimigosCeu, i)
				checarpontos = true
				dano:play()
			end 
		end 
	end
end
