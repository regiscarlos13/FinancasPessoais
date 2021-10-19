class Ano < ApplicationRecord
	belongs_to :user
	has_many :orcamentos, dependent: :destroy
	has_many :lancamentos
	
	validates_presence_of :ano
	validates_uniqueness_of :ano, scope: :user_id
	
def ativo_nome
	ativo? ? "Aberto" : "Fechado"
end

	def anos
		"#{ano} - #{ativo_nome}"
	end
end

