import wollok.game.*
import personajes.*

object laberinto {
	method configurar(){
		game.width(17)
		game.height(10)
		game.title("El laberinto del minotauro")
		game.boardGround("suelo.jpg")
		game.addVisual(caballero)
		game.addVisual(enemigo)
		game.addVisual(muro)

		keyboard.up().onPressDo{caballero.subir()}
		keyboard.up().onPressDo{enemigo.perseguir(caballero.position())}
		keyboard.down().onPressDo{caballero.bajar()}
		keyboard.down().onPressDo{enemigo.perseguir(caballero.position())}
		keyboard.right().onPressDo{caballero.derecha()}
		keyboard.right().onPressDo{enemigo.perseguir(caballero.position())}
		keyboard.left().onPressDo{caballero.izquierda()}
		keyboard.left().onPressDo{enemigo.perseguir(caballero.position())}
		
		game.whenCollideDo(muro, { elemento => elemento.volver()})
		
		}
	method iniciar(){
		caballero.iniciar()
	}
}