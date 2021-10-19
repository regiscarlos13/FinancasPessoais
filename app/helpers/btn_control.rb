module BtnControl

	def btn_new(link, options = nil,  &block)
		link_to link,  class: 'btn btn-primary btn-icon-split btn-sm', title: 'Novo Registro', remote: options do
			content_tag(:span, content_tag(:i, nil, class: "fa fa-plus"), class: 'icon text-white-50') + content_tag(:span, 'Novo Registro', class: 'text d-none d-lg-block d-xl-block d-md-block')
		end
	end
	def btn_edit(link, options = nil,  &block)
		link_to link,  class: 'btn btn-secondary btn-icon-split btn-sm', title: 'Editar Registro', remote: options do
			content_tag(:span, content_tag(:i, nil, class: "fa fa-edit"), class: 'icon text-white-50') + content_tag(:span, 'Editar', class: 'text d-none d-lg-block d-xl-block')
		end
	end
	def btn_show(link, options = nil,  &block)
		link_to link,  class: 'btn btn-info btn-icon-split btn-sm', title: 'Listar Registros', remote: options do
			content_tag(:span, content_tag(:i, nil, class: "fa fa-search"), class: 'icon text-white-50') + content_tag(:span, 'Listar', class: 'text d-none d-lg-block d-xl-block')
		end
	end
	def btn_delete(link, options = nil,  &block)
		link_to link,  class: 'btn btn-danger btn-icon-split btn-sm', method: :delete, data: { confirm: "Voçê tem certeza quer apagar Registro?" }, title: 'Apagar Registro', remote: options do

			content_tag(:span, content_tag(:i, nil, class: "fa fa-trash"), class: 'icon text-white-50') + content_tag(:span, 'Apagar', class: 'text d-none d-lg-block d-xl-block')
		end
	end
	def btn_print(link, options = nil,  &block)
		link_to link, format: :pdf, class: 'btn btn-warning btn-icon-split btn-sm', target: "_blank", title: 'Imprimir Registro', remote: options do
			content_tag(:span, content_tag(:i, nil, class: "fa fa-print"), class: 'icon text-white-50') + content_tag(:span, 'Imprimir', class: 'text d-none d-lg-block d-xl-block d-md-block')
		end
	end
	def btn_cancel(link, options = nil,  &block)
		link_to link,  class: 'btn btn-danger btn-icon-split btn-sm', title: 'Cancelar Registro', remote: options do
			content_tag(:span, content_tag(:i, nil, class: "fa fa-ban"), class: 'icon text-white-50') + content_tag(:span, 'Cancelar', class: 'text d-none d-lg-block d-xl-block')
		end
	end
	def btn_back(link, options = nil,  &block)
		link_to link,  class: 'btn btn-primary btn-icon-split btn-sm', title: 'Voltar', remote: options do
			content_tag(:span, content_tag(:i, nil, class: "fa fa-arrow-left"), class: 'icon text-white-50') + content_tag(:span, 'Voltar', class: 'text d-none d-lg-block d-xl-block')
		end
	end
	def btn_save(options = nil,  &block)
		button_tag class: 'btn btn-success btn-icon-split btn-sm', title: 'Salvar Registro', remote: options do
			content_tag(:span, content_tag(:i, nil, class: "fa fa-save"), class: 'icon text-white-50') + content_tag(:span, 'Salvar', class: 'text d-none d-lg-block d-xl-block')
		end
	end

end
