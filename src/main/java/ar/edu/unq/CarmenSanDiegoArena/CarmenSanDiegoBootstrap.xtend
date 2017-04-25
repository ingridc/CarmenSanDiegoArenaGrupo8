package ar.edu.unq.CarmenSanDiegoArena

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.utils.ApplicationContext
import tp1.Pais
import tp1.Villano
import tp1.Biblioteca
import tp1.Embajada
import tp1.Banco
import tp1.RepoPaises
import tp1.RepoVillanos

class CarmenSanDiegoBootstrap extends CollectionBasedBootstrap{
	
	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pais), new RepoPaises)
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
		
		//val lugares = 
		

		val argentina= repoPaises.create("Argentina", #["Lugar de nacimiento del tango","Nacionalidad del mejor futbolista del mundo" ], #[new Banco(), new Embajada(), new Biblioteca()])
		val brasil = repoPaises.create("Brasil", #[" Hogar del cristo redentor", "Pentacampeon del mundo"], #[new Banco(), new Embajada(), new Biblioteca()])
		val eeuu = repoPaises.create("EEUU", #["Hogar de la Estatua de la Libertad", "Idioma hablado : Ingles"], #[new Banco(), new Embajada(), new Biblioteca()])
		val mexico = repoPaises.create("Mexico", #["Su bebida preferida es el tequila", "Mariachis"], #[new Banco(), new Embajada(), new Biblioteca()])
		val alemania = repoPaises.create("Alemania", #["Muro de Berlin", "Principal productor de cerveza"], #[new Banco(), new Embajada(), new Biblioteca()])
		argentina.conexiones.add(brasil)
		argentina.conexiones.add(eeuu)
		brasil.conexiones.add(mexico)
		brasil.conexiones.add(alemania)
		eeuu.conexiones.add(alemania)
		eeuu.conexiones.add(brasil)
		mexico.conexiones.add(argentina)
		mexico.conexiones.add(eeuu)
		alemania.conexiones.add(argentina)
		alemania.conexiones.add(mexico)
		
		repoPaises => [
			update(argentina)
			update(brasil)
			update(eeuu)
			update(mexico)
			update(alemania)
		]
		
	}
}