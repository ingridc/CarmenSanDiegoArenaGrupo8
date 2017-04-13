package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.List

import org.uqbar.arena.aop.windows.TransactionalDialog

class EditarPaisWindow extends TransactionalDialog<AppModelPais>{
	
	new(WindowOwner parent, AppModelPais model) {
		super(parent, model)
		title = defaultTitle
	}
	
	def defaultTitle(){
		"Mapamundi - Editar Pais"
	}
	
	override protected addActions(Panel actionPanel) {
		new Button(actionPanel) => [
			caption = "Aceptar"
			onClick[ | this.accept()]
		]

	}

	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Nombre"
		new TextBox(mainPanel) => [
			value <=> "pais.nombre"
			width = 250
		]
		
		val primeraFila = new Panel(mainPanel) => [
		layout = new HorizontalLayout
		]
		
		new Label(primeraFila).text = "Caracteristicas"
		new Button(primeraFila) => [
			caption = "Editar Caracteristicas"
			onClick [| editarCaracteristicas]
		]
		
		new List(mainPanel) => [
			items <=> "pais.caracteristicas"
		]
		
		val segundaFila = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		
		new Label(segundaFila).text = "Conexiones"
		new Button(segundaFila) => [
			caption = "Editar Conexiones"
			onClick [| editarConexiones]
		]
		
		new List(mainPanel) => [
			items <=> "pais.conexiones"
		]
		
		val terceraFila = new Panel(mainPanel) => [
		layout = new HorizontalLayout
		]
		
		new Label(terceraFila).text = "Lugares de interes"
		new Button(terceraFila) => [
			caption = "Editar Lugares"
			onClick [| editarLugares]
		]
		
		new List(mainPanel) => [
			items <=> "pais.lugaresDeInteres"
		]
	}
	
	def editarLugares() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def editarConexiones() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def editarCaracteristicas() {
		new EditarCaracteristicas(this, modelObject).open()
	}
	
	override executeTask(){
		
		
		modelObject.actualizarPaises()

		super.executeTask()
	}
	
	
}