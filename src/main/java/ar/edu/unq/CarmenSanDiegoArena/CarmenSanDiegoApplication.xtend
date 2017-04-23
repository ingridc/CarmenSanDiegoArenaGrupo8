package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.Application
import java.util.ArrayList
import tp1.CarmenSanDiego
import tp1.Villano

import tp1.Lugar
import tp1.Biblioteca
import tp1.Banco
import tp1.Embajada
import tp1.Pais

class CarmenSanDiegoApplication extends Application {
	
	/*
	 *  ESTO ES SOLO PARA ARRANCAR, EL APPLICATION MODEL ES CARMENSANDIEGO
	 * 
	 */
	 
	
	var caracteristicas = #["feo","hay musulmanes"]
	val carmenSanDiego = new Villano("Carmen San Diego","femenino",new ArrayList<String>, new ArrayList<String>)

	val listLugares = new ArrayList<Lugar>
	val listLugares2 = new ArrayList<Lugar>
	val listLugares3 = new ArrayList<Lugar>
	
	val pepe = new Villano("Pepe","masculino",new ArrayList<String>, new ArrayList<String>)
	val argentina = new Pais("Argentina",caracteristicas,new ArrayList<Lugar>, new ArrayList<Pais>)
	val egipto = new Pais("Egipto", caracteristicas, new ArrayList<Lugar>,new ArrayList<Pais>)
	val mexico = new Pais("Mexico", caracteristicas, new ArrayList<Lugar>,new ArrayList<Pais>)
	val noruega = new Pais("Noruega", caracteristicas, new ArrayList<Lugar>,new ArrayList<Pais>)
	val conexiones1 = #[mexico,noruega]
	val conexiones2 = #[egipto,argentina]

 
	override protected createMainWindow() {
		 val juego = new CarmenSanDiego => [
		 	argentina.conexiones = conexiones1
		 	mexico.conexiones = conexiones2
		 	noruega.conexiones = conexiones2
		 	egipto.conexiones = conexiones1
		 	listLugares.add(new Banco)
		 	listLugares.add(new Embajada)
		 	listLugares.add(new Biblioteca())
		 	listLugares2.add(new Banco)
		 	listLugares2.add(new Embajada)
		 	listLugares2.add(new Biblioteca())
		 	listLugares3.add(new Banco)
		 	listLugares3.add(new Embajada)
		 	listLugares3.add(new Biblioteca())
		 	setLugares(listLugares)
		 	argentina.setLugares(listLugares)
		 	egipto.setLugares(listLugares)
			noruega.setLugares(listLugares)
			mexico.setLugares(listLugares)
			agregarNuevoPais(argentina)
			agregarNuevoPais(egipto)
			agregarNuevoPais(mexico)
			agregarNuevoPais(noruega)
			agregarVillano(carmenSanDiego)
			agregarVillano(pepe)

					]
		new PantallaPrincipal(this,juego)
	}
	

	

	
	static def main(String[] args) {
		new CarmenSanDiegoApplication().start
	}
}