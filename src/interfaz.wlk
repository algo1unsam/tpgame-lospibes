import wollok.game.*
import personajes.*
import bordes.*
import accesorios.*

object laberinto {
	method configurar(){
		game.width(20)
		game.height(10)
		game.title("El laberinto del minotauro")
		game.boardGround("suelo.jpg")
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
		const listaDePosiciones = [game.at(1,3), game.at(2,3), game.at(3,3), game.at(3,4),
			game.at(6,4), game.at(6,5), game.at(6,6), game.at(7,6), game.at(9,2),
			game.at(10,2), game.at(10,3), game.at(11,5), game.at(14,6), game.at(15,6), 
			game.at(16,6), game.at(17,6), game.at(18,6), game.at(16,3), game.at(17,3),
			game.at(18,3)]
		
		
		(1 .. ancho-1).forEach { x => new Ladrillo(position = new Position(x = x, y = 0)).dibujar() } // bordeAbajo
		(1 .. ancho-1).forEach { x => new Ladrillo(position = new Position(x =x, y = largo)).dibujar() } // bordeArriba 
		(0 .. largo).forEach { y => new Ladrillo(position = new Position(x =0, y = y)).dibujar() } // bordeIzq 
		(0 .. largo-5).forEach { y => new Ladrillo(position = new Position(x =ancho, y = y)).dibujar() } // bordeDer
		(largo-3 .. largo).forEach { y => new Ladrillo(position = new Position(x =ancho, y = y)).dibujar() }//esta parte se divide en 2 para poner la salida
		
			
		listaDePosiciones.forEach { posicion => game.addVisual(new Muro(position = posicion))} 
			
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

object pantallaDerrota{
	const position = game.at(1,1)
	
	method image() = "fondoDeSangre.png"
	method position() = position
	
	method terminar() = game.stop()
	
}

object pantallaVictoria{
	const property position = game.origin()
	method image() = "fondoVictoria.png"
	method terminar(){game.stop()
		}
}
	
object textoCosas{
	const property position = game.at(12,3)
	method textColor() = paleta.negro()
	method text() { 
		return	if (caballero.reliquias().isEmpty()){"Ninguno"}
		else if (caballero.reliquias().contains(collar)and(caballero.reliquias().contains(anillo))and(caballero.reliquias().contains(diamante))){"Collar, Anillo y Diamante"}
		else if (caballero.reliquias().contains(collar) and (caballero.reliquias().contains(anillo))){"Collar y Anillo"}
		else if (caballero.reliquias().contains(anillo) and (caballero.reliquias().contains(diamante))){"Anillo y Diamante"}
		else if (caballero.reliquias().contains(diamante)and(caballero.reliquias().contains(collar))) {"Collar y Diamante"}
		else if (caballero.reliquias().contains(collar)){"Collar"}
		else if (caballero.reliquias().contains(anillo)) {"Anillo"}
		else {"Diamante"}
		}
		
		}
object paleta {
	const property negro = "#000000"
}
