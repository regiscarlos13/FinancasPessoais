class User < ApplicationRecord
	has_many :grupoconts, dependent: :destroy
	has_many :contas, dependent: :destroy
	has_many :orcamentos, dependent: :destroy
	has_many :fontes, dependent: :destroy
	has_many :fornecedors, dependent: :destroy
	has_many :anos,  dependent: :destroy
	has_many :atuals, dependent: :destroy
	has_many :lancamentos, dependent: :destroy
	has_many :centros, dependent: :destroy
	has_many :pagamentos, dependent: :destroy
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable, , :confirmable, :registerable, 
  devise :database_authenticatable,:timeoutable,:registerable,
  :recoverable, :rememberable, :trackable, :validatable
 
end
