package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import java.awt.Color
import org.uqbar.arena.widgets.Button
import appModel.AppModelPartida

class PantallaInicioJuego extends SimpleWindow<AppModelPartida> {
	
	new(WindowOwner parent, AppModelPartida model) {
		super(parent, model)
		title = "Caso a resolver"
	}
	
	override protected addActions(Panel actionPanel) {
		new Button(actionPanel) => [
			caption = "Aceptar Caso"
			onClick [ | resolverMisterio]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Detective tenemos un caso para usted! Ocurrio en:"
		new Label(mainPanel).text = "Se ha detectado el robo de " + modelObject.casoActual.objetoRobado + "
		en el pais de " + modelObject.casoActual.lugarDeRobo.getNombre() + " .Confiamos
	 	en usted para resolver este caso y atrapar al criminal!"
	}
	
	def resolverMisterio(){
		this.close()
		(new ResolverMisterioWindow(this, modelObject)).open()
	}
}