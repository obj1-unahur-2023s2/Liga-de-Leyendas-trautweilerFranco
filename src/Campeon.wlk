import Oleada.*
class Campeon {
	var property puntosDeVida
	var property puntosDeAtaque
	var puntosDeDanioAcumulado = 0
	const items = []
	var property unidadesBloqueo
	
	method comprarItem(unItem) = items.add(unItem)
	method venderItem(unItem){
		if (items.contains(unItem)){
			items.remove(unItem)		
		} else {
			self.error("El item no fue comprado por el campeon")
		}
	}
	
	method puntosDeVidaConItems(){puntosDeVida += items.sum({i => i.puntosDeVidaQueOtorga(self)})}
	method puntosDeAtaqueConItems(){puntosDeAtaque += items.sum({i => i.puntosDeAtaqueQueOtorga(self)})}	

	method recibirAtaque(unaOleada){
		if(puntosDeDanioAcumulado <= self.puntosDeVida()){
			puntosDeDanioAcumulado += unaOleada.danioOleada()
		} else{
			self.error("El campeon ha muerto")
		}
	}
	
	method realizarBloqueo(){
		unidadesBloqueo --
	}
	
	method danioAcumulado() = puntosDeDanioAcumulado	
	method cantidadDeBloqueos() = unidadesBloqueo
	
	method itemMasVida() = items.max({i => i.puntosDeVidaQueOtorga(self)})
	method itemMasAtaque() = items.max({i => i.puntosDeAtaqueQueOtorga(self)})
	method itemEspecial() = items.any({i => i.puntosDeVidaQueOtorga(self) > 70 or i.puntosDeAtaqueQueOtorga(self) > 30})
	method listaDePesos(){} //= items.forEach({i => i.peso()}).asList()
	method itemsLivianos() = items.count({ i => i.peso() < 300})
}