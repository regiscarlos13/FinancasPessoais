class Relatorios::ContasController < ConfigsController 
	before_action :variables, only: [:apagar, :areceber]
	before_action :lancamentos_a_pagar, only: [:apagar]
	before_action :lancamentos_a_receber, only: [:areceber]


	include DataModule
	def apagar
	
		@total = @lancamentos_apagar.sum(&:valor)
	end
	def areceber
	end

	private

	def variables
		@avencer = 0
		@vencidas = 0
	end


end
