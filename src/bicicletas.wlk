/**
 * Altura = rodado + 30
 * Velocidad de crucero = rodado
 * Largo se indica
 * Carga es suma de sus accesorios
 * Precio
 */
class Bicicleta {
	var property rodado
	var property largo
	var property accesorios
	var property marca
	
	method velocidadDeCrucero() { 
		if (largo > 120) {
			return rodado + 6
		} else {
			return rodado + 2
		}
	}
	method altura() { return rodado * 2.5 + 15 }
	method peso() { return rodado / 2 + accesorios.sum { acce => acce.peso()} }
	method carga() { return accesorios.sum { acce => acce.carga() }}
	method tieneLuz() { return accesorios.any { acce => acce.esLuminoso() }}
	method cantidadAccesoriosLivianos() {
		return accesorios.count { acce => acce.peso() < 1 }
	}
	
	method esParecidaA(otraBici) {
		return self.marca() == otraBici.marca()
			and (self.largo() - otraBici.largo()).abs() < 10
	}
}

class Farolito { 
	method peso() { return 0.5 }
	method carga() { return 0 }
	method esLuminoso() { return true }
}

class Canasto {
	var property volumen
	method peso() { return volumen / 10 }
	method carga() { return volumen * 2 }
	method esLuminoso() { return false }
}

class MorralDeBici {
	var property largo
	var property tieneOjoDeGato
	
	method peso() { return 1.2 }
	method carga() { return largo / 3 }
	method esLuminoso() { return tieneOjoDeGato }
}

class Deposito {
	var property bicis
	
	method bicisRapidas() { 
		return bicis.filter {bici => bici.velocidadDeCrucero() > 25 }
	}
	method marcasDeBicis() { return bicis.map { bici => bici.marca() } .asSet() }
	method esNocturno() { return bicis.all { bici => bici.tieneLuz() } }
	method hayBiciParaLlevar(carga) {
		return bicis.any { bici => bici.carga() > carga }
	}

	method marcaDeLaBiciMasRapida() { 
		return bicis.max { bici => bici.velocidadDeCrucero() } .marca()
	}
	method cargaTotalBicisLargas() {
		return bicis.filter { bici => bici.largo() > 170 } 
			.sum { bici => bici.carga() }
	}
	method cantidadBicisSinAccesorios(tope) {
		return bicis.filter { bici => bici.accesorios().isEmpty() } .count()
	}

	method bicisParecidasA(unaBici) {
		return bicis.filter { bici => bici.esParecidaA(unaBici) }
	}
}

























