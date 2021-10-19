class Relatorios::BancosController < ConfigsController 

	def extratos
		if params[:mes].blank?
			params[:mes] = Time.new.month
		else	
			@mes = (params[:mes].to_i)
			@date = (Date.new(@anos_atual[0].ano,@mes,-1) - 1.month)
		end

		@pagamentos = Pagamento.usuario(current_user).search_banco(params[:mes], @anos_atual[0].ano, params[:bancos]).order('data')
		@saldo_pagamentos_anterior = Pagamento.usuario(current_user).where("data <= ? and banco_id = ?", (@date), params[:bancos]).order(:data)

		@lancamentos_receitas = Lancamento.usuario(current_user).escolha_tipo('Receita')
		@lancamentos_despesas = Lancamento.usuario(current_user).escolha_tipo('Despesa')

		if Rails.env.production?
			@pagamentos_receitas = Pagamento.usuario(current_user).escolha_tipo('Receita').where("extract(month from data) = #{params[:mes]} and extract(year from data) = #{@anos_atual[0].ano}").where(banco: params[:bancos])
			@pagamentos_despesas = Pagamento.usuario(current_user).escolha_tipo('Despesa').where("extract(month from data) = #{params[:mes]} and extract(year from data) = #{@anos_atual[0].ano}").where(banco: params[:bancos])
		else
			@pagamentos_receitas = Pagamento.usuario(current_user).escolha_tipo('Receita').where("cast(strftime('%m', data) as int) = #{params[:mes]} and cast(strftime('%Y', data) as int) = #{@anos_atual[0].ano}").where(banco: params[:bancos])
			@pagamentos_despesas = Pagamento.usuario(current_user).escolha_tipo('Despesa').where("cast(strftime('%m', data) as int) = #{params[:mes]} and cast(strftime('%Y', data) as int) = #{@anos_atual[0].ano}").where(banco: params[:bancos])

		end

		#Calculo do Saldo Anterior
		@saldo_anterior = 0
		@saldo_pagamentos_anterior.each do |s|
			s.tipo == 'Receita' ? (@saldo_anterior += s.total) : (@saldo_anterior -= s.total)
		end
	end
end