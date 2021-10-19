class PagamentosController < ConfigsController 
	before_action :set_pagamento, only: [:create,  :destroy]


	def destroy
		@pagamento = @lancamento.pagamentos.find(params[:id])
		@pagamento.destroy   
		respond_to do |format|
			format.js
		end 

	end

	def create
		@pagamentos = @lancamento.pagamentos.create(pagamento_params)
		respond_to do |format|
			if @pagamentos.save
				format.js {render inline: "location.reload();" }
			else
				format.js
			end
		end
	end


	private
	def set_pagamento
		#@disciplina = Disciplina.find(params[:disciplina_id])
		@lancamento = Lancamento.find(params[:lancamento_id])
	end
	def pagamento_params
		params.require(:pagamento).permit(:data, :total, :valor, :multa, :juros, :beneficiario_id, :banco_id, :tipo).merge(user_id: current_user.id)
	end
end
