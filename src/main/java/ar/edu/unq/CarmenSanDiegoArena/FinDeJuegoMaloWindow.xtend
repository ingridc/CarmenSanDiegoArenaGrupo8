package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.WindowOwner
import appModel.AppModelPartida

class FinDeJuegoMaloWindow extends FinDeJuegoBuenoWindow{
	
	new(WindowOwner parent, AppModelPartida model) {
		super(parent, model)
		title = "WASTED"
	}
	
	override textoBoton(){
		"Sos boleta"
	}
	
	override textoInfo(){
		if(modelObject.ordenDeArresto!= null){
		"Reporta2 perro

		 Atrapaste a "+ modelObject.casoActual.responsable.getNombre + " pero tenias una orden contra "+modelObject.ordenDeArresto.villanoConOrden.getNombre 
		}
		else{
		"Te encontraste con " + modelObject.casoActual.responsable.getNombre + " pero al no tener orden de arresto escapó :'v"
		}
	}
	
}