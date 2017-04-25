package ar.edu.unq.CarmenSanDiegoArena

import tp1.Pais
import org.uqbar.arena.windows.WindowOwner
import appModel.AppModelPais
import appModel.AppModelMapamundi

class NuevoPaisWindow extends EditarPaisWindow{
	
	new(WindowOwner owner,AppModelMapamundi mainModel) {
		super(owner, new AppModelPais(new Pais))
	}
	
	override defaultTitle(){
		"Mapamundi - Nuevo Pais"
	}
	
	override executeTask(){
		modelObject.nuevoPais
		super.executeTask()
	}
}