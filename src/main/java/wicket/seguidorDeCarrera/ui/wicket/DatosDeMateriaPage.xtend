package wicket.seguidorDeCarrera.ui.wicket

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import wicket.seguidorDeCarrera.domain.Materia
import org.apache.wicket.markup.html.form.Form
import wicket.seguidorDeCarrera.domain.SeguidorDeCarrera
import org.uqbar.wicket.xtend.XListView
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.CheckBox

class DatosDeMateriaPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
		SeguidorDeCarrera seguidor
	
	new (Materia materia, SeguidorDeCarrera seguidor) {
		val datosDeMateriaForm = new Form<Materia>("datosDeMateriaForm", materia.asCompoundModel)
		this.agregarGrillaDeNotas(datosDeMateriaForm)
		//this.agregarAcciones(datosDeMateriaForm)
		this.agregarCamposDeEdicion(datosDeMateriaForm)
		this.addChild(datosDeMateriaForm)
		this.actualizar(seguidor)
		this.seguidor = seguidor
		
	}
	
	def agregarCamposDeEdicion(Form <Materia> parent){
		parent.addChild(new TextField<Integer>("anioDeCursada"))
		parent.addChild(new TextField<String>("profesor"))
		parent.addChild(new DropDownChoice<String>("ubicacionDeLaMateria") => [
			choices = loadableModel([| seguidor.ubicaciones ])
						
		])
		parent.addChild(new CheckBox("finalAprobado"))
		
	}
	
def actualizar(SeguidorDeCarrera seguidor){
		
		seguidor.actualizar
		
	}
	
def agregarGrillaDeNotas(Form<Materia> parent){
	val listView = new XListView("notasDeCursada")
		listView.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("fecha"))
			item.addChild(new Label("descripcion"))
			item.addChild(new Label("aprobado"))
			
			]
		
	
}		
	
}