class Pocion {
	const ingredientesPocion = []
	
	method serConsumida(persona) {
		ingredientesPocion.forEach({ ingrediente => ingrediente.afectarPersona(persona) })
	}
}
