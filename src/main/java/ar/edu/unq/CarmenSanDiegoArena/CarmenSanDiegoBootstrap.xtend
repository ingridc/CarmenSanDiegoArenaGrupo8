package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.utils.ApplicationContext
import tp1.Pais
import tp1.Lugar
import tp1.Villano
import tp1.Biblioteca
import tp1.Embajada
import tp1.Banco

class CarmenSanDiegoBootstrap extends CollectionBasedBootstrap{
	
	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pais), new RepoPaises)
		ApplicationContext.instance.configureSingleton(typeof(Lugar), new RepoLugares)
		ApplicationContext.instance.configureSingleton(typeof(Villano), new RepoVillanos)
		
	}
	
	override run() {
		val repoPaises = ApplicationContext.instance.getSingleton(typeof(Pais)) as RepoPaises
		val repoVillanos = ApplicationContext.instance.getSingleton(typeof(Villano)) as RepoVillanos

		repoVillanos.create("Carmen San Diego", "Femenino", #["Cabello pelirrojo", "Piloto rojo"], 
			#["Mira series de moda", "Toma birritas en la vereda"]
		)
		repoVillanos.create("Ricky Fort", "Macho alfa", #["Es comandante", "Pelo castaño"],
			#["Va a maeamee", "Corta toda la looz"]
		)
		
		

		repoPaises => [
			create("Argentina", #["Lugar de nacimiento del tango","Nacionalidad del mejor futbolista del mundo" ], #[new Banco(), new Embajada(), new Biblioteca()], #["Brasil", "Mexico"])
			create("Brasil", #[" Hogar del cristo redentor", "Pentacampeon del mundo"], #[new Banco(), new Embajada(), new Biblioteca()], #["EEUU", "Mexico"])
			create("EEUU", #["Hogar de la Estatua de la Libertad", "Idioma hablado : Ingles"], #[new Banco(), new Embajada(), new Biblioteca()], #["Argentina", "Alemania"])
			create("Mexico", #["Su bebida preferida es el tequila", "Mariachis"], #[new Banco(), new Embajada(), new Biblioteca()], #["EEUU", "Brasil"])
			create("Alemania", #["Muro de Berlin", "Principal productor de cerveza"], #[new Banco(), new Embajada(), new Biblioteca()], #["Mexico", "Argentina"])
		]
		
	}
}