import wollok.game.*
import interfaz.*
import personajes.*
import accesorios.*

class Pantalla{
	var property image
	var property position = game.origin()
	method terminar() {
			laberinto.reiniciarPosiciones()
			laberinto.configurar()
	}
	
}

object pantallaDeInicio inherits Pantalla (image="PantallaDeInicio.jpg"){}
object pantallaConfig inherits Pantalla(image="pantallaConfiguracion.png"){}
object pantallaHistoria inherits Pantalla (image="pantallaHistoria.png"){}
object pantallaComoJugar inherits Pantalla(image="pantallaComoJugar.png"){}
object pantallaDeCreditos inherits Pantalla(image="pantallaCreditos.png"){}
object pantallaDerrota inherits Pantalla(image="pantallaDerrota.png"){}
object pantallaVictoria inherits Pantalla(image="fondoVictoria.png"){}
	
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