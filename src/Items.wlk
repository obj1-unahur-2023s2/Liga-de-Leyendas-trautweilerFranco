import Campeon.*
import Batalla.*	

class Item {
	const peso

	method peso() = peso
	
	method puntosDeVidaQueOtorga(unCampeon) = if(peso <= 500) 20 else 40

	method puntosDeAtaqueQueOtorga(unCampeon) = if(peso <= 500) 10 else 5
	
	method equiparItem(unCampeon)
	
	method desequiparItem(unCampeon)
	
}

class Doran inherits Item {
	
	override method puntosDeVidaQueOtorga(unCampeon) = super(unCampeon) + 60
	override method puntosDeAtaqueQueOtorga(unCampeon) = super(unCampeon) + 15
	override method equiparItem(unCampeon) = unCampeon.puntosDeAtaque() + 5 
	override method desequiparItem(unCampeon) = unCampeon.puntosDeAtaque() - 10
}

class TomoAmplificador inherits Item {
	
	override method puntosDeVidaQueOtorga(unCampeon){
		return super(unCampeon) + (25/100)*unCampeon.danioAcumulado()
	}

	override method puntosDeAtaqueQueOtorga(unCampeon){
		return super(unCampeon) + unCampeon.danioAcumulado() * 0.10
	}

	override method equiparItem(unCampeon) = unCampeon.unidadesBloqueo() + 2 
	override method desequiparItem(unCampeon) = unCampeon.puntosDeAtaque() + 30
}

class Rabadon inherits TomoAmplificador{

	override method puntosDeVidaQueOtorga(unCampeon){
		return super(unCampeon) * 2
	}

	override method puntosDeAtaqueQueOtorga(unCampeon){
		return super(unCampeon) + 2
	}

	override method equiparItem(unCampeon){
		super(unCampeon)
		return unCampeon.puntosDeAtaque() + 10
	}
}

class Baston inherits Item {
	const itemsDentro = #{}
	const property pesoBaston
	
	method agregarItemDentro(unItem) = itemsDentro.add(unItem)
	
	method sacarItemDentro(unItem) = if(itemsDentro.contains(unItem)){itemsDentro.remove(unItem)} else {self.error("item no esta en el baston")}
		
	
	override method puntosDeVidaQueOtorga(unCampeon) = unCampeon.puntosDeVida() + itemsDentro.sum({i => i.peso()}) + pesoBaston
	
	override method puntosDeAtaqueQueOtorga(unCampeon) = unCampeon.puntosDeAtaque() + itemsDentro.sum({i => i.peso()}) + pesoBaston
}



