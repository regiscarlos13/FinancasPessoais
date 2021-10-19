class ApplicationRecord < ActiveRecord::Base
	self.abstract_class = true
	scope :ativos, -> { where(ativo: true) }
	scope :escolha_tipo, -> (escolha) { where(tipo: escolha) }
	scope :usuario,-> (user)  { where(user_id: user) }
	scope :usuario_ano,-> (user, campo = 0) { where(user_id: user, ano_id: campo) }
	enum tipo: [:Despesa, :Receita] 	
	enum obs: [:Deposito, :Saque, :'Saldo Inicial'] 	
	enum ctipo: [:'Obrigatórias Fixas (OF)', :'Obrigatórias Variáveis (OV)', :'Não Obrigatórias Fixas (NOF)', :'Não Obrigatórias Variáveis (NOV)', :Extras ] 	
	
	enum mes: {Janeiro: 1, Fevereiro: 2, Março: 3, Abril: 4, Maio: 5, Junho: 6, Julho: 7, Agosto: 8,
				Setembro: 9, Outubro: 10,	Novembro: 11, Dezembro: 12	}


	scope :date, -> (date_start, date_end) { where("data >= ? and data <= ?", date_start, date_end)  if date_start.present? and date_end.present?}
 
	scope :search_valor, ->  (value) { where("valor = ?", value) if value.present? }

	end
