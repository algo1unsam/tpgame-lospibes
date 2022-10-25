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
	//	game.addVisualIn(salida,salida.position())
		game.addVisual(salida)
//		game.addVisualIn(piedra,piedra.poner())
		//game.onTick(1000, "movimiento", {piedra.poner()})

//LadrilloS
		const ancho = game.width() - 1
		const largo = game.height() - 1
		
		const listaDePos = [[1,3],[2,3],[3,3],[3,4],[2,7],[2,8],[3,8],[4,8],[6,4],[6,5],[6,6],
			[7,6],[9,2],[10,2],[10,3],[11,5],[14,6],[15,6],[16,6]]
		
		(1 .. ancho-1).forEach { n => new LadrilloAbajo(position = new Position(x = n, y = 0)).dibujar() } // bordeAbajo
		(1 .. ancho-1).forEach { n => new LadrilloArriba(position = new Position(x =n, y = largo)).dibujar() } // bordeArriba 
		(0 .. largo).forEach { n => new LadrilloIzquierda(position = new Position(x =0, y = n)).dibujar() } // bordeIzq 
		(0 .. largo).forEach { n => new LadrilloDerecha(position = new Position(x =ancho, y = n)).dibujar() } // bordeDer
		
		//listaDePos.forEach { n => new Muro(position = new Position(x =n.get(0), y = n.get(1))).dibujar()}
		listaDePos.forEach { n => game.addVisual(new Muro(position = new Position(x = n.get(0), y = n.get(1))))} //todas la piedras
		
		keyboard.up().onPressDo{caballero.subir()}
		keyboard.w().onPressDo{caballero.subir()}
		keyboard.up().onPressDo{enemigo.perseguir1(caballero.position())}
		keyboard.w().onPressDo{enemigo.perseguir1(caballero.position())}
		keyboard.down().onPressDo{caballero.bajar()}
		keyboard.s().onPressDo{caballero.bajar()}
		keyboard.down().onPressDo{enemigo.perseguir1(caballero.position())}
		keyboard.s().onPressDo{enemigo.perseguir1(caballero.position())}
		keyboard.right().onPressDo{caballero.derecha()}
		keyboard.d().onPressDo{caballero.derecha()}
		keyboard.right().onPressDo{enemigo.perseguir1(caballero.position())}
		keyboard.d().onPressDo{enemigo.perseguir1(caballero.position())}
		keyboard.left().onPressDo{caballero.izquierda()}
		keyboard.a().onPressDo{caballero.izquierda()}
		keyboard.left().onPressDo{enemigo.perseguir1(caballero.position())}
		keyboard.a().onPressDo{enemigo.perseguir1(caballero.position())}
		//game.whenCollideDo(piedra, { elemento => elemento.volver()})		
		game.onCollideDo(enemigo, {elemento => elemento.colisionar(enemigo)})
		game.onCollideDo(caballero, {elemento => elemento.colisionar(caballero)})
		}
	method iniciar(){
		caballero.iniciar()
	}
}