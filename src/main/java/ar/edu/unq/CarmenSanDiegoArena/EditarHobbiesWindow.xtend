package ar.edu.unq.CarmenSanDiegoArena


import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.List
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*


class EditarHobbiesWindow extends TransactionalDialog<AppModelVillano>{
	
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