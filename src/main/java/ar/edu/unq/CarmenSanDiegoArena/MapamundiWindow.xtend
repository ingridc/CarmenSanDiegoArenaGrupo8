package ar.edu.unq.CarmenSanDiegoArena


import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.List
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.bindings.PropertyAdapter
import tp1.Pais
import appModel.AppModelPais
import appModel.AppModelMapamundi

class MapamundiWindow extends SimpleWindow<AppModelMapamundi>{
	
	new(WindowOwner parent, AppModelMapamundi model) {
		super(parent, model)
		title = "Mapamundi"
	}
	
	override protected addActions(Panel arg0) {
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		mainPanel => [
			layout = new HorizontalLayout
			
			]
		val panelIzq = new Panel(mainPanel)
		val panelDer = new Panel(mainPanel)
		panelIzq.layout = new VerticalLayout
		
		crearLista(panelIzq)
		crearAtributos(panelDer)
	}
	
	def crearAtributos(Panel panelDer){
		new Label(panelDer).text = "Nombre:"
		new Label(panelDer) => [
			value <=> "paisSeleccionado.nombre"
		]
		new Label(panelDer).text = "Caracteristicas"
		new List(panelDer) => [
			items <=> "paisSeleccionado.caracteristicas"
		]
		
		new Label(panelDer).text = "Conexiones"
		val paisesList = new List(panelDer)
		val paisesProperty = paisesList.bindItems(new ObservableProperty(modelObject, "paisSeleccionado.conexiones")) 
		paisesProperty.adapter = new PropertyAdapter(typeof(Pais), "nombre")
		
		new Label(panelDer).text = "Lugares de interes"
		new List(panelDer) => [
			items <=> "paisSeleccionado.lugaresDeInteres"
		]
	}
	
	def crearLista(Panel panelIzq){
		
		new Label(panelIzq).text = "Paises"
		
		val paisesList = new List(panelIzq)
		paisesList.bindValueToProperty("paisSeleccionado")
		val paisesProperty = paisesList.bindItems(new ObservableProperty(modelObject, "paises")) 
		paisesProperty.adapter = new PropertyAdapter(typeof(Pais), "nombre")
		
		
		new Button(panelIzq) => [
			
			caption = "Eliminar"
			onClick [ | modelObject.eliminarPaisSeleccionado()]

		]
		
		new Button(panelIzq)=> [
			caption = "Nuevo"
			onClick [ | nuevoPais]
		]
		
		new Button(panelIzq)=> [
			caption = "Editar"
			onClick [ | editarPais]
		]
		
	}
	
	def editarPais() {
		new EditarPaisWindow( this ,new AppModelPais(modelObject.paisSeleccionado,modelObject)).open()
	}
	
	def nuevoPais(){
		new NuevoPaisWindow(this,modelObject).open()
	}
	
	
}