class Banco < ApplicationRecord
  belongs_to :user
  has_many :pagamentos
  accepts_nested_attributes_for :pagamentos  
end
