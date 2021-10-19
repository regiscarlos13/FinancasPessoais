class Lancamento < ApplicationRecord

before_save :value_parcela
  has_many :pagamentos, dependent: :destroy

  belongs_to :user
  belongs_to :fornecedor,-> { where(ativo: true) and order(nome: :asc)}, optional: true
  belongs_to :fonte,-> { where(ativo: true) and order(nome: :asc) }, optional: true
  belongs_to :centro,-> { where(ativo: true) and order(nome: :asc)}, optional: true
  belongs_to :orcamento, optional: true
  #belongs_to :ano

  validates :descricao, :tipo, :data, :parcela, presence: true
  validates :tipo, presence: true

  validates :valor, :presence => true#, :format => { :with => /\A(\$)?(\d+)(\.|,)?\d{0,2}?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }


  def value_parcela
    if self.number.blank?
      self.number = self.parcela
      self.parcela = 1
    end




  end


  def self.search_mes(query, ano)
   if Rails.env.production?
    where('extract(month from data) = ? and extract(year from data) = ?', query, ano)
  else
    where("cast(strftime('%m', data) as int) = ? and cast(strftime('%Y', data) as int) = ?", query, ano)
  end

end

def saldo
  valor - pagamentos.sum(:valor)
end


end
