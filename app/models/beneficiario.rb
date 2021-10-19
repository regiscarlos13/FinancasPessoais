class Beneficiario < ApplicationRecord
  belongs_to :user
  has_many :pagamentos
  has_many :benes
end
