import wollok.game.*
import personajes.*
import bordes.*

object laberinto {
	method configurar(){
		game.width(20)
		game.height(10)
		game.title("El laberinto del minotauro")
		game.boardGround("floor10.jpg")
		game.addVisual(caballero)
		game.addVisual(enemigo)

//		game.addVisualIn(muro,game.at(2,2))
//		game.addVisualIn(muro,game.at(2,4))
//		game.addVisualIn(muro,game.at(2,6))
		game.addVisualIn(muro,game.at(2,8))

//ARBUSTOS
		const ancho = game.width() - 1
		const largo = game.height() - 1
	
		(1 .. ancho-1).forEach { n => new ArbustoAbajo(position = new Position(x = n, y = 0)).dibujar() } // bordeAbajo
		(1 .. ancho-1).forEach { n => new ArbustoArriba(position = new Position(x =n, y = largo)).dibujar() } // bordeArriba 
		(0 .. largo).forEach { n => new ArbustoIzquierda(position = new Position(x =0, y = n)).dibujar() } // bordeIzq 
		(0 .. largo).forEach { n => new ArbustoDerecha(position = new Position(x =ancho, y = n)).dibujar() } // bordeDer
		
		keyboard.up().onPressDo{caballero.subir()}
	//	keyboard.up().onPressDo{enemigo.perseguir(caballero.position())}
		keyboard.up().onPressDo{enemigo.perseguir(caballero.position())}
		keyboard.down().onPressDo{caballero.bajar()}
		keyboard.down().onPressDo{enemigo.perseguir(caballero.position())}
	//	keyboard.down().onPressDo{enemigo.perseguir(caballero.position())}
		keyboard.right().onPressDo{caballero.derecha()}
	//	keyboard.right().onPressDo{enemigo.perseguir(caballero.position())}
		keyboard.right().onPressDo{enemigo.perseguir(caballero.position())}
		keyboard.left().onPressDo{caballero.izquierda()}
		keyboard.left().onPressDo{enemigo.perseguir(caballero.position())}
	//	keyboard.left().onPressDo{game.onTick(2000,"perseguir", {enemigo.perseguir(caballero.position())})}
	//	game.onTick(2000,"persiguiendo", {enemigo.perseguir(caballero.position())})
		game.whenCollideDo(muro, { elemento => elemento.volver()})		
					
		}
	method iniciar(){
		caballero.iniciar()
	}
}