package wicket.seguidorDeCarrera.ui.wicket

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.markup.html.panel.FeedbackPanel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import wicket.seguidorDeCarrera.domain.Materia

class NuevaMateriaPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

//	private final Materia materia
//	private final boolean finalAprobado

	private final Materia materia

	//private final boolean finalAprobado

	private final SeguidorDeCarreraPage mainPage

	new(Materia nuevaMateria, SeguidorDeCarreraPage mainPage) {
		this.mainPage = mainPage

		this.materia = nuevaMateria
		this.addChild(new Label("titulo", "Nueva Materia"))

		val nuevaMateriaForm = new Form<Materia>("nuevaMateriaForm", this.materia.asCompoundModel)
		this.agregarCamposEdicion(nuevaMateriaForm)
		this.agregarAcciones(nuevaMateriaForm)
		this.addChild(nuevaMateriaForm)

	}

	def agregarCamposEdicion(Form<Materia> parent) {
		parent.addChild(new TextField<String>("nombre"))
	}

	def void agregarAcciones(Form<Materia> parent) {

		parent.addChild(
			new XButton("cancelar") => [
				onClick = [|volver]
			])

		parent.addChild(
			new XButton("aceptar") => [
				onClick = [ |
					materia.validar()
					Materia.home.create(materia)
					this.volver()
				]
			])
	}

	def volver() {

		//mainPage.seguidorDeCarrera() SeguidorDeCarreraPage tiene que tener un mensaje de "start" o algo para ponerlo aca y que se pueda volver a la mainPage
		responsePage = mainPage
	}

}
