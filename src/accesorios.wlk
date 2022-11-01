import wollok.game.*


class Reliquia {
	var property position
	var property image
	
	method colisionar(objeto){
		objeto.agarrar(self)
	}
}

object collar inherits Reliquia (position = game.at(2,4), image = "Collar.png"){}
object anillo inherits Reliquia (position = game.at(18,4), image = "Anillo.png"){}
object diamante inherits Reliquia (position = game.at(18,7), image = "Diamante.png"){}
