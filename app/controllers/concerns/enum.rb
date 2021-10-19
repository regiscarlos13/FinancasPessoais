module Enum

	def tipos
		@tipos = ApplicationRecord.tipos.keys
	end

	def obs
		@obs = ApplicationRecord.obs.keys
	end

	def ctipos
		@ctipos = ApplicationRecord.ctipos.keys
	end

	def meses
		@meses = ApplicationRecord.mes
	end

	
	def enuns
		@beneficiarios = Beneficiario.ativos
		@centros = Centro.ativos
	end
end