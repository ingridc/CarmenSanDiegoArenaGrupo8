package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.PropertyAdapter
import tp1.Villano
import org.uqbar.arena.bindings.ObservableProperty
import appModel.AppModelVillano
import appModel.AppModelVillanos


class ExpedientesWindow extends SimpleWindow<AppModelVillanos>{
	
	new(WindowOwner parent, AppModelVillanos model) {
		super(parent, model)
		title = "Expedientes"
	}
	
	override protected addActions(Panel arg0) {
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		mainPanel => [
			layout = new HorizontalLayout
			
		]
		
		val listaVillanos = new Panel(mainPanel)
		new Label(listaVillanos).text = "Villano"
		
		val villanosList = new List(listaVillanos)
		villanosList.height = 100
		villanosList.bindValueToProperty("villanoElegido")
		val villanosProperty = villanosList.bindItems(new ObservableProperty(modelObject, "villanos"))
		villanosProperty.adapter = new PropertyAdapter(typeof(Villano), "nombre")
		
		botonesDeEdicion(listaVillanos)
		
		val atributosVillano = new Panel(mainPanel)
		new Label(atributosVillano).text = "Nombre:" 
		new Label(atributosVillano) => [
			value <=> "villanoElegido.nombre"
		]
		new Label(atributosVillano).text = "Sexo:"
		new Label(atributosVillano) => [
			value <=> "villanoElegido.sexo"
		]
		new Label(atributosVillano).text = "Señas particulares:"
		new List(atributosVillano) => [
			height = 50
			width = 80
			items <=> "villanoElegido.senas_particulares"
		]
		new Label(atributosVillano).text = "Hobbies:"
		new List(atributosVillano) => [
			items <=> "villanoElegido.hobbies"
			height = 50
			width = 80
		]
	}
	
	def botonesDeEdicion(Panel panel) {
		new Button(panel) => [
			caption = "Nuevo"
			onClick [| nuevoVillano]
		]
		new Button(panel) => [
			caption = "Editar"
			onClick [| editarVillano]
		]
	}
	
	def editarVillano() {
		new EditarVillanoWindow(this, new AppModelVillano(modelObject.getVillanoElegido())).open()
	}
	
	def nuevoVillano() {
		(new NuevoVillanoWindow(this)).open()
		
	}
}