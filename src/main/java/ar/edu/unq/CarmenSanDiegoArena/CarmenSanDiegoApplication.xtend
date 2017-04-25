package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.Application

import org.uqbar.arena.windows.Window

class CarmenSanDiegoApplication extends Application {
	
	/*
	 *  ESTO ES SOLO PARA ARRANCAR, EL APPLICATION MODEL ES CARMENSANDIEGO
	 * 
	 */
	 
	
	new(CarmenSanDiegoBootstrap bootstrap){
		super(bootstrap)
	}

 
	static def void main(String[] args) {
		new CarmenSanDiegoApplication(new CarmenSanDiegoBootstrap).start()
	}

	override protected Window<?> createMainWindow() {
		return new PantallaPrincipal(this)
	}
}