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
		title = "Resolviendo: Robo de " + modelObject.juego.getObjetoRobado
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
			value <=> "juego.ubicacionActual.nombre"
		]
		

		
		new Button(verticalH1) => [
			caption = "Orden de arresto"
			onClick[| abrirOrdenDeArresto]
		]
		new Label(verticalH1).text = "Orden de arresto emitida a : "
		new Label(verticalH1) => [value <=> "juego.ordenDeArresto.villanoConOrden.nombre"] 

		
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
			bindCaptionToProperty("juego.lugar1.nombre")

			onClick[| abrirLugar( modelObject.juego.lugar1)]
		]
		
		new Button(verticalH2) => [
			bindCaptionToProperty("juego.lugar2.nombre")
			onClick[| abrirLugar( modelObject.juego.lugar2)
			]
		]
		
		new Button(verticalH2) => [
			bindCaptionToProperty("juego.lugar3.nombre")
			
			onClick[| abrirLugar( modelObject.juego.lugar3)]
		]
		
		new Label(mainPanel).text = "Recorrido Criminal:"
		val listaRecorrido = new List(mainPanel)
		listaRecorrido.height = 100
		val paisesProperty = listaRecorrido.bindItems(new ObservableProperty(modelObject, "juego.recorridoCorrecto")) 
		paisesProperty.adapter = new PropertyAdapter(typeof(Pais), "nombre") 
		
		new Label(mainPanel).text = "Destinos Fallidos:"
		
		val listaRecorridoX = new List(mainPanel)
		listaRecorridoX.height = 100
		val paisesPropertyX = listaRecorridoX.bindItems(new ObservableProperty(modelObject, "juego.recorridoIncorrecto")) 
		paisesPropertyX.adapter = new PropertyAdapter(typeof(Pais), "nombre") 
		
		
	}
	
	
	def abrirLugar(Lugar lugar) {
		
		new LugarWindow(this,new AppModelLugar(lugar, modelObject.juego)).open()
		modelObject.juego.agregarRecorridoCorrectoIncorrecto(modelObject.ubicacionActual)
		

	}
	

	
	def abrirOrdenDeArresto() {
		new OrdenDeArrestoWindow(this, new AppModelVillanos(modelObject.juego)).open()
	}
	
	def abrirSeleccionDeDestino() {
		new ViajarWindow(this, modelObject).open()
	}
	
	def abrirExpediente() {
		new ExpedientesRestrictedWindow(this, new AppModelVillanos(modelObject.juego)).open()
	}
	
}