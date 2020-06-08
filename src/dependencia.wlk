import trafic.*
import otrosRodados.*
import pedidos.*

class Dependencia {
	const property flota = []
	var property cantidadEmpleados = 0
	const property registroPedidos= []
	
	method agregarAFlotaVarios(listaRodados){
		flota.addAll(listaRodados)
	}
	
	method agregarVariosPedidos(listaPedidos){
		registroPedidos.addAll(listaPedidos)
	}
	
	
	/* 
	method agregarAFlota(rodado){
		flota.add(rodado)
	}
	method agregarAFlotaVarios(listaRodados){
		flota.addAll(listaRodados)
	}
	method quitarDeFlota(rodado){
		flota.remove(rodado)
	}
	method contratarEmpleados(cantidad){
		cantidadEmpleados += cantidad
	}
	method rajarEmpleados(cantidad){
		cantidadEmpleados -= cantidad
	}
	method cantidadEmpleados(){
		return(cantidadEmpleados)
	}
	
	*/
	method pesoTotalFlota(){
		return(flota.sum({cosas => cosas.peso()}))
	}
	method estaBienEquipada(){
		/*
		 * es verdadero si la flota tiene al menos 3 
		 * rodados, y además, todos los rodados 
		 * de la flota pueden ir al menos a 100 km/h.
		 */
		  return(flota.size() >= 3 and flota.all({cosas => cosas.velocidadMax() >= 100}))
	}
	method capacidadTotalEnColor(color){
		/*  
		 * la cantidad total de personas que puede transportar la flota 
		 * afectada a la dependencia, considerando solamente los rodados 
		 * del color indicado.
		 */
		 return(flota.filter({cosas => cosas.color()==color}).sum({cosas => cosas.capacidad()}))
	}
	method colorDelRodadoMasRapido(){
		return(flota.max({cosas => cosas.velocidadMax()}).color())
	}
	method capacidadFaltante(){
		/*
		 * que es el resultado de restar, de la cantidad de empleados, 
		 * la capacidad sumada de los vehículos de la flota.
		 */
		 return 0.max(cantidadEmpleados - self.capacidadTotalDeLaFlota())
	}
	method esGrande(){
		/*
		 * la condición es que la dependencia tenga 
		 * al menos 40 empleados y 5 rodados.
		 */
		 return(cantidadEmpleados >= 40 and flota.size() >= 5)
	}
	method capacidadTotalDeLaFlota(){
		return(flota.sum({cosas => cosas.capacidad()}))
	}
	method totalPasajerosEnPedidos(){
		return registroPedidos.sum({cosa => cosa.cantPasajeros()})
	}
	method pedidosNoSatisfechos(){
		return registroPedidos.filter({pedido => self.pedidoNoSatisfecho(pedido)})
		}
	
	method pedidoNoSatisfecho(unPedido){
		return flota.all({auto => not(unPedido.satisfaction(auto))})
	}
	
	method colorIncompatible(unColor){
		return registroPedidos.all({cosa =>  cosa.esColorIncompatible(unColor)})
	}
	method relejarTodos(){
		registroPedidos.forEach({cosa => cosa.relajar()})
	}
}





