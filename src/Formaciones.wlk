object tortuga {
	method poder(poderLegion) = 0
	method calcularDano(dano) = 0
}

class EnCuadro {
	method poder(poderLegion) = poderLegion
}

object frontemAllargate {
	method poder(poderLegion) = poderLegion * 1.1
}