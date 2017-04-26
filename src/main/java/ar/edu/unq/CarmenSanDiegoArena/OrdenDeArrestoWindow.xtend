package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import appModel.AppModelVillanos
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.bindings.PropertyAdapter
import tp1.Villano

class OrdenDeArrestoWindow extends SimpleWindow<AppModelVillanos> {
	
	
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
			value <=> "partida.ordenDeArresto.villanoConOrden.nombre"
		]
		val villanosList = new Selector(mainPanel)
		villanosList.bindValueToProperty("villanoElegido")
		val villanosProperty = villanosList.bindItems(new ObservableProperty(modelObject, "villanos"))
		villanosProperty.adapter = new PropertyAdapter(typeof(Villano), "nombre")
		
		
		
	}
	
}