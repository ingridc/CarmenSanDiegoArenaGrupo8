package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.WindowOwner
import appModel.AppModelPartida

class FinDeJuegoMaloWindow extends FinDeJuegoBuenoWindow{
	
	new(WindowOwner parent, AppModelPartida model) {
		super(parent, model)
	}
	
	override textoBoton(){
		"Sos boleta"
	}
	
	override textoInfo(){
		"Reporta2 perro

		 Atrapaste a"+modelObject.ordenDeArresto.villanoConOrden+"y recuperaste"+modelObject.casoActual.objetoRobado+"ahora te podes ir de joda tranqui"
	}
	
}