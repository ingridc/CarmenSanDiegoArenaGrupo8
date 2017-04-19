package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.Application
import java.util.ArrayList
import tp1.CarmenSanDiego
import tp1.Villano
import tp1.Caso

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
	 
	
	var caracteristicas = new ArrayList<String>
	val carmenSanDiego = new Villano("Carmen San Diego","femenino",new ArrayList<String>, new ArrayList<String>)
	val banco = new Banco(carmenSanDiego)
	val embajada = new Embajada(carmenSanDiego)
	val biblioteca = new Biblioteca(carmenSanDiego)
	val listLugares = new ArrayList<Lugar>
	val pepe = new Villano("Pepe","masculino",new ArrayList<String>, new ArrayList<String>)
	val argentina = new Pais("Argentina",caracteristicas,new ArrayList<Lugar>, new ArrayList<Pais>)
	val egipto = new Pais("Egipto", caracteristicas, new ArrayList<Lugar>,new ArrayList<Pais>)
	val mexico = new Pais("Mexico", caracteristicas, new ArrayList<Lugar>,new ArrayList<Pais>)
	val noruega = new Pais("Noruega", caracteristicas, new ArrayList<Lugar>,new ArrayList<Pais>)

	
 
	override protected createMainWindow() {
		 val juego = new CarmenSanDiego => [
		 	listLugares.add(banco)
		 	listLugares.add(embajada)
		 	listLugares.add(biblioteca)
		 	setLugares(listLugares)
		 	argentina.setLugares(listLugares)
		 	egipto.setLugares(listLugares)
			caracteristicas.add("estoNofunca")
			caracteristicas.add("rompio todo")
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