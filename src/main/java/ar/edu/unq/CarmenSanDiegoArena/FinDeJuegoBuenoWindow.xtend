package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.SimpleWindow
import appModel.AppModelPartida
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label

class FinDeJuegoBuenoWindow extends SimpleWindow<AppModelPartida>{
	
	
	
	new(WindowOwner parent, AppModelPartida model) {
		super(parent, model)
		title = "Felicidades!"
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = textoBoton()
			onClick [ | this.close]
		]
	}
	
	def textoBoton() {
		
		"Disfruta de la sidra la victoria"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel).text = textoInfo()
		
	
	}
	
	def textoInfo() {
		"En hora buena perro!!

		 Atrapaste a "+ modelObject.casoActual.responsable.getNombre() +" y recuperaste "+modelObject.casoActual.objetoRobado+" 
		ahora te podes ir de joda tranqui"
	}
	
}
	