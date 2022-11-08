import wollok.game.*
import interfaz.*
import accesorios.*


object caballero {

	var property position = game.at(1,1)
	const posicionNivel2 = game.at(18,5)
	const posicionNivel3 = game.at(1,8)
	var property reliquias = []
	var anterior
	
	method image() = "caballero.png"
	method position() = position
	
	method agarrar(reliquia){
		reliquias.add(reliquia)
			game.say(self, "Conseguí el " + reliquia) //!!!!!! quedó

		game.removeVisual(reliquia) 
	}

	method subir(){
		anterior = position
		position = position.up(1)
		game.schedule(200, { enemigo.perseguir(self.position()) })
		game.schedule(300, { enemigo.perseguir(self.position()) })
	}
	
	method derecha(){
		anterior = position
		position = position.right(1)
		game.schedule(200, { enemigo.perseguir(self.position()) })
		game.schedule(300, { enemigo.perseguir(self.position()) })
	}
	
	method izquierda(){
		anterior = position
		position = position.left(1)
		game.schedule(200, { enemigo.perseguir(self.position()) })
		game.schedule(300, { enemigo.perseguir(self.position()) })

	}
	
	method bajar(){
		anterior = position
		position = position.down(1)
		game.schedule(200, { enemigo.perseguir(self.position()) })
		game.schedule(300, { enemigo.perseguir(self.position()) })
	}
	
	method volver(){
		position = anterior
	}

	
	method colisionar(colisionado){
		enemigo.matar()
	}
	
	method cambiarPosicionInicial(){
		position = posicionNivel2
}
	method cambiarPosicionNivel3(){
		position = posicionNivel3
	}
	
	method escapar(){
		game.addVisual(pantallaVictoria)
		game.addVisual(textoCosas)
		game.onTick(5000,"terminar", {pantallaVictoria.terminar()})
	}

	method matar(){}
	method perseguir(){enemigo.perseguir(self.position())}
}

object enemigo {
	var property position = game.at(17,5)
	const posicionNivel2 = game.at(2,8)
	const posicionNivel3 = game.at(10,2)
	var anterior
	
	method image() = "minotauro.png"
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
	
	method colisionar(colisionado){}
	
	method matar(){
		game.say(self,"¡Moriste rey!")
		game.addVisual(pantallaDerrota)
		game.onTick(4000,"terminar", {pantallaDerrota.terminar()})
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
	
	method agarrar(nada){
	}
	
	method cambiarPosicionInicial(){
		position = posicionNivel2
	}
	method cambiarPosicionNivel3(){
		position = posicionNivel3
	}
	
}

