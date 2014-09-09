package wicket.seguidorDeCarrera.ui.wicket

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import wicket.seguidorDeCarrera.domain.SeguidorDeCarrera
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.XListView
import org.apache.wicket.markup.html.basic.Label
import wicket.seguidorDeCarrera.domain.Nota
import org.uqbar.wicket.xtend.XButton
import org.apache.wicket.markup.html.form.CheckBox
import wicket.seguidorDeCarrera.domain.Materia

class SeguidorDeCarreraPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	new() {
		val Form<SeguidorDeCarrera> mainForm = new Form<SeguidorDeCarrera>("SeguidorDeCarreraForm")
		this.agregarGrillaResultados(mainForm)

	}
	
	def agregarAcciones(Form<SeguidorDeCarrera> parent) {
		
		parent.addChild(new XButton("nuevaMateria")
			.onClick = [| new Materia ]
		)
		
	} // Este seria el boton de nueva materia

	def agregarGrillaResultados(Form<SeguidorDeCarrera> parent) {
		val listView = new XListView("resultados")
		listView.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("fecha"))
			item.addChild(new Label("descripcion"))
			
			
			val checkResumen = new CheckBox("aprobo")
			checkResumen.setEnabled(false)
			item.addChild(checkResumen)
			
			
			item.addChild(new XButton("editarNota").onClick = [|editar(item.modelObject)])
//				item.addChild(new XButton("eliminar")
//				.onClick = [| 
//					buscador.celularSeleccionado = item.modelObject
//					buscador.eliminarCelularSeleccionado
//				]
//			)
//		]
//		
			
		]
		parent.addChild(listView)
	}

	def editar(Nota nota) {
		responsePage = new EditarNotaPage(nota, this) // Deberia implementarce asi, pero me rompe :( , a mi no me rompe (Agus) :P
	}

}
