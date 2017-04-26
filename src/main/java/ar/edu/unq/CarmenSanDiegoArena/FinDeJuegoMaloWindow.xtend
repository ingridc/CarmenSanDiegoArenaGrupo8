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
		"Reporta2 perro

		 Atrapaste a "+ modelObject.casoActual.responsable.getNombre + " pero tenias una orden contra "+modelObject.ordenDeArresto.villanoConOrden.getNombre 
	}
	
}