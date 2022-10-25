import wollok.game.*


object collar {
	const property position = game.at(2,4)
	method image() = "Collar.png"
	

	
	method colisionar(objeto){
		objeto.agarrar(self)
		
	}
		
}

object anillo {
	const property position = game.at(18,7)
	method image() = "Anillo.png"
	
	method colisionar(objeto){
		objeto.agarrar(self)
		
	}
		
}

object diamante {
	const property position= game.at(18,4)
	method image()="Diamante.png"
	
	method colisionar(objeto){
		objeto.agarrar(self)
		
	}
		
}