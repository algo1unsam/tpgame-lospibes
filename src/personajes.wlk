import wollok.game.*
import interfaz.*

object caballero {
	var vivo = true
	var property position = game.at(1,1)
	var anterior
	
	method image() = "caballero2.png"
	method position() = position
	
//	method morir() {
//		game.addVisual(pantallaDerrota)
//		vivo = false
//		self.terminar()
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
	
//	method terminar(){
//	}
}

object enemigo {
	var property position = game.at(18,8)
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
		else if (position.y()>destino.y()){
			self.bajar()
			
		}
		else if (position.y()<destino.y()){
			self.subir()
		}else {game.onCollideDo(self, { objeto => self.matar(objeto)})}
	}
	method volver(){
		position = anterior
	}
	
	method matar(objeto){
		game.say(self,"¡Moriste rey!")
//		caballero.morir()
		game.addVisual(pantallaDerrota)
		game.onTick(2000,"terminar", {pantallaDerrota.terminar()})
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
	const position = game.center()	
	method image() = "piedra2.png"
	method position() = position
}
object pantallaDerrota{
	const position = game.at(1,1)
	
	method image() = "fondoDeSangre.png"
	method position() = position
	
	method terminar() = game.stop()
	
}