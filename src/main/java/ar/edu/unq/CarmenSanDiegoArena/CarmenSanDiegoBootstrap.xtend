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
import tp1.Lugar
import tp1.Club
import java.util.ArrayList

class CarmenSanDiegoBootstrap extends CollectionBasedBootstrap{
	
	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pais), new RepoPaises)
		ApplicationContext.instance.configureSingleton(typeof(Villano), new RepoVillanos)
		
	}
	
	override run() {
		val repoPaises = ApplicationContext.instance.getSingleton(typeof(Pais)) as RepoPaises
		val repoVillanos = ApplicationContext.instance.getSingleton(typeof(Villano)) as RepoVillanos
		
		
		var senas1 = new ArrayList<String>
		senas1.add("tiene el cabello pelirrojo")
		senas1.add( "tiene un piloto rojo")
		var hobbies1 = new ArrayList<String>
		hobbies1.add("mira series de moda")
		hobbies1.add("toma birritas en la vereda")
		repoVillanos.create("Carmen San Diego", "Femenino", senas1, 
			hobbies1
		)
		
		var senas2 = new ArrayList<String>
		senas2.add("es comandante")
		senas2.add("tiene el pelo castaño")
		var hobbies2 = new ArrayList<String>
		hobbies2.add("va a maeamee")
		hobbies2.add( "corta toda la looz")
		repoVillanos.create("Ricky Fort", "Macho alfa", senas2,
			hobbies2
		)
		
		var caracArg= new ArrayList<String>
		var caracBra= new ArrayList<String>
		var caracEU= new ArrayList<String>
		var caracMex= new ArrayList<String>
		var caracAl= new ArrayList<String>
		
		caracArg.add("es el lugar de nacimiento del tango")
		caracArg.add("es la nacionalidad del mejor futbolista del mundo")
		caracBra.add(" es el hogar del cristo redentor")
		caracBra.add("es pentacampeon del mundo")
		caracEU.add("es el hogar de la Estatua de la Libertad")
		caracEU.add("su idioma hablado es el Ingles")
		caracMex.add("su bebida preferida es el tequila")
		caracMex.add("tiene muchos mariachis")
		caracAl.add("fue protagonista en la segunda guerra mundial")
		caracAl.add("es el principal productor de cerveza")
		

		
		var lugares1 = new ArrayList<Lugar>
		var lugares2 = new ArrayList<Lugar>
		var lugares3 = new ArrayList<Lugar>
		var lugares4 = new ArrayList<Lugar>
		var lugares5 = new ArrayList<Lugar>
		
		lugares1.add(new Club)
		lugares1.add(new Embajada)
		lugares1.add(new Banco)
		lugares2.add(new Embajada)
		lugares2.add(new Banco)
		lugares2.add(new Biblioteca)
		lugares3.add(new Club)
		lugares3.add(new Banco)
		lugares3.add(new Banco)
		lugares4.add(new Club)
		lugares4.add(new Embajada)
		lugares4.add(new Biblioteca)
		lugares5.add(new Club)
		lugares5.add(new Banco)
		lugares5.add(new Embajada)
		

		val argentina= repoPaises.create("Argentina",caracArg,lugares1)
		val brasil = repoPaises.create("Brasil", caracBra,lugares2)
		val eeuu = repoPaises.create("EEUU",caracEU,lugares3)
		val mexico = repoPaises.create("Mexico", caracMex, lugares4)
		val alemania = repoPaises.create("Alemania", caracAl,lugares5)
		
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