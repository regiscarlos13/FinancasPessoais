class Relatorios::ComparaController < ConfigsController 

	def despesas
	end

	def receitas
	end
	def gastos
		@pagamentos = Pagamento.joins(:lancamento).where(tipo: 0).where('beneficiario_id = ? OR  banco_id = ? OR lancamentos.centro_id = ?',  params[:beneficiario], params[:banco], params[:centro])
		@total = @pagamentos.sum(:total)
	end
end
