object trafic {
	var property motor 
	var property interior
	method color(){return 'blanco'}
	
	method velocidadMax(){
	return  motor.velocidadMax()
	}
	method capacidad(){
	return interior.capacidad()
	} 
	method peso(){
		return(4000 + motor.peso() + interior.peso())
	}
}


object motorPulenta{
	method peso(){return 800}
	method velocidadMax(){return 130}
}

object motorBatata{
	method peso(){return 500}
	method velocidadMax(){return 80}
}

object interiorComodo{
	method capacidad(){return 5}
	method peso(){return 700}
}

object interiorPopular{
	method capacidad(){return 12}
	method peso(){return 1000}
}



