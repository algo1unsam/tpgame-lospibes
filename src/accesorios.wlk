import wollok.game.*


object collar {
	var position = game.at(2,4)
	method image() = "Collar.png"
	
	method position() = position
	
	method colisionar(objeto){
		objeto.agarrar(self)
		
	}
		
}

object anillo {
	var position = game.at(18,7)
	method image() = "Anillo.png"
	
	method position() = position
	
	method colisionar(objeto){
		objeto.agarrar(self)
		
	}
		
}

object diamante {
	var position = game.at(18,4)
	method image() = "Diamante.png"
	
	method position() = position
	
	method colisionar(objeto){
		objeto.agarrar(self)
		
	}
		
}