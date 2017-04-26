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
		title = "Relsoviendo caso: Robo de "+ model.partida.casoActual.objetoRobado
	}
	
	override protected addActions(Panel actionPanel) {
		new Button(actionPanel) => [
			caption = "Continuar"
			onClick [|salirOFinDelJuego]
		]

	}
	
	def salirOFinDelJuego() {
		this.close
		
		if(modelObject.lugar.ocupante == modelObject.partida.casoActual.responsable){
			finDelJuego()
		}
	
		
	}
	

	
	
	def finDelJuego(){
		if(modelObject.partida.ordenDeArresto != null)
			if(modelObject.partida.ordenDeArresto.villanoConOrden == modelObject.partida.casoActual.responsable){
				new FinDeJuegoBuenoWindow(this, modelObject.partida).open()
			}
			else{
				new FinDeJuegoMaloWindow(this, modelObject.partida).open()
			}
		else{
			new FinDeJuegoMaloWindow(this, modelObject.partida).open()
		}
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Estas visitando: " + modelObject.lugar.toString

		new Label(mainPanel).text = modelObject.lugar.obtenerPista(modelObject.partida.casoActual).toString()
	}
	

	
}