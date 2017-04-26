package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.widgets.Panel
import tp1.CarmenSanDiego
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Button
import appModel.AppModelMapamundi
import appModel.AppModelVillanos
import appModel.AppModelPartida

class PantallaPrincipal extends SimpleWindow<CarmenSanDiego> {
	
	
	new(WindowOwner parent) {
		super(parent, new CarmenSanDiego)
		title = "Donde esta Carmen San Diego?"
	}
	
	override createFormPanel(Panel arg0) {
	
		new Label(arg0).text = "Bienvenido a Carmen San Diego"

	}
	
	override protected addActions(Panel mainPanel) {
	  new Button(mainPanel) => [
      caption = "Resolver Misterio"
      onClick[ | this.inicioDeJuego  ]
	  ]
	  
	  new Button(mainPanel) => [
	  	caption = "Mapamundi"
	  	onClick[ | this.iniciarMapamundi ] 
	  ]
	  
	  new Button(mainPanel) => [
	  	caption = "Expedientes"
	  	onClick[ | this.iniciarExpedientes ]
	  ]
	  
	}
	
	def inicioDeJuego() {
		modelObject.generarPartida()
		(new PantallaInicioJuego(this, new AppModelPartida(modelObject))).open()
	}
	
	def iniciarMapamundi(){
		(new MapamundiWindow(this, new AppModelMapamundi).open )
	}

	def iniciarExpedientes(){
		new ExpedientesWindow(this, new AppModelVillanos).open 
	}
	
}