import wollok.game.*

object salida{
	method image()= 'salida.png'
}
class Ladrillo {
	var property position
	
	method dibujar() {
		position.drawElement(self)
		game.whenCollideDo(self, { objeto => objeto.volver() })
	}

	method image() = "ladrillos.png"
	//method empuja(objeto)
	method morir(){}
}

class LadrilloArriba inherits Ladrillo {
		
//	override method empuja(objeto) {
//		objeto.volver()
//	}
}

class LadrilloAbajo inherits Ladrillo {
		
//	override method empuja(objeto) {
//		objeto.volver()
//	}
}

class LadrilloIzquierda inherits Ladrillo {
	
//	override method empuja(objeto) {
//		objeto.volver()
//	}
}

class LadrilloDerecha inherits Ladrillo {
		
//	override method empuja(objeto) {
//		objeto.volver()
//	}
}

class Muro inherits Ladrillo {
	
//	method dibujar(n){
//		game.addVisual(n)
//	}
	
	override method image() = "piedra2.png"
//	override method empuja(objeto) = objeto.volver()
}
