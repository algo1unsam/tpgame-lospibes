import wollok.game.*
import interfaz.*

//object piedra {
//
//  var property position=self.poner()
//  method image() = "piedra2.png"
//  method poner() {
//    const x = (2.. game.width()-2).anyOne() 
//    const y = (2.. game.height()-2).anyOne() 
//    position=game.at(x,y)
//  	return position
//    }
//    
//}
object caballero {
	var vivo = true
	var property position = game.at(1,1)
	var reliquias = []
	var anterior
	
	method image() = "caballero2.png"
	method position() = position
	
	method agarrar(reliquia){
		reliquias.add(reliquia)
		game.removeVisual(reliquia)
	}

	method subir(){
		anterior = position
		position = position.up(1)
		enemigo.perseguir(caballero.position())
	}
	
	method derecha(){
		anterior = position
		position = position.right(1)
		enemigo.perseguir(caballero.position())
	}
	
	method izquierda(){
		anterior = position
		position = position.left(1)
		enemigo.perseguir(caballero.position())
	}
	
	method bajar(){
		anterior = position
		position = position.down(1)
		enemigo.perseguir(caballero.position())
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
	
	method colisionar(colisionado){
		enemigo.matar()
	}
	method escapar(){
		game.onTick(2000,"terminar", {pantallaVictoria.terminar()})
	}
}

object enemigo {
	var property position = game.at(17,5)
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
		}
	
		}
	method volver(){
		position = anterior
	}
	
	method colisionar(colisionado){
	}
	
	method matar(){
		game.say(self,"¡Moriste rey!")
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

object pantallaVictoria{
	
	method terminar() = game.stop()
}