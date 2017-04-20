package ar.edu.unq.CarmenSanDiegoArena

import tp1.Pais
import org.uqbar.arena.windows.WindowOwner
import tp1.CarmenSanDiego
import appModel.AppModelPais

class NuevoPaisWindow extends EditarPaisWindow{
	
	new(WindowOwner owner,CarmenSanDiego mainModel) {
		super(owner, new AppModelPais(new Pais,mainModel))
	}
	
	override defaultTitle(){
		"Mapamundi - Nuevo Pais"
	}
	
	override executeTask(){
		modelObject.nuevoPais
		super.executeTask()
	}
}