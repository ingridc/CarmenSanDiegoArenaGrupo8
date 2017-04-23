package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import appModel.AppModelVillanos

class OrdenDeArrestoWindow extends SimpleWindow<AppModelVillanos> {
	
	// CAMBIAR A APPMODELVILLANOS
	
	new(WindowOwner parent, AppModelVillanos model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionPanel) {
		new Button(actionPanel) => [
			caption = "Generar Orden de Arresto"
			onClick[| nuevaOrden]
		]
	}
	
	def nuevaOrden() {
		
		modelObject.nuevaOrdenDeArresto()
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Orden de arresto emitida a:"
		new Label(mainPanel) => [
			value <=> "ordenDeArresto.villanoConOrden.nombre"
		]
		new Selector(mainPanel) => [
			items <=> "villanos"
			value <=> "villanoElegido"
		]
		
		
		
	}
	
}