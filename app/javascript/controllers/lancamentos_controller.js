import { Controller } from "stimulus"


import 'select2'
import 'select2/dist/css/select2.css'

export default class extends Controller {

	initialize() {
		
		$("#orcamento_list_despesa").select2({dropdownParent: $('#lancamento-modal'),width: '100%'})
		$("#orcamento_list_receita").select2({dropdownParent: $('#lancamento-modal'),width: '100%'})
		$("#lancamento_centro_id").select2({dropdownParent: $('#lancamento-modal'),width: '100%'})
		$("#lancamento_fornecedor_id").select2({dropdownParent: $('#lancamento-modal'),width: '100%'})

		$("#lancamento_fonte_id").select2({dropdownParent: $('#lancamento-modal'),width: '100%'})

			var lista_receita = document.getElementById('lista_receita')
			var fonte = document.getElementById('fonte')

			if (lista_receita == null) {
				
			
			} else {
				lista_receita.hidden = true
				fonte.hidden = true

			}


	}




	tipos() {
		
		var lista_receita = document.getElementById('lista_receita')
		var lista_despesa = document.getElementById('lista_despesa')
		var fornecedor = document.getElementById('fornecedor')
		var fonte = document.getElementById('fonte')
	
		if ($("input[name='lancamento[tipo]']:checked").val() == "Despesa"){
				lista_receita.hidden = true
				lista_despesa.hidden = false
				fornecedor.hidden = false
				fonte.hidden = true

			} else if ($("input[name='lancamento[tipo]']:checked").val() == "Receita") {
				lista_receita.hidden = false
				lista_despesa.hidden = true
				fornecedor.hidden = true
				fonte.hidden = false
			} 
	}
	connect() {
	}
}
