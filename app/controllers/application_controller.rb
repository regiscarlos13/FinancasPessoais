class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_action :verifica_ano, unless: :devise_controller?

	layout :layout_by_resource

	include Layout

	def set_session
		cookies.encrypted[:selected_year] = params[:year_select]
		redirect_to root_path
	end	


	def verifica_ano
		@anos_count = Ano.usuario(current_user)
		if @anos_count.blank?
			unless controller_name == 'anos' 
				redirect_to new_ano_path , alert: 'Você tem que Cadastrar um ano para continuar'
			end
		else
			if cookies.encrypted[:selected_year].present?
				@anos_atual = Ano.usuario(current_user).where(id: cookies.encrypted[:selected_year])
				@select_btn_ano =	"#{@anos_atual[0].ano} - Mudar Ano "
			else
				@select_btn_ano =	'Escolha um ano'
				
			end
		end	
	end
	


end
