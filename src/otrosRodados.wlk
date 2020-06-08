import wollok.game.*
import colores.*

class ChevroletCorsa {
	var property image = "autitorojo.png"
	var property position = game.at(4,7)
	var property listaPosiciones =  [position]
	var colorVehiculo 
	
	method guardarPosicion(){
		listaPosiciones.add(self.position())
	}
	method pasoPor(posicionX,posicionY){
		return listaPosiciones.map({pos => [pos.x(), pos.y()]}).contains([posicionX,posicionY])
	}
	method pasoPorFila(numero){
        		return listaPosiciones.map({pos => pos.y()}).asSet().contains(numero)
    }
    
	method recorrioFilas(listaDeNumeros){
		return listaDeNumeros.all({numero => self.pasoPorFila(numero)})
	}
	
	
	method moverseArriba() {
        		self.position(self.position().up(1))
        		self.guardarPosicion()
    }

    	method moverseAbajo() {
        		self.position(self.position().down(1))
        		self.guardarPosicion()
    }

    	method moverseDerecha() {
        		self.position(self.position().right(1))
        		self.guardarPosicion()
    }

    	method moverseIzquierda() {
        		self.position(self.position().left(1))
        		self.guardarPosicion()
    }
    	method cambiarAVerde(){ image = verde.image() }
    	method cambiarAAzul(){ image = azul.image() }
    	method cambiarARojo(){ image = rojo.image() }

    
	method capacidad(){return 4}
	method velocidadMax(){return 150}
	method peso(){return 1300}
	method definirColor(color){colorVehiculo = color}
	method color(){return colorVehiculo}
}

class RenaultKwid {
	var tanqueAdicional =false
	method capacidad(){return if(tanqueAdicional){3}else{4}}
	method velocidadMax(){return if(tanqueAdicional){110}else{120}}
	method peso(){const peso = 1200 return if(tanqueAdicional){peso + 150}else{peso}}
	method color(){return 'azul'}
	method agregarTanque(){tanqueAdicional = true}
	method quitarTanque(){tanqueAdicional = false}
	}

class SuperSpecial {
	var property capacidad = 0
	var property velocidadMax = 0
	var property peso = 0
	var property color
}


	
/*
class SuperSpecial {
	var capacidad = 0
	var velocidadMax = 0
	var peso = 0
	var color
	 
	 method definirCapacidad(unaCapacidad){capacidad = unaCapacidad}
	 method definirVelocidadMax(unaVelocidad){velocidadMax = unaVelocidad}
	 method definirPeso(unPeso){peso = unPeso}
	 method definirColor(uncolor){color = uncolor}
	
	method capacidad(){return capacidad}
	method velocidadMax(){return velocidadMax}
	method peso(){return peso}
	method color(){return color}
}
*/	


