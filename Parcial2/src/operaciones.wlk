import Inmobiliaria.*
import inmueble.*

class Operacion {
	const inmueble
	//const inmobiliaria
	var estado = new Disponble()
	const property zona = inmueble.zona()
	
	method comision()
	method reservarPara(cliente){
		estado.reservar(self,cliente)
	}
	
	method concretarPara(cliente){
		estado.cerrar(self,cliente)
	}
	
	method estado(unEstado){
		estado = unEstado
	}
}


class Vender inherits Operacion{
	override method comision(){
		return inmueble.valorTotal() * inmobiliaria.porcentajePorVenta()
	}
}


class Alquiler inherits Operacion{
	const meses
	
	override method comision(){
		return  meses * inmueble.valorTotal() / 50000
	}
}


class Estado{
	method reservar(operacion,cliente)
	
	method cerrar(operacion,cliente)
	
}


class Disponble inherits Estado{
	override method reservar(operacion,cliente){
		operacion.estado(new Reservado(clienteQueReservo = cliente))
	}
	override method cerrar(operacion,cliente){
		throw new Exception(message = "primero hay que reservar")
	}
}

class Reservado inherits Estado{
	const clienteQueReservo 
	
	override method reservar(operacion,cliente){
		throw new Exception(message = "ya se reservo rey")
	}
	override method cerrar(operacion,cliente){
		if(cliente != clienteQueReservo){
			throw new Exception(message = "tenes que ser el mismo cliente para cerrar rey" )
		}else{
			operacion.estado(new Cerrada())
		}
	}
}

class Cerrada inherits Estado{
	override method reservar(operacion,cliente){
		throw new Exception(message = "ya esta cerrada")
	}
	override method cerrar(operacion,cliente){
		throw new Exception(message = "ya esta cerrada")
	}
}
