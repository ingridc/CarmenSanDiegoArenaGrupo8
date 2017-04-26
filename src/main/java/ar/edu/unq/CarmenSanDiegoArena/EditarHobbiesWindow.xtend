package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.List
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.Dialog
import appModel.AppModelVillano

class EditarHobbiesWindow extends Dialog<AppModelVillano>{
	
	new(WindowOwner owner, AppModelVillano model) {
		super(owner, model)
	}
	
	override protected addActions(Panel actionPanel){
		new Button(actionPanel) => [
			caption = "Aceptar"
			onClick[| this.accept]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new List(mainPanel) => [
			items <=> "villano.hobbies"
			width = 240
		]
		
		new TextBox(mainPanel) => [
			value <=> "hobbie"
		]
		
		new Button(mainPanel) => [
			caption = "Agregar"
			onClick[| agregarHobbie]
		]
	}
	
	def agregarHobbie() {
		modelObject.agregarHobbieActual()
	}
}