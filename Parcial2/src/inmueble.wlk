class Zona{
	var valor
}




class Inmueble {
	const property zona
	const m2
	const ambientes
	const operacion
	
	
	var property valorTotal = self.valorParticular() + zona.valor()
	
	method valorParticular()
}


class Casa inherits Inmueble{
	const valor
	override method valorParticular(){
		return valor
	}
}

class Ph inherits Inmueble{
	override method valorParticular(){
		return (14000 * m2).max(500000)
	}
}

class Departamento inherits Inmueble{
	override method valorParticular(){
		return 350000 * ambientes
	}
}


class Local inherits Casa{
	var tipoDeLocal
	
	method asignarAGalpon(){
		tipoDeLocal = galpon
	}
	
	method asignarALaCalle(){
		tipoDeLocal = aLaCalle
	}
	override method valorParticular(){
		//const valor = valorTotal
		return tipoDeLocal.valorSegunTipo(valorTotal)
	}
}

object galpon{
	method valorSegunTipo(valor){
		return valor / 2
	}
}

object aLaCalle{
	const montoFijo = 500 // el monto no esta especificado asi que di uno aribtrario
	
	method valorSegunTipo(valor){
		return montoFijo + valor
	}
}