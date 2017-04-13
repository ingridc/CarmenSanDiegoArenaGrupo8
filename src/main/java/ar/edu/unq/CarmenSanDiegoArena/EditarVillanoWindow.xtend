package ar.edu.unq.CarmenSanDiegoArena


import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.aop.windows.TransactionalDialog

class EditarVillanoWindow extends TransactionalDialog<AppModelVillano>{
	
	new(WindowOwner parent, AppModelVillano model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [| this.accept()]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Nombre:"
		new TextBox(mainPanel) => [
			value <=> "villano.nombre"
			width = 100
		]

		new Label(mainPanel).text = "Sexo:"
		new TextBox(mainPanel) => [
			value <=> "villano.sexo"
			width = 100
		]
		
		new Label(mainPanel).text = "Señas Particulares"
		new Button(mainPanel) => [
			caption = "Editar Señas Particulares"
			onClick [| abrirEditarSenas]
		]
		new List(mainPanel) => [
			items <=> "villano.senas_particulares"
		]
		
		
		new Label(mainPanel).text = "Hobbies"
		new Button(mainPanel) => [
			caption = "Editar Hobbies"
			onClick [| abrirEditarHobbies]
		]
		new List(mainPanel) => [
			items <=> "villano.hobbies"
		]
	}
	
	def abrirEditarHobbies() {
		new EditarHobbiesWindow(this, modelObject).open()
	}
	
	def abrirEditarSenas() {
		new EditarSenasWindow(this, modelObject).open()
	}
	
	override executeTask(){
		
		
		modelObject.actualizarVillanos()

		super.executeTask()
	}
	
	
	
}