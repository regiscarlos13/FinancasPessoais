class Orcamento < ApplicationRecord
	before_save :soma_total
	before_validation  :soma_total
	
	has_many :lancamentos, dependent: :destroy 

	belongs_to :user
	belongs_to :ano
	belongs_to :grupocont, -> { where(ativo: true)  and order(:nome)  }
	belongs_to :conta, -> {where(ativo: true)  and order(:nome) }

	validates_uniqueness_of :conta_id, scope: [:grupocont_id, :ano_id]
	#validates :total, presence: { message: "Pelo Menos 1 Mês deve ser preenchido" }


	def nome_conta
  	"#{conta.nome } ---- #{ grupocont.nome}"
  	end

	

	#inicio dos metodos configuração mês
	def mes(mes)
		if mes == 1  then janeiro elsif mes == 2 then fevereiro elsif
			mes == 3  then marco   elsif mes == 4 then abril elsif 
			mes == 5  then maio    elsif mes == 6  then junho elsif 
			mes == 7  then julho   elsif mes == 8 then agosto elsif 
			mes == 9  then setembro   elsif mes == 10 then outubro elsif 
			mes == 11 then novembro   elsif mes == 12 then dezembro
		end
	end
	def anterior
		mes((Time.new.mon) - 1)
	end
	def atual
		mes((Time.new.mon))
	end
	def proximo
		mes((Time.new.mon) + 1)
	end
	#Final dos metodos configuração mês
	
	#Soma dos meses
	def primeiro_semestre
		janeiro + fevereiro + marco + abril + maio + junho
	end
	def segundo_semestre
		julho + agosto + setembro + outubro + novembro + dezembro
	end
	

	def primeiro_trimeste
		janeiro + fevereiro + marco
	end
	def segundo_trimestre
		abril + maio + junho
	end
	def terceiro_trimestre
		julho + agosto + setembro
	end
	def quarto_trimestre
		outubro+novembro+dezembro
	end
	#Final da somas do meses

	def soma_total

		
		if janeiro.present?
			janeiro
		else
			janeiro == 0 or unless janeiro.present?
			self.janeiro = 0
			end
		end
		if fevereiro.present?
			fevereiro
		else
			fevereiro == 0 or unless fevereiro.present?
			self.fevereiro = 0
			end
		end


	if marco.present?
		marco
	else 
		marco == 0 or unless marco.present?
		self.marco = 0	
	end
end	
if abril.present?
	abril
else abril == 0 or unless abril.present?
	self.abril = 0
end
end	
if maio.present?
	maio
else maio == 0 or unless maio.present?
	self.maio = 0
end
end	
if junho.present?
	junho
else junho == 0 or unless junho.present?
	self.junho = 0
end
end	
if julho.present?
	julho
else julho == 0 or unless julho.present?
	self.julho = 0
end
end	
if agosto.present?
	agosto
else agosto == 0 or unless agosto.present?
	self.agosto = 0
end
end	
if setembro.present?
	setembro
else setembro == 0 or unless setembro.present?
	self.setembro = 0
end
end	
if outubro.present?
	outubro
else outubro == 0 or unless outubro.present?
	self.outubro = 0
end
end	
if novembro.present?
	novembro
else novembro == 0 or unless novembro.present?
	self.novembro = 0
end
end	
if dezembro.present?
	dezembro
else dezembro == 0 or unless dezembro.present?
	self.dezembro = 0
end
end	

if (self.janeiro == 0 and self.fevereiro == 0 and self.marco == 0 and 
	self.abril == 0 and self.maio == 0 and self.junho == 0 and	
	self.julho == 0 and self.agosto == 0 and self.setembro == 0 and 
	self.outubro == 0 and self.novembro == 0 and self.dezembro == 0)
	self.total =  0
else
	self.total = (janeiro + fevereiro + marco + abril + 
	maio + junho + julho + agosto + setembro + 
	outubro  + novembro + dezembro)
end
end

end
