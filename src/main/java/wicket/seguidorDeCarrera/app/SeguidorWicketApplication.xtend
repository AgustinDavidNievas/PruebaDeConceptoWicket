package wicket.seguidorDeCarrera.app

import org.apache.wicket.protocol.http.WebApplication
import wicket.seguidorDeCarrera.ui.wicket.SeguidorDeCarreraPage
import wicket.seguidorDeCarrera.domain.HomeMaterias
import wicket.seguidorDeCarrera.domain.Materia
import org.uqbar.commons.utils.ApplicationContext
import wicket.seguidorDeCarrera.domain.HomeNotas
import wicket.seguidorDeCarrera.domain.Nota

class SeguidorWicketApplication extends WebApplication {
	
	override protected init() {
		super.init()
		ApplicationContext.instance.configureSingleton(Nota, new HomeNotas)
		ApplicationContext.instance.configureSingleton(Materia, new HomeMaterias)
	}
	
	override getHomePage() {
		return SeguidorDeCarreraPage
	}
	
}