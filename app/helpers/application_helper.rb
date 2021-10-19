module ApplicationHelper

	include LoadFile
	
	def value_date(form, field)
		if action_name == 'new'
			form.date_field field, value: Time.now.strftime('%Y-%m-%d'), class: " form-control form-control-sm"
		else
			form.date_field field,   class: 'form-control form-control-sm'
		end

	end

	def disable_field(form, field)
		if action_name == 'new'
			form.input field, input_html: {value: '1'} 
		else
			form.input field, disabled: true
		end

	end

	def valor_sm(valor)
		valor == 0 ? '-' : number_to_currency(valor, format: "%n")
	end

	def valor(valor)
		valor == 0 ? '-' : number_to_currency(valor)
	end


	def data(campo)
		campo.strftime("%d/%m/%Y") 	
	end
	def data_sm(campo)
		campo.strftime("%d/%m") 	

	end

	def situacao_limpa(campo)
		if campo == true
			'Ativo'
		else
			'Desativado'
		end
	end
	def situacao(campo)
		if campo == true
			content_tag(:span, 'Ativo', class: 'badge badge-primary')
		else
			content_tag(:span, 'Desativado', class: 'badge badge-info')
		end
	end


	def saldo(mes)
		valor(@receitasgrupos.sum(mes) - @despesasgrupos.sum(mes)) 
	end

	def vencimento(campo)
		if campo >= Date.today
			content_tag(:span, 'À Vencer', class: 'badge badge-success')
		else
			content_tag(:span, 'Vencida', class: 'badge badge-danger')
		end
	end


	def tipo_conta_sm(campo)
		if campo == 'Receita'
			content_tag(:span, 'R', class: 'badge badge-success')
		else
			content_tag(:span, 'D', class: 'badge badge-danger')
		end
	end

	def tipo_conta(campo)
		if campo == 'Receita'
			content_tag(:span, 'Receita', class: 'badge badge-success')
		else
			content_tag(:span, 'Despesa', class: 'badge badge-danger')
		end
	end

end      
