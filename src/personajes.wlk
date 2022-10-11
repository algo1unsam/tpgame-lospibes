import wollok.game.*

object caballero {
	var vivo = true
	var position = game.origin()
	var anterior
	
	method image() = "caballero2.png"
	method position() = position
	
//	method morir() {
//		vivo = false
//		game.addVisual(pantallaDerrota)
//	}
	
	method subir(){
		anterior = position
		position = position.up(1)
	}
	
	method derecha(){
		anterior = position
		position = position.right(1)
	}
	
	method izquierda(){
		anterior = position
		position = position.left(1)
	}
	
	method bajar(){
		anterior = position
		position = position.down(1)
	}
	
	method volver(){
		position = anterior
	}
	
	method iniciar() {
		vivo = true
	}
	method estaVivo() {
		return vivo
	}
}

object enemigo {
	var position = game.at(15,7)
	var anterior
	
	method image() = "minotauro2.png"
	method position() = position
	
	method perseguir(destino) {
		if (position.x()>destino.x()){
			self.izquierda()
		}
		else if (position.x()<destino.x()){
			self.derecha()
		}
		else if (position.y() > destino.y()){
			self.bajar()
		}
		else if (position.y() < destino.y()){
			self.subir()
		}
	}
	method volver(){
		position = anterior
	}
	
	method matar(){
		game.say(self,"¡Moriste rey!")
	}
	
	method subir(){
		anterior = position
		position = position.up(1)
	}
	
	method derecha(){
		anterior = position
		position = position.right(1)
	}
	
	method izquierda(){
		anterior = position
		position = position.left(1)
	}
	
	method bajar(){
		anterior = position
		position = position.down(1)
	}
	
}

object muro {
	var position = game.center()
	
	method image() = "piedra2.png"
	method position() = position
}

//object pantallaDerrota{
//	var position = game.at(1,1)
//	
//	method image() = "suelo4.jpg"
//	method position() = position
//	
//}