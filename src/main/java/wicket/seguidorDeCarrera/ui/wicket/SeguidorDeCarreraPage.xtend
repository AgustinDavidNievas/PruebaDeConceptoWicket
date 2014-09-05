package wicket.seguidorDeCarrera.ui.wicket

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import wicket.seguidorDeCarrera.domain.SeguidorDeCarrera
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.XListView
import org.apache.wicket.markup.html.basic.Label

class SeguidorDeCarreraPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	
	new (){
		val Form<SeguidorDeCarrera> mainForm = new Form<SeguidorDeCarrera>("SeguidorDeCarreraForm")
		this.agregarGrillaResultados(mainForm)
		
	}
	
	def agregarGrillaResultados(Form<SeguidorDeCarrera> parent) {
		val listView = new XListView("resultados")
		listView.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("materias"))
			//item.addChild(new Label("modeloCelular.descripcion"))
			
//			val checkResumen = new CheckBox("recibeResumenCuenta")
//			checkResumen.setEnabled(false)
//			item.addChild(checkResumen)
//			
//			item.addChild(new XButton("editar").onClick = [| editar(item.modelObject) ])
//			item.addChild(new XButton("eliminar")
//				.onClick = [| 
//					buscador.celularSeleccionado = item.modelObject
//					buscador.eliminarCelularSeleccionado
//				]
//			)
		]
		parent.addChild(listView)
	}
	
}