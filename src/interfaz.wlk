import wollok.game.*
import personajes.*
import bordes.*
import accesorios.*

object laberinto {
	method configurar(){
		game.width(20)
		game.height(10)
		game.title("El laberinto del minotauro")
		game.boardGround("floor10.jpg")
		game.addVisual(caballero)
		game.addVisual(enemigo)
		game.addVisual(salida)
		game.addVisual(collar)
		game.addVisual(anillo)
		game.addVisual(diamante)


//Posiciones de Ladrillos
		const ancho = game.width() - 1
		const largo = game.height() - 1

//Posiciones de las piedras		
		const listaDePos = [[1,3],[2,3],[3,3],[3,4],[2,7],[2,8],[3,8],[4,8],[6,4],[6,5],[6,6],
			[7,6],[9,2],[10,2],[10,3],[11,5],[14,6],[15,6],[16,6]]
		
		
		(1 .. ancho-1).forEach { n => new LadrilloAbajo(position = new Position(x = n, y = 0)).dibujar() } // bordeAbajo
		(1 .. ancho-1).forEach { n => new LadrilloArriba(position = new Position(x =n, y = largo)).dibujar() } // bordeArriba 
		(0 .. largo).forEach { n => new LadrilloIzquierda(position = new Position(x =0, y = n)).dibujar() } // bordeIzq 
		(0 .. largo-5).forEach { n => new LadrilloDerecha(position = new Position(x =ancho, y = n)).dibujar() } // bordeDer
		(largo-3 .. largo).forEach { n => new LadrilloDerecha(position = new Position(x =ancho, y = n)).dibujar() }	
		
			
		listaDePos.forEach { n => game.addVisual(new Muro(position = new Position(x = n.get(0), y = n.get(1))))} //todas la piedras
		
		keyboard.up().onPressDo{caballero.subir()}
		keyboard.w().onPressDo{caballero.subir()}
		keyboard.down().onPressDo{caballero.bajar()}
		keyboard.s().onPressDo{caballero.bajar()}
		keyboard.right().onPressDo{caballero.derecha()}
		keyboard.d().onPressDo{caballero.derecha()}
		keyboard.left().onPressDo{caballero.izquierda()}
		keyboard.a().onPressDo{caballero.izquierda()}
		
		game.onCollideDo(enemigo, {elemento => elemento.colisionar(enemigo)})
		game.onCollideDo(caballero, {elemento => elemento.colisionar(caballero)})
		}
		
	method iniciar(){
		caballero.iniciar()
	}
}