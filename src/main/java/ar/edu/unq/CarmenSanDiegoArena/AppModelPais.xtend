package ar.edu.unq.CarmenSanDiegoArena

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import tp1.Pais
import tp1.CarmenSanDiego

@Accessors
@Observable
class AppModelPais {
	
	String caracteristicaSeleccionada
	CarmenSanDiego model
	Pais pais
	
	new(Pais otroPais, CarmenSanDiego modelo) {
		pais = otroPais
		model = modelo
		
	}
	
	def eliminarCaracteristicaSeleccionada() {
		var newCarac = pais.caracteristicas
		newCarac.remove(caracteristicaSeleccionada) 
		
		ObservableUtils.firePropertyChanged(this, "pais.caracteristicas", newCarac)
	}
	
	def guardarCaracteristicaSeleccionada() {
		pais.caracteristicas.add(caracteristicaSeleccionada)
	}
	
	def actualizarPaises(){
		
		model.paisElegido = pais
		ObservableUtils.firePropertyChanged(model, "paisElegido")
	}
	
}