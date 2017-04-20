package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.SimpleWindow
import tp1.CarmenSanDiego
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button

class OrdenDeArrestoWindow extends SimpleWindow<CarmenSanDiego> {
	
	// CAMBIAR A APPMODELVILLANOS
	
	new(WindowOwner parent, CarmenSanDiego model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionPanel) {
		/*new Button(actionPanel) => [
			caption = "Generar Orden de Arresto"
			onClick[| nuevaOrden]
		]*/
	}
	
	def nuevaOrden() {
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Orden de arresto emitida a:"
		/*new Label(mainPanel) => [
			value <=> "partida.ordenDeArresto"
		]*/
		new Selector(mainPanel) => [
			items <=> "villanos"
			value <=> "villanoElegido"
		]
		
		
		
	}
	
}