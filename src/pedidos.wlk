import trafic.*
import otrosRodados.*
import dependencia.*

class Pedido {
	var property distanciaARecorrer = 0
	var property tiempoMaximo = 0
	var property cantPasajeros = 0
	var property coloresIncompatibles = #{}
	
	method velocidadRequerida(){
		return distanciaARecorrer / tiempoMaximo
	}
	method satisfaction(unAuto){
		return unAuto.velocidadMax() >= (self.velocidadRequerida() + 10) and
		unAuto.capacidad() >= self.cantPasajeros() and
		not coloresIncompatibles.contains(unAuto.color())
	}
	method acelerar(){tiempoMaximo -= 1}
	method relajar(){tiempoMaximo += 1}
	
	method esColorIncompatible(unColor){
		return coloresIncompatibles.contains(unColor)
	}
}