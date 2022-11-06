import wollok.game.*
import interfaz.*
import personajes.*

class Pantalla{
	var property image
	var property position = game.origin()
}

object pantallaDeInicio inherits Pantalla (image="PantallaDeInicio.jpg", position = game.origin()){}
object pantallaConfig inherits Pantalla(image="pantallaConfiguracion.png", position =game.origin()){}
object pantallaHistoria inherits Pantalla (image="pantallaHistoria.png", position = game.origin()){}
object pantallaComoJugar inherits Pantalla(image="pantallaComoJugar.png", position = game.origin()){}
object pantallaDeCreditos inherits Pantalla(image="pantallaCreditos.png", position = game.origin()){}