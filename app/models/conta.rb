class Conta < ApplicationRecord
	before_save :save_tipo
	belongs_to :user
	belongs_to :grupocont
	has_many :orcamentos, dependent: :destroy 
	
	validates_presence_of :nome, :grupocont, :ctipo
	validates_uniqueness_of :nome

	def save_tipo
	self.tipo = self.grupocont.tipo	
	end

	

end
 