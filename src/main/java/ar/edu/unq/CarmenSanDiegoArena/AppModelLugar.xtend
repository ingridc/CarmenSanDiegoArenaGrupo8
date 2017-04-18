package ar.edu.unq.CarmenSanDiegoArena

import tp1.Lugar
import tp1.CarmenSanDiego
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors

class AppModelLugar {
	Lugar lugar
	CarmenSanDiego model
	
	new(Lugar lugarActual, CarmenSanDiego carmenSanDiego){
		lugar = lugarActual
		model = carmenSanDiego
	}
	
	
	
}