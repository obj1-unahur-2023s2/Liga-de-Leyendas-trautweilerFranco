import Campeon.*
import Items.*

class Oleada {
	var  cantidadMinions
	var  plus
	
	method danioOleada(){
		 return cantidadMinions + plus
	}
	method recibirAtaque(unCampeon){
		cantidadMinions -= unCampeon.puntosDeAtaque()/2
	}
	method reducirPlus(unCampeon) = if(unCampeon.puntosDeAtaque().between(20,40)){0.max(plus -= 1)} else {0.max(plus -= 2)}
	
}

