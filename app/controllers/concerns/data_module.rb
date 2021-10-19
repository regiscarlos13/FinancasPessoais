module DataModule


	def pagamentos_saldo
		@pagamentos_saldo = Pagamento.usuario(current_user)
	end
	
	def lancamentos_a_pagar
		@lancamentos_apagar = Lancamento.usuario(current_user).where(tipo: 0).date(params[:start], params[:end]).search_valor(params[:valor]).order(data: :asc).select {|item| item.pagamentos.sum(:valor) < item.valor }
	end

	def lancamentos_a_receber
		@lancamentos_areceber = Lancamento.usuario(current_user).where(tipo: 1).order(:data).select {|item| item.pagamentos.sum(:valor) < item.valor }
	end

	def grupos_contas
		@grupocontas = Grupocont.usuario(current_user).ativos.order(:nome)
	end

	def orcamento_lista_receita
		@orcamento_list_receita = Orcamento.joins(:conta).usuario_ano(current_user, @anos_atual[0].id).where("contas.tipo = 1").order('contas.nome ASC')
	end

	def orcamento_lista_despesa
		@orcamento_list_despesa = Orcamento.joins(:conta).usuario_ano(current_user, @anos_atual[0].id).where("contas.tipo = 0").order('contas.nome ASC')
	end

	def pagamentos_all
		@pagamentos = Pagamento.where(lancamento_id: params[:id]).order(:data)
	end





	def dataset_form
		@gruposreceitas = Grupocont.escolha_tipo('Receita')
		@gruposdespesas = Grupocont.escolha_tipo('Despesa')
		@contas = Conta.usuario(current_user)


		@receitasgrupos = Orcamento.usuario_ano(current_user, @anos_atual[0].id).where(grupocont_id: @gruposreceitas)
		@despesasgrupos = Orcamento.usuario_ano(current_user, @anos_atual[0].id).where(grupocont_id: @gruposdespesas)


	end
end