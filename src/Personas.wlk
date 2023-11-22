import Pociones.*

class Persona {
	var fuerza = 0
	var resistencia = 0
	var fueraDeCombate
	
	method fuerza() = fuerza
	method resistencia() = resistencia
	
	method aumentarFuerza(aumento) {
		fuerza += aumento
	}
	
	method aumentarResistencia(aumento) {
		if(resistencia + aumento < 0)
			fueraDeCombate = true
		else
			resistencia += aumento
	}
	
	method estaFueraDeCombate() = fueraDeCombate
	
	method revivir() {
		fueraDeCombate = false
	}
	
	method poder() = fuerza * resistencia
	
	method recibirDano(dano) {
		self.aumentarResistencia(-dano)
	}
	
	method prepararPocion(ingredientes) = new Pocion(ingredientesPocion = ingredientes)
	
	method tomarPocion(ingredientes) =  self.prepararPocion(ingredientes).serConsumida(self)
}