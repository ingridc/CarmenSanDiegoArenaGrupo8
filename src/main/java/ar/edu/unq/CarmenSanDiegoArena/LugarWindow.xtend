package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import appModel.AppModelLugar
import org.uqbar.arena.widgets.Button

class LugarWindow extends SimpleWindow<AppModelLugar>{
	
	new(WindowOwner parent, AppModelLugar model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionPanel) {
		new Button(actionPanel) => [
			caption = "Continuar"
			onClick [|this.close]
		]

	}
	
	override protected createFormPanel(Panel mainPanel) {

		new Label(mainPanel).text = modelObject.lugar.obtenerPista(modelObject.partida.casoActual).toString()
	}
	

	
}