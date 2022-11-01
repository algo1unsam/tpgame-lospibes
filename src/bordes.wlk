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

class Muro inherits Ladrillo {
	
	override method image() = "piedra.png"

}

object salida{
	const property position = game.at(19,5)
	
	method image()= 'salida.png'
	
	method colisionar(colisionado){
		
		if (colisionado == caballero) {
			caballero.escapar()
		}
	}
	
}
