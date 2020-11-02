object inmobiliaria{
	var property porcentajePorVenta = 1.015
	const brokers = #{}
	
	
	method mejorPorComision(){
		return self.mejorBrokerSegun(porTotalComision)
	}
	
	method mejorPorCerradas(){
		return self.mejorBrokerSegun(porTotalCerradas)
	}
	
	method mejorPorReservas(){
		return self.mejorBrokerSegun(porTotalReservas)
	}
	
	method mejorBrokerSegun(criterio){
		return brokers.max({broker => criterio.segun(broker)})
	}
}

object porTotalComision{
	method segun(broker){
		return broker.totalComision()
	}
}

object porTotalCerradas{
	method segun(broker){
		return broker.totalCerradas()
	}
}

object porTotalReservas{
	method segun(broker){
		return broker.totalReservas()
	}
}

class Broker{
	const operacionesCerradas = #{}
	const property reservas = #{}
	
	method totalComision(){
		return operacionesCerradas.sum({operacion => operacion.comision()})
	}
	
	method totalCerradas(){
		return operacionesCerradas.size()
	}
	
	method totalReservas(){
		return reservas.size()
	}

	method vaATenerProblemasCon(otroEmpleado){
		return self.operoEnLaMismaZonaQue(otroEmpleado) && 
		(self.concretoOperacionReservadaPor(otroEmpleado) || otroEmpleado.concretoOperacionReservadaPor(self))
	}


	method operoEnLaMismaZonaQue(otroEmpleado){
		return self.zonasEnLasQueOpero().any{zona => otroEmpleado.operoEnZona(zona)}
	}
	
	method operoEnZona(zona){
		return self.zonasEnLasQueOpero().contains(zona)
	}
	
	method zonasEnLasQueOpero(){
		return operacionesCerradas.map{operacion => operacion.zona()}.asSet()// elimino los repetidos
	}
	
	method concretoOperacionReservadaPor(otroEmpleado){
		return operacionesCerradas.any{operacion => otroEmpleado.reservas().contains(operacion)}
	}
}


/*class Cliente{
	const nombre
}*/