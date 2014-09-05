package wicket.seguidorDeCarrera.domain

import java.util.Date
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.UserException

class Nota extends Entity implements Cloneable{
	@Property Date fecha
	@Property String descripcion
	@Property Boolean aprobado = false

	new() {
		super()
	}

	new(String descripcion, Date fecha, Boolean aprobado) {		
		this.agregarDescripcion(descripcion)
		this.agregarFecha(fecha)
		this.agregarAprobado = aprobado
	}

	def agregarDescripcion(String descripcion) {
		this.descripcion = descripcion
	}

	def nuevaNota(String descripcion, Date fecha, Boolean aprobado) {
		this.agregarDescripcion(descripcion)
		this.agregarFecha(fecha)
		this.agregarAprobado = aprobado

	}

	def agregarFecha(Date fecha) {
		this.fecha = fecha

	}

	def agregarAprobado(Boolean aprob) {
		this.aprobado = aprob
	}

	override clone() {
		super.clone()
	}

	def validar() {
		if (descripcion == null) {
			throw new UserException("Debe ingresar descripcion")
		}
		if (fecha == null) {
			throw new UserException("Debe ingresar fecha")
		}

	}
}