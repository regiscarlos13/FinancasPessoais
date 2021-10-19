class ConfigsController < ApplicationController
	
	#before_action :verification_years
	#before_action :enuns, only: [:new, :edit, :index, :extratos]
	#before_action :dataset_form
	
	#before_action :lista_dados, unless: ->(controller) { [:home].include?(controller.controller_name) }

	#include Enum
	#include Verification
	#include DataModule


	protected

	def lista_dados


		@bancos = Banco.usuario(current_user).ativos	
		@beneficiarios = Beneficiario.usuario(current_user).ativos	
		@centros = Centro.usuario(current_user).ativos	

		############################################
		
		#@pagamentos = Pagamento.where(lancamento_id: params[:id]).order(:data)

		############################################
		

		if @anos_atual.blank?
			
		else

			@grupocontas = Grupocont.usuario(current_user).ativos.order(:nome)
			@gruposreceitas = Grupocont.escolha_tipo('Receita')
			@gruposdespesas = Grupocont.escolha_tipo('Despesa')
			@contas = Conta.usuario(current_user).ativos


			#Contas a pagar e receber

			#@avencer = 0
			#@vencidas = 0

			

			#@lancamentos_apagar = Lancamento.usuario(current_user).where(tipo: 0).date(params[:start], params[:end]).search_valor(params[:valor]).order(:data).select {|item| item.pagamentos.sum(:valor) < item.valor }
			#@lancamentos_areceber = Lancamento.usuario(current_user).where(tipo: 1).order(:data).select {|item| item.pagamentos.sum(:valor) < item.valor }






			if Rails.env.production?
				@lancamentos_apagar_compara = Lancamento.usuario(current_user).where(tipo: 0).where('extract(year from data) = ?', @anos_atual[0].ano)
				@lancamentos_areceber_compara = Lancamento.usuario(current_user).where(tipo: 1).where('extract(year from data) = ?', @anos_atual[0].ano)
			else

				@lancamentos_apagar_compara = Lancamento.usuario(current_user).where(tipo: 0).where("cast(strftime('%Y', data) as int) = ?", @anos_atual[0].ano)
				@lancamentos_areceber_compara = Lancamento.usuario(current_user).where(tipo: 1).where("cast(strftime('%Y', data) as int) = ?", @anos_atual[0].ano)
			end

			@receitasgrupos = Orcamento.usuario_ano(current_user, @anos_atual[0].id).where(grupocont_id: @gruposreceitas)
			@despesasgrupos = Orcamento.usuario_ano(current_user, @anos_atual[0].id).where(grupocont_id: @gruposdespesas)
			#Fim dos Contas a pagar e receber

			@orcamento_list = Orcamento.joins(:conta).usuario_ano(current_user, @anos_atual[0].id)

			#@orcamento_list_receita = Orcamento.joins(:conta).usuario_ano(current_user, @anos_atual[0].id).where("contas.tipo = 1").order('contas.nome ASC')
			#@orcamento_list_despesa = Orcamento.joins(:conta).usuario_ano(current_user, @anos_atual[0].id).where("contas.tipo = 0").order('contas.nome ASC')

			@ano = Time.now
			@anterior =	l((@ano - 1.month), format: "%B")
			@atual =    l(@ano, format: "%B")
			@proximo =  l((@ano + 1.month), format: "%B")
			
			@ano_anterior = l((@ano - 1.month), format: "%Y")
			@ano_proximo  = l((@ano + 1.month), format: "%Y")
			
			#soma total receita e despesas

			(@ano_anterior).to_s == (@anos_atual[0].ano).to_s ? (@soma_anterior_receita = @receitasgrupos.sum(@anterior == 'Março' ? :marco : @anterior)) : ''
			@soma_atual_receita    = @receitasgrupos.sum(@atual == 'Março' ? :marco : @atual)
			(@ano_proximo).to_s  == (@anos_atual[0].ano).to_s ? (@soma_proximo_receita =  @receitasgrupos.sum(@proximo  == 'Março' ? :marco : @proximo)) : ''
			(@ano_anterior).to_s == (@anos_atual[0].ano).to_s ? (@soma_anterior_despesa = @despesasgrupos.sum(@anterior == 'Março' ? :marco : @anterior)) : ''
			@soma_atual_despesa    = @despesasgrupos.sum(@atual == 'Março' ? :marco : @atual)
			(@ano_proximo).to_s  == (@anos_atual[0].ano).to_s ? (@soma_proximo_despesa =  @despesasgrupos.sum(@proximo  == 'Março' ? :marco : @proximo)) : ''
		end
		
	end
	
end