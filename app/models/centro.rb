class Centro < ApplicationRecord
  belongs_to :user
  has_many :lancamentos, dependent: :destroy 
  
  validates :nome, presence: true
  validates :nome, uniqueness: {  message: "Conta Existente com esse Tipo" }

   
end
