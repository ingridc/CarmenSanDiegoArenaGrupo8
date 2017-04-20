package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.WindowOwner
import tp1.Villano
import tp1.CarmenSanDiego
import appModel.AppModelVillano

class NuevoVillanoWindow extends EditarVillanoWindow{
	
	new(WindowOwner parent, CarmenSanDiego model) {
		super(parent, new AppModelVillano(new Villano(),model))
	}
	
	override executeTask(){
		modelObject.nuevoVillano
		//modelObject.model.actualizarVillano
		super.executeTask()
	}
}