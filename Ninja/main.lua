require ("elementos/ninja")
require ("elementos/inimigos")
require ("elementos/animes")
require ("elementos/colisão")
require ("elementos/cenario")
require ("elementos/menu")

function love.load()

	ninjaload()
	inimigoload()
	Animeload()
	Animationload()
	Menuload()

end

function love.update(dt)

	Menuupdate(dt)
	
	if gamestatus == true then
		
		ninjaupdate(dt)
		inimigoupdate(dt)
		Animeupdate(dt)
		Animationupdate(dt)
		colisao()
		
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

end

function love.draw()
	
	Menudraw()

	if gamestatus == true then
		Animationdraw()
		ninjadraw()
		inimigodraw()	
	end

end