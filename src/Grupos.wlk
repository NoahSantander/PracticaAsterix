import Personas.*
import Formaciones.*

class Grupo {
	const integrantes = #{}
	
	method todosPuedenPelear() = integrantes.all({ integrante => !integrante.estaFueraDeCombate() })
	method puedenCombatir() = integrantes.filter({ integrante => !integrante.estaFueraDeCombate() })
	method poder() = self.puedenCombatir().sum({ integrante => integrante.poder() })
	
	method aplicarDano(quienes, dano) {
		quienes.forEach({ quien => quien.recibirDano(dano/quienes.size()) })
	}
	
	method vanAdelante(cuantos) = integrantes.sortedBy({ integrante, integranteSiguiente => integrante.poder() > integranteSiguiente.poder()}).take(10)
	method recibirDano(dano) {
		if(integrantes.size() > 10)
			self.aplicarDano(integrantes, dano)
		else
			self.aplicarDano(self.vanAdelante(10), dano)
	}
	
	method integranteMenosPoderoso() = integrantes.min({ integrante => integrante.poder() })
	
	method diferenciaDePoder(grupoContrincante) = (self.poder() - grupoContrincante.poder()).abs()
	method sePuedePelear(grupoContrincante) = self.todosPuedenPelear() && grupoContrincante.todosPuedenPelear()
	method pelear(grupoContrincante) {
		if(self.sePuedePelear(grupoContrincante))
			self.integranteMenosPoderoso().recibirDano(self.diferenciaDePoder(grupoContrincante))
	}
}

class Legion inherits Grupo {
	var formacion
	const minimo
	
	method cambiarFormacion(nuevaFormacion) {
		formacion = nuevaFormacion
	}
	
	override method poder() = formacion.poder(super())
	
	override method recibirDano(dano) {
		super(formacion.calcularDano(dano))
		if(self.poder() < minimo)
			self.cambiarFormacion(tortuga)
	}
}