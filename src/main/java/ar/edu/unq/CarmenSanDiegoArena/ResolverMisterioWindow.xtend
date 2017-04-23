package ar.edu.unq.CarmenSanDiegoArena


import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.bindings.ObservableProperty
import tp1.Pais
import org.uqbar.arena.bindings.PropertyAdapter
import tp1.Lugar
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import appModel.AppModelPartida
import appModel.AppModelLugar
import appModel.AppModelVillanos

class ResolverMisterioWindow extends SimpleWindow<AppModelPartida> {
	
	new(WindowOwner parent, AppModelPartida model) {
		super(parent, model)
	}
	
	override protected addActions(Panel arg0) {
			}
	
	override protected createFormPanel(Panel mainPanel) {
		
		val horizontal1 = new Panel(mainPanel)
		horizontal1.layout = new HorizontalLayout
		
		val verticalH1 = new Panel(horizontal1)
		val verticalH2 = new Panel(horizontal1)
		
		new Label(verticalH1).text = "Usted esta en:" 
		new Label(verticalH1) => [
			value <=> "ubicacionActual.nombre"
		]
		

		
		new Button(verticalH1) => [
			caption = "Orden de arresto"
			onClick[| abrirOrdenDeArresto]
		]
		
		new Button(verticalH1) => [
			caption = "Viajar"
			onClick [| abrirSeleccionDeDestino]
		]
		new Button(verticalH1) => [
			caption = "Expediente"
			onClick [| abrirExpediente]
		]
		
		new Label(verticalH2).text = "Lugares"
		new Button(verticalH2) => [
			val lugar1 = modelObject.ubicacionActual.lugaresDeInteres.get(0)
			caption = lugar1.toString()
			onClick[| abrirLugar(lugar1)]
		]
		
		new Button(verticalH2) => [
			val lugar1 = modelObject.ubicacionActual.lugaresDeInteres.get(1)
			caption = lugar1.toString()
			onClick[| abrirLugar(lugar1)]
		]
		
		new Button(verticalH2) => [
			val lugar1 = modelObject.ubicacionActual.lugaresDeInteres.get(2)
			caption = lugar1.toString()
			onClick[| abrirLugar(lugar1)]
		]
		
		new Label(mainPanel).text = "Recorrido Criminal:"
		val listaRecorrido = new List(mainPanel)
		val paisesProperty = listaRecorrido.bindItems(new ObservableProperty(modelObject, "recorridoCorrecto")) 
		paisesProperty.adapter = new PropertyAdapter(typeof(Pais), "nombre") 
		new Label(mainPanel).text = "Destinos Fallidos:"
		
		val listaRecorridoX = new List(mainPanel)
		val paisesPropertyX = listaRecorridoX.bindItems(new ObservableProperty(modelObject, "recorridoIncorrecto")) 
		paisesPropertyX.adapter = new PropertyAdapter(typeof(Pais), "nombre") 
		
		
	}
	
	def abrirLugar(Lugar lugar) {
		new LugarWindow(this,new AppModelLugar(lugar, modelObject)).open()
	}
	
	def abrirOrdenDeArresto() {
		new OrdenDeArrestoWindow(this, new AppModelVillanos(modelObject.model.villanos)).open()
	}
	
	def abrirSeleccionDeDestino() {
		new ViajarWindow(this, modelObject).open()
	}
	
	def abrirExpediente() {
		new ExpedientesRestrictedWindow(this, modelObject.model).open()
	}
	
}