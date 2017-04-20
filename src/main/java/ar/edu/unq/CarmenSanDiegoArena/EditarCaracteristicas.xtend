package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.Dialog
import appModel.AppModelPais

class EditarCaracteristicas extends Dialog<AppModelPais>{
	
	new(WindowOwner parent, AppModelPais model) {
		super(parent, model)
		title = "Editar Caracteristicas"
	}

	override protected addActions(Panel actionsPanel) {		
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [ | this.accept]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Caracteristicas"
		new List(mainPanel) => [
			items <=> "pais.caracteristicas"
			value <=> "caracteristicaSeleccionada"
		]
		
		new Button(mainPanel) => [
			caption = "Eliminar"
			onClick [ | modelObject.eliminarCaracteristicaSeleccionada()]
		]
		
		val panelAgregar = new Panel(mainPanel)
		panelAgregar.layout = new HorizontalLayout
		
		new TextBox(panelAgregar) => [
			value <=> "caracteristicaSeleccionada" 
		]
		
		new Button(panelAgregar) => [
			caption = "Agregar"
			onClick [ | modelObject.guardarCaracteristicaSeleccionada()]
		]
	}
}