package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.WindowOwner
import tp1.Villano
import appModel.AppModelVillano
import appModel.AppModelVillanos

class NuevoVillanoWindow extends EditarVillanoWindow{
	
	new(WindowOwner parent, AppModelVillanos model) {
		super(parent, new AppModelVillano(new Villano(),model))
		title = "Expedientes-Nuevo Villano"
	}
	
	override executeTask(){
		modelObject.nuevoVillano
		
		super.executeTask()
	}
}