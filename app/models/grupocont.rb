class Grupocont < ApplicationRecord
  belongs_to :user
  has_many :contas, -> { order(:nome) }, dependent: :destroy 
  has_many :orcamentos

  validates :nome, :tipo, presence: { message: "Registro deve ser preenchido" }
  
 validates :nome, uniqueness: { scope: :tipo,
    message: "Conta Existente com esse Tipo" }

    def name_tipo
		"#{nome} - #{tipo}"
	end

end
