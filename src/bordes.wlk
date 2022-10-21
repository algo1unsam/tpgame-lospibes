import wollok.game.*
class Arbusto {
	var property position
	
	method dibujar() {
		position.drawElement(self)
		game.whenCollideDo(self, { objeto => self.empuja(objeto) })
	}

	method image() = "ladrillos.png"
	method empuja(objeto)
}

class ArbustoArriba inherits Arbusto {
		
	override method empuja(objeto) {
		objeto.volver()
	}
}

class ArbustoAbajo inherits Arbusto {
		
	override method empuja(objeto) {
		objeto.volver()
	}
}

class ArbustoIzquierda inherits Arbusto {
	
	override method empuja(objeto) {
		objeto.volver()
	}
}

class ArbustoDerecha inherits Arbusto {
		
	override method empuja(objeto) {
		objeto.volver()
	}
}
