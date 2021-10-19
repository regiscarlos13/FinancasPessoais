module I18nMessages

	def utf8_enforcer_tag
		''.html_safe
	end
	def situation(field)
		if field == true
			content_tag(:span, 'Ativo', class: 'badge badge-primary')
		else
			content_tag(:span, 'Desativado', class: 'badge badge-info')
		end
	end

	def i18n_yes(field)
		field == true ? 'Sim' : 'Não'
	end

	def date(field)
		field.strftime("%d/%m/%Y") 	
	end


	def valor(valor)
		valor == 0 ? '-' : number_to_currency(valor)
	end
	


end