package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label

class LugarWindow extends SimpleWindow<AppModelLugar>{
	
	new(WindowOwner parent, AppModelLugar model) {
		super(parent, model)
	}
	
	override protected addActions(Panel arg0) {

	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = modelObject.lugar.obtenerPista(modelObject.partida.casoActual).toString()
	}
	
}