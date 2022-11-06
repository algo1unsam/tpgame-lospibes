import wollok.game.*
import personajes.*
import interfaz.*

class Ladrillo {
	var property position
	var property image = "ladrillos.png"
	
	method dibujar() {
		position.drawElement(self)
	}
	method colisionar(colisionado){
		colisionado.volver()
	}
}

class Muro inherits Ladrillo {
	
	override method image() = "piedra.png"

}

object salida inherits Ladrillo(position = game.at(19,5), image = 'salida.png') {
	const posicionNivel2 = game.at(0,8)
	const posicionNivel3 = game.at(10,0)
	method cambiarPosicionInicial(){
		position = posicionNivel2
		image = "SalidaNivel2.png"
	}
	method cambiarPosicionNivel3(){
		position = posicionNivel3
		image = "SalidaFinal.png"
	}
	override method colisionar(colisionado){
		
		if (colisionado == caballero) {
			if (position.x() == 19 and position.y()==5){laberinto.iniciarNivel2()}
			else if(position.x()== 0 and position.y()==8) {laberinto.iniciarNivel3()}
			else {caballero.escapar()}
		}
	}
	
}
