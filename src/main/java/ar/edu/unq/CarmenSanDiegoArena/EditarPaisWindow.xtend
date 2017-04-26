package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.List
import org.uqbar.arena.bindings.ObservableProperty
import tp1.Pais
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.windows.Dialog
import appModel.AppModelPais

class EditarPaisWindow extends Dialog<AppModelPais>{
	
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
			onClick[ | this.modelObject.nuevoPais //tiene que agregar utilizando el método del modelo
						close
			]
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
		
		val conexionesList = new List(mainPanel)
		val conexionesProperty = conexionesList.bindItems(new ObservableProperty(modelObject, "pais.conexiones")) 
		conexionesProperty.adapter = new PropertyAdapter(typeof(Pais), "nombre")
		
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
		new EditarLugares(this, modelObject).open()
	}
	
	def editarConexiones() {
		new EditarConexiones(this, modelObject).open()
	}
	
	def editarCaracteristicas() {
		new EditarCaracteristicas(this, modelObject).open()
	}
	
	override executeTask(){
		modelObject.actualizarPaises()
		super.executeTask()
	}
}