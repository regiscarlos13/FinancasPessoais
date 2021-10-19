class Pagamento < ApplicationRecord
 before_save :soma_total
 before_save :save_tipo
 before_validation  :soma_total
 belongs_to :user
 belongs_to :lancamento, optional: true
 belongs_to :banco,-> { where ativo: true }
 belongs_to :beneficiario,-> { where ativo: true }, optional: true
 has_one :transferencia, dependent: :destroy
 accepts_nested_attributes_for :transferencia
 validates :data,  presence: true

 validates :valor, :presence => true

 def save_tipo
  if self.lancamento.blank?
    self.tipo
  else
    self.tipo = self.lancamento.tipo 
  end
end



def soma_total
 self.total = self.valor + self.juros + self.multa
end

def self.search_banco(query, ano, qbanco)
 if Rails.env.production?
  where('extract(month from data) = ? and extract(year from data) = ? and banco_id = ?', query, ano, qbanco)
    #where('extract(month from data) = ? and extract(year from data) = ?', query, ano)
  else
    where("cast(strftime('%m', data) as int) = ? and cast(strftime('%Y', data) as int) = ? and banco_id = ?", query, ano, qbanco)
  end


end

def credito_saldo
  tipo == 'Receita' ? total : 0
end
def debito_saldo
  tipo == 'Despesa' ? total : 0
end


end
