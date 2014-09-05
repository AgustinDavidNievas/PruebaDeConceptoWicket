package wicket.seguidorDeCarrera.ui.wicket

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import wicket.seguidorDeCarrera.domain.Materia
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.markup.html.form.CheckBox
import org.apache.wicket.markup.html.panel.FeedbackPanel

class NuevaMateriaPage extends WebPage{
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	
	private final Materia materia
	private final boolean finalAprobado
	private final SeguidorDeCarreraPage mainPage
	
	new(Materia materia, SeguidorDeCarreraPage mainPage) {
		this.mainPage = mainPage
		
		
	}
	
	def agregarCamposEdicion(Form<Materia> parent) {
		parent.addChild(new TextField<String>("nombre"))
		parent.addChild(new TextField<String>("descripcion"))
		 
		parent.addChild(new CheckBox("finalAprobado"))
		parent.addChild(new FeedbackPanel("feedbackPanel"))
	}
	
}