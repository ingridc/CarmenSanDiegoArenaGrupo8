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
		pais.caracteristicas.remove(caracteristicaSeleccionada) 
		
		ObservableUtils.firePropertyChanged(this, "pais.caracteristicas")
	}
	
	def guardarCaracteristicaSeleccionada() {
		pais.caracteristicas.add(caracteristicaSeleccionada)
		ObservableUtils.firePropertyChanged(this, "pais.caracteristicas")
	}
	
	def actualizarPaises(){
		
		model.paisElegido = pais
		
		ObservableUtils.firePropertyChanged(model, "paisElegido")
	}
	
	def nuevoPais() {
		model.mapamundi.add(pais)
		ObservableUtils.firePropertyChanged(model, "mapamundi")
	}
	
}