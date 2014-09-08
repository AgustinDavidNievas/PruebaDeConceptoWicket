package wicket.seguidorDeCarrera.ui.wicket

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import wicket.seguidorDeCarrera.domain.Nota
import org.apache.wicket.markup.html.basic.Label
import org.uqbar.wicket.xtend.XButton
import org.apache.wicket.markup.html.panel.FeedbackPanel
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.markup.html.form.Form

class EditarNotaPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	Nota nota

	private final SeguidorDeCarreraPage mainPage

	new(Nota nota, SeguidorDeCarreraPage mainPage) {

		this.mainPage = mainPage
		this.nota = nota
		this.addChild(new Label("titulo", "Editar Nota"))
		
		val buscarForm = new Form<Nota>("notaForm", this.nota.asCompoundModel)
		this.agregarCamposEdicion(buscarForm)
		this.agregarAcciones(buscarForm)
		this.addChild(buscarForm)
		
	}
	
	def agregarCamposEdicion(Form<Nota> parent) {
		parent.addChild(new TextField<String>("fecha"))
		parent.addChild(new TextField<String>("descripcion"))

		parent.addChild(new FeedbackPanel("feedbackPanel"))
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

		//mainPage.seguidorDeCarrera() SeguidorDeCarreraPage tiene que tener un mensaje de "start" o algo para ponerlo aca y que se pueda volver a la mainPage
//		responsePage = mainPage
	}

}
