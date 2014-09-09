package wicket.seguidorDeCarrera.ui.wicket

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import wicket.seguidorDeCarrera.domain.Nota

class EditarNotaPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	
	
	Nota nota

		new(Nota nota) {
	
		
		this.nota = nota
		this.addChild(new Label("titulo", "Editar Nota"))
		
		val buscarForm = new Form<Nota>("editarNotaForm", this.nota.asCompoundModel)
		this.agregarCamposEdicion(buscarForm)
		this.agregarAcciones(buscarForm)
		this.addChild(buscarForm)
		
	}
	
	def agregarCamposEdicion(Form<Nota> parent) {
		parent.addChild(new TextField<String>("fecha"))
		parent.addChild(new TextField<String>("descripcion"))
	}
	
	
		def void agregarAcciones(Form<Nota> parent) {

		parent.addChild(
			new XButton("cancelar") => [
				onClick = [|volver]
			])

		parent.addChild(
			new XButton("aceptar") => [
				onClick = [ |
					nota.validar()
					//Nota.home.create(nota)
					this.volver()
				]
			])
	}

	def volver() {
		responsePage = new SeguidorDeCarreraPage
	}

}
