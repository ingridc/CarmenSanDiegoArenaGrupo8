package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import tp1.CarmenSanDiego
import tp1.Pais

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import tp1.AppModelPartida

class ViajarWindow extends Dialog<AppModelPartida>{
	
	new(WindowOwner parent, AppModelPartida model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionPanel) {
		
		new Button(actionPanel) => [
			caption = "Viajar"
			onClick [| this.accept()]
			
		]
	}
	
	override executeTask(){
		modelObject.actualizarUbicacion
		super.executeTask()
	}
	

	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Estas en:"
		new Label(mainPanel) => [
			value <=> "ubicacionActual.nombre"
		]
		val paisesList = new List(mainPanel)
		paisesList.bindValueToProperty("destinoElegido")
		val paisesProperty = paisesList.bindItems(new ObservableProperty(modelObject, "ubicacionActual.conexiones")) 
		paisesProperty.adapter = new PropertyAdapter(typeof(Pais), "nombre")
	}
	
}