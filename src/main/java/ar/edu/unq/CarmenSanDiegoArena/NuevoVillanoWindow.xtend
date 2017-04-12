package ar.edu.unq.CarmenSanDiegoArena
import org.uqbar.arena.windows.WindowOwner
import tp1.Villano

class NuevoVillanoWindow extends EditarVillanoWindow{
	
	new(WindowOwner parent) {
		super(parent, new Villano())
	}
	
}