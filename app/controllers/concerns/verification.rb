module Verification
	def verification_years
		@anos_atual = Ano.usuario(current_user).where(id: cookies.encrypted[:selected_year])
		@anos = Ano.usuario(current_user).where(ativo: true)
		
		if @anos.empty?
			unless controller_name == 'anos'
				redirect_to anos_path, alert: 'Você tem que Cadastrar um ano para continuar'
			end
		elsif cookies[:selected_year].blank?
			@select_btn_ano =	"Escolha o Ano"
			unless controller_name == 'home' or controller_name == 'anos' 
				redirect_to root_path, alert: 'Escolha um ano'
			end
		else
			@select_btn_ano =	"#{@anos_atual[0].ano} - Mudar Ano "
		end
	end
end