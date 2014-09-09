package wicket.seguidorDeCarrera.ui.wicket

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XListView
import wicket.seguidorDeCarrera.domain.SeguidorDeCarrera
import org.uqbar.wicket.xtend.XButton
import org.apache.wicket.model.CompoundPropertyModel

class SeguidorDeCarreraPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	var SeguidorDeCarrera seguidor
	
	
	new (){
		this.seguidor = new SeguidorDeCarrera()
		val Form<SeguidorDeCarrera> mainForm = new Form<SeguidorDeCarrera>("SeguidorDeCarreraForm", this.seguidor.asCompoundModel)
		this.agregarGrillaResultados(mainForm)
		this.agregarAcciones(mainForm)
		this.addChild(mainForm)
	}
	
	def agregarAcciones(Form<SeguidorDeCarrera> parent) {
			
			val nuevaMateriaButton = new XButton("nuevaMateria")
		nuevaMateriaButton.onClick = [|  ]
		parent.addChild(nuevaMateriaButton)
		
		parent.addChild(new XButton("editarMateria")
			.onClick = [|  ]
		)
		
		parent.addChild(new XButton("borrarMateria").onClick = [|  ])
		
		
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