package ar.edu.unq.CarmenSanDiegoArena


import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.List
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button

class EditarSenasWindow extends TransactionalDialog<AppModelVillano>{
	
	new(WindowOwner owner, AppModelVillano model) {
		super(owner, model)
	}
	
	override protected addActions(Panel actionPanel){
		new Button(actionPanel) => [
			caption = "Aceptar"
			onClick[| this.accept()]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new List(mainPanel) => [
			items <=> "villano.senas_particulares"
		]
		
		new TextBox(mainPanel) => [
			value <=> "sena"
		]
		
		new Button(mainPanel) => [
			caption = "Agregar"
			onClick[| agregarSena]
		]
	}
	
	def agregarSena() {
	
		modelObject.agregarSenaActual()
	}
	

	
	
	
}