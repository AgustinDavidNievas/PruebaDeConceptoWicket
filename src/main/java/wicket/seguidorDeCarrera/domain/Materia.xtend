package wicket.seguidorDeCarrera.domain

import java.util.List
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
class Materia extends Entity implements Cloneable {

	@Property Boolean finalAprobado

	@Property String nombre
	public val static nombre_Property = "nombre"

	@Property int anioDeCursada
	@Property List<Nota> notas
	@Property String ubicacionDeLaMateria
	@Property String profesor
	@Property SeguidorDeCarrera seguidorDeCarrera

	new(String nombre) {
		this.nombre = nombre
		this.notas = newArrayList
	}

	new() {
		super()
		this.notas = newArrayList
		
	}

	def crearMateria(String nombre) {
		new Materia(nombre)
		//this.notasDeCursada = newArrayList
		//this.seguidorDeCarrera = new SeguidorDeCarrera
		//this.seguidorDeCarrera.agregarMateria(this)
		//SeguidorDeCarrera.seguidorDeCarreraUnico.agregarMateria(this)
 
	}

	def agregarNota(Nota nota) {
		//this.seguidorDeCarrera = new SeguidorDeCarrera
		
		this.notas.add(nota)

	}
	
	/**
	 * Valida que la materia esté correctamente cargada
	 */
	def validar() {
		if (nombre == null) {
			throw new UserException("Debe ingresar nombre de materia")
		}
	}
	
	override clone()	{
		return super.clone
	}
	
}