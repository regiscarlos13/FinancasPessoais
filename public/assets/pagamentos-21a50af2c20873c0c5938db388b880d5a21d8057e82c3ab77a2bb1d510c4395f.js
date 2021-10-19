
	$(function () {
		
		var fornecedor_dados = $("#fornecedor_dados");
		var fonte_dados = $("#fonte_dados");
		var orcamento_receita = $("#orcamento_receita");
		var orcamento_despesa = $("#orcamento_despesa");

		orcamento_receita.hide();
		fonte_dados.hide();

		if ($("#lancamento_tipo_despesa").is(':checked')) {
			
			fornecedor_dados.show();
			fonte_dados.hide();
			orcamento_receita.hide();
			orcamento_despesa.show();

		} else if ($("#lancamento_tipo_receita").is(':checked')) {
			fornecedor_dados.hide();
			fonte_dados.show();
			orcamento_receita.show();
			orcamento_despesa.hide();

		} 

		$("input[name='lancamento[tipo]']").click(function () {
			if ($("input[name='lancamento[tipo]']:checked").val() == "Despesa"){
				
				fonte_dados.hide();
				orcamento_receita.hide();
				fornecedor_dados.show(); 
				orcamento_despesa.show();
				
			} else if ($("input[name='lancamento[tipo]']:checked").val() == "Receita") {
				
				fornecedor_dados.hide(); 
				orcamento_despesa.hide();
				fonte_dados.show();
				orcamento_receita.show();
			} 
		});

	});
	function myFunction() {
		var orcamento_receita = $('#orcamento_receita');
		var orcamento_despesa = $('#orcamento_despesa');
		var lancamento_fonte = $('#lancamento_fonte_id');
		var lancamento_fornecedor = $('#lancamento_fornecedor_id');

		if ($("input[name='lancamento[tipo]']:checked").val() == "Despesa"){
			orcamento_receita.remove();
			lancamento_fonte.remove();

		} else if ($("input[name='lancamento[tipo]']:checked").val() == "Receita") {

			orcamento_despesa.remove();
			lancamento_fornecedor.remove();
		}
	}	

	$(document).ready(function() {$("#orcamento_list_despesa").select2({dropdownParent: $('#lancamento-modal'),width: '100%'});});
	$(document).ready(function() {$("#lancamento_centro_id").select2({dropdownParent: $('#lancamento-modal'),width: '100%'});});
	$(document).ready(function() {$("#lancamento_fornecedor_id").select2({dropdownParent: $('#lancamento-modal'),width: '100%'});});
	$(document).ready(function() {$("#orcamento_list_receita").select2({dropdownParent: $('#lancamento-modal'),width: '100%'});});
	$(document).ready(function() {$("#lancamento_fonte_id").select2({dropdownParent: $('#lancamento-modal'),width: '100%'});});


	
