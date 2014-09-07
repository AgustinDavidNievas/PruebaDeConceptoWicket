package wicket.seguidorDeCarrera.ui.wicket

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import wicket.seguidorDeCarrera.domain.Nota
import org.apache.wicket.markup.html.basic.Label

class EditarNotaPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	private final SeguidorDeCarreraPage mainPage

	new(Nota nota, SeguidorDeCarreraPage mainPage) {

		this.mainPage = mainPage

		this.addChild(new Label("titulo", "Editar Nota"))
		
	}

}
