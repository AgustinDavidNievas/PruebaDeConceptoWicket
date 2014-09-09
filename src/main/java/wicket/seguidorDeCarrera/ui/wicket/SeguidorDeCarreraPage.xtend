package wicket.seguidorDeCarrera.ui.wicket

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XListView
import wicket.seguidorDeCarrera.domain.SeguidorDeCarrera
import org.uqbar.wicket.xtend.XButton
//import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.commons.utils.Observable
import org.apache.wicket.markup.html.form.CheckBox
import wicket.seguidorDeCarrera.domain.Materia

@Observable
class SeguidorDeCarreraPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	var SeguidorDeCarrera seguidor
	
	
	new (){
		this.seguidor = new SeguidorDeCarrera()
		val seguidorDeCarreraForm = new Form<SeguidorDeCarrera>("seguidorDeCarreraForm", this.seguidor.asCompoundModel)
		this.agregarGrillaResultados(seguidorDeCarreraForm)
		this.agregarAcciones(seguidorDeCarreraForm)
		this.addChild(seguidorDeCarreraForm)
	}
	
	def nuevaMateria(Materia materia){
		responsePage = new NuevaMateriaPage(materia, this)
	}
	
	def agregarAcciones(Form<SeguidorDeCarrera> parent) {
			
			val nuevaMateriaButton = new XButton("nuevaMateria")
		nuevaMateriaButton.onClick = [| nuevaMateria(new Materia)  ]
		parent.addChild(nuevaMateriaButton)

	}
//		parent.addChild(new XButton("editarMateria")
//			.onClick = [|  ]
//		)
//		
//		parent.addChild(new XButton("borrarMateria").onClick = [|  ])
//		
//		
//	}
//	
	def agregarGrillaResultados(Form<SeguidorDeCarrera> parent) {
		val listView = new XListView("materias")
		listView.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("nombre"))
			//item.addChild(new Label("modeloCelular.descripcion"))
			
			val checkFinal = new CheckBox("finalAprobado")
			checkFinal.setEnabled(false)
			item.addChild(checkFinal)
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