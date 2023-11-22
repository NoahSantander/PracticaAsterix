import Personas.*

class Ingrediente {
	method afectarPersona(persona)
}

object dulceDeLeche inherits Ingrediente {
	override method afectarPersona(persona) {
		persona.aumentarFuerza(10)
		if(persona.estaFueraDeCombate())
		{
			persona.revivir()
			persona.aumentarResistencia(2)
		}
	}
}

class ManojoDeMuerdago inherits Ingrediente {
	const tamano
	
	override method afectarPersona(persona) {
		persona.aumentarFuerza(tamano)
		if(tamano > 5)
			persona.aumentarResistencia(-persona.resistencia()/2)
	}
}

class AceiteDeRoca inherits Ingrediente {
	const dosis
	
	override method afectarPersona(persona) {
		persona.aumentarFuerza((dosis - 1) * persona.fuerza())
	}
}

class ZumoDeZanahoria inherits AceiteDeRoca {
	override method afectarPersona(persona) {
		super(persona)
		persona.aumentarResistencia(1)
	}
}