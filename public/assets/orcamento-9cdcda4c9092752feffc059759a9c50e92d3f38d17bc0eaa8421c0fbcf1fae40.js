	jQuery(function() {
		$("#orcamento_total").attr("readonly", true);
		$("#orcamento_conta_id").attr("disabled", true);
		var contas;

		contas = $('#orcamento_conta_id').html();
		console.log(contas);
		return $('#orcamento_grupocont_id').change(function() {
			var grupos, escaped_grupos, options;
			grupos = $('#orcamento_grupocont_id :selected').text();
			escaped_grupos = grupos.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
			options = $(contas).filter("optgroup[label=" + escaped_grupos + "]").html();
			console.log(options);
			if (options) {
				$('#orcamento_conta_id').html(options);
				$("#orcamento_conta_id").attr("disabled", false);
				return $('#orcamento_conta_id').parent().show();
			} else {
				$('#orcamento_conta_id').empty();
				$("#orcamento_conta_id").attr("disabled", true);
				$.notify("Não Existe Contas Cadastradas ou Ativas para esse Grupo",'info');

			}
			options = $(contas).filter("optgroup[label=" + escaped_grupos + "]").html();

		});
	});

$(document).ready(function() { $("#orcamento_grupocont_id").select2(); });
$(document).ready(function() { $("#orcamento_conta_id").select2(); });

