package ar.edu.unq.CarmenSanDiegoArena



import tp1.Pais
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.bindings.PropertyAdapter

class EditarConexiones extends TransactionalDialog<AppModelPais>{
	
	
	new(WindowOwner parent, AppModelPais model) {
		super(parent, model)
		title = "Editar conexiones"
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [ | this.accept]
		]
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel).text = "Conexiones"
		
		val conexionesLista = new List(mainPanel)
		conexionesLista.bindValueToProperty("conexionSeleccionada")
		val conexionesListProperty = conexionesLista.bindItems(new ObservableProperty(modelObject, "pais.conexiones")) 
		conexionesListProperty.adapter = new PropertyAdapter(typeof(Pais), "nombre")
		
		new Button(mainPanel) => [
			caption = "Eliminar"
			onClick [ | modelObject.eliminarConexionSeleccionada()]
		]
		
		val panelAgregar = new Panel(mainPanel)
		panelAgregar.layout = new HorizontalLayout
	
		
		val conexionesList = new Selector(panelAgregar)
		conexionesList.bindValueToProperty("conexionSeleccionada")
		val conexionesProperty = conexionesList.bindItems(new ObservableProperty(modelObject, "model.mapamundi")) 
		conexionesProperty.adapter = new PropertyAdapter(typeof(Pais), "nombre")
		
		new Button(panelAgregar) => [
			caption = "Agregar"
			onClick [ | modelObject.guardarConexionSeleccionada()]
		]
		
	}
	
}