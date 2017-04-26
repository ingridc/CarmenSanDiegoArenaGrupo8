package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import appModel.AppModelVillanos

class ExpedientesRestrictedWindow extends ExpedientesWindow {
	
	new(WindowOwner parent, AppModelVillanos model) {
		super(parent, model)
		title = "Resolviendo caso: Robo " + model.juego.getObjetoRobado + " - Expediente"
	}
	
	override botonesDeEdicion(Panel panel){
		
	}
	
}