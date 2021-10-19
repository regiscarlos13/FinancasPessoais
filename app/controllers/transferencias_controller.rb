class TransferenciasController < ApplicationController

include Enum 

before_action :tipos, :obs, only: [:index]


	def index
		@transferencia1 = Pagamento.new
		@transferencia2 = Pagamento.new

		@transferencia = Pagamento.new
		
		@transferencia.build_transferencia


		if Rails.env.production?
			@transferencias = Pagamento.usuario(current_user).where('extract(year from data) = ?', @anos_atual[0].ano).where(lancamento_id: nil)
		else
			@transferencias = Pagamento.usuario(current_user).where("cast(strftime('%Y', data) as int) = ?", @anos_atual[0].ano).where(lancamento_id: nil)
				
		end
		
	end

	def destroy
		@transferencia = Pagamento.find(params[:id])
		@transferencia.destroy   
		respond_to do |format|
			format.html { redirect_to transferencias_path, notice: "Removido com Sucesso!" }
		end
	end

	def create
		@transferencia = Pagamento.new(pagamento_params)
		respond_to do |format|
			if @transferencia.save
				format.html { redirect_to transferencias_path, notice: 'Transação Criada com Sucesso.' }
			else
				format.html { render :index }
			end
		end

		
	end

	
	private

	def pagamento_params
		params.require(:pagamento).permit(:data, :total, :valor, :banco_id, :tipo, transferencia_attributes: [:obs, :user_id]).merge(user_id: current_user.id)
		
	end
end
