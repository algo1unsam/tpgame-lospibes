import wollok.game.*
import personajes.*

class Ladrillo {
	var property position
	
	method dibujar() {
		position.drawElement(self)
		//game.whenCollideDo(self, { objeto => objeto.volver() })
	}

	method image() = "ladrillos.png"
	method colisionar(colisionado){
		colisionado.volver()
	}
}

class LadrilloArriba inherits Ladrillo {
		
}

class LadrilloAbajo inherits Ladrillo {
		
}

class LadrilloIzquierda inherits Ladrillo {
	

}

class LadrilloDerecha inherits Ladrillo {
		

}

class Muro inherits Ladrillo {
	
	override method image() = "piedra2.png"

}

object salida{
	const property position = game.at(19,5)
	
	method image()= 'salidaNueva.png'
	
	method colisionar(colisionado){
		
		if (colisionado == caballero) {
			caballero.escapar()
		}
	}
	
}
