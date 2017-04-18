package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.Application
import java.util.ArrayList
import tp1.CarmenSanDiego
import tp1.Villano
import tp1.Caso
import tp1.Pais
import tp1.Lugar
import tp1.Biblioteca
import tp1.Banco
import tp1.Embajada

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
	val lugares = new ArrayList<Lugar>
	val pepe = new Villano("Pepe","masculino",new ArrayList<String>, new ArrayList<String>)
	val argentina = new Pais("Argentina",caracteristicas,new ArrayList<Lugar>, new ArrayList<Pais>)
	val egipto = new Pais("Egipto", caracteristicas, new ArrayList<Lugar>,new ArrayList<Pais>)
	val mexico = new Pais("Mexico", caracteristicas, new ArrayList<Lugar>,new ArrayList<Pais>)
	val noruega = new Pais("Noruega", caracteristicas, new ArrayList<Lugar>,new ArrayList<Pais>)
	val planDeE = new ArrayList<Pais>
	

	val caso = new Caso(carmenSanDiego, new ArrayList<Pais>, argentina,"A las 9 de la mañana en la ciudad del
 Cairo la comunidad científica fue
 conmovida al darse cuenta del
 faltante de gran valor! El sarcófago del
 faraón Usermaatra-Meriamón Ramsés
-Heqaiunu, mejor conocido como Ramsés
 III. El criminal fue muy prolijo y la 
escena del crimen no contaba con pista alguna
, su misión como detective es desifrar el
 responsable de tal crímen y apresarlo.", "tumba")
 
	override protected createMainWindow() {
		 val juego = new CarmenSanDiego => [
		 	lugares.add(banco)
		 	lugares.add(embajada)
		 	lugares.add(biblioteca)
		 	argentina.setLugares(lugares)
			planDeE.add(argentina)
			planDeE.add(mexico)
			caracteristicas.add("estoNofunca")
			caracteristicas.add("rompio todo")
			agregarNuevoPais(egipto)
			agregarNuevoPais(mexico)
			agregarNuevoPais(noruega)
			agregarVillano(carmenSanDiego)
			agregarVillano(pepe)

			caso.setPlanDeEscape(planDeE)
			setCasoActual(caso)
			setUbicacionActual(planDeE.get(0))
			agregarPaisCorrecto(planDeE.get(0))
					]
		new PantallaPrincipal(this,juego)
	}
	

	

	
	static def main(String[] args) {
		new CarmenSanDiegoApplication().start
	}
}