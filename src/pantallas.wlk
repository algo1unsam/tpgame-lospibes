import wollok.game.*
import interfaz.*
import personajes.*

class Pantalla{
	var property image
	var property position = game.origin()
}

object pantallaDeInicio inherits Pantalla (image="PantallaDeInicio.jpg", position = game.origin()){}
object pantallaDeComoJugar inherits Pantalla(image="ComoJugar.jpg", position = game.origin()){}
object pantallaDeCreditos inherits Pantalla(image="creditosEjemplo.jpg", position = game.origin()){}