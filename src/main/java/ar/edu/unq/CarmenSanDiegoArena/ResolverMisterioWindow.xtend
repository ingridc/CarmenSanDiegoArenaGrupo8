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
			caption = modelObject.ubicacionActual.lugaresDeInteres.get(0).toString()
			onClick[| abrirLugar( modelObject.ubicacionActual.lugaresDeInteres.get(0))]
		]
		
		new Button(verticalH2) => [
			caption = modelObject.ubicacionActual.lugaresDeInteres.get(1).toString()
			onClick[| abrirLugar( modelObject.ubicacionActual.lugaresDeInteres.get(1))
			]
		]
		
		new Button(verticalH2) => [
			
			caption = modelObject.ubicacionActual.lugaresDeInteres.get(2).toString()
			onClick[| abrirLugar( modelObject.ubicacionActual.lugaresDeInteres.get(2))]
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
		
		levantaVentanaLugar(lugar)
		
		
		if( !( (modelObject.recorridoCorrecto.contains(modelObject.ubicacionActual) || 
			(modelObject.recorridoIncorrecto.contains(modelObject.ubicacionActual))
		))){
			
			if(modelObject.casoActual.planDeEscape.contains(modelObject.ubicacionActual)){
				modelObject.recorridoCorrecto.add(modelObject.ubicacionActual)	
			}
			else{
				modelObject.recorridoIncorrecto.add(modelObject.ubicacionActual)
			
			}
		}
	}
	
	def levantaVentanaLugar(Lugar lugar){
		
		if(modelObject.ubicacionActual == modelObject.casoActual.planDeEscape.last()){
			
			levantarVentanaFinJuego()
		}
		else{
			new LugarWindow(this,new AppModelLugar(lugar, modelObject)).open()	
		}
		
	}
	
	def levantarVentanaFinJuego() {
		
		if(modelObject.ordenDeArresto.villanoConOrden == modelObject.casoActual.responsable){
			new FinDeJuegoBuenoWindow(this, modelObject).open()
		}
		else{
			new FinDeJuegoMaloWindow(this, modelObject).open()
		}
	}
	
	def abrirOrdenDeArresto() {
		new OrdenDeArrestoWindow(this, new AppModelVillanos(modelObject)).open()
	}
	
	def abrirSeleccionDeDestino() {
		new ViajarWindow(this, modelObject).open()
	}
	
	def abrirExpediente() {
		new ExpedientesRestrictedWindow(this, new AppModelVillanos).open()
	}
	
}