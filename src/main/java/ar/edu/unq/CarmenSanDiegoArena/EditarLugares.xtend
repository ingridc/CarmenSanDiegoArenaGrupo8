package ar.edu.unq.CarmenSanDiegoArena



import tp1.Pais
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.aop.windows.TransactionalDialog

class EditarLugares extends TransactionalDialog<AppModelPais>{
	
	new(WindowOwner parent, AppModelPais model) {
		super(parent, model)
		title = "Editar lugares"
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [ | this.accept]
		]
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Lugares de interes"
		new List(mainPanel) => [
			items <=> "pais.lugaresDeInteres"
			value <=> "lugarSeleccionado"
		]
		
		new Button(mainPanel) => [
			caption = "Eliminar"
			onClick [ | modelObject.eliminarLugarSeleccionado()]
		]
		
		val panelAgregar = new Panel(mainPanel)
		panelAgregar.layout = new HorizontalLayout
		
		new Selector<Pais>(panelAgregar) => [
			allowNull(false)
			value <=> "lugarSeleccionado" 
			items <=> "model.lugares"
		]
		
		new Button(panelAgregar) => [
			caption = "Agregar"
			onClick [ | modelObject.guardarLugarSeleccionado()]
		]
	}
	
	
}