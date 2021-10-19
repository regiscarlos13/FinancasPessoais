class HomeController < ApplicationController

include DataModule

before_action :pagamentos_saldo, :lancamentos_a_pagar, :lancamentos_a_receber, only: [:index]


	def index

	end

end
