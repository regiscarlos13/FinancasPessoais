class Fonte < ApplicationRecord
  belongs_to :user
  has_many :lancamentos
  validates_presence_of :nome, :documento
  
end
