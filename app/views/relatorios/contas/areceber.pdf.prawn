prawn_document(page_layout: :portrait)  do |pdf|

  pdf.text "Relação de Contas", size: 10, style: :bold, align: :center 
  pdf.text "À Receber #{@anos_atual[0].ano}", size: 10, style: :bold, align: :center 
  pdf.stroke_horizontal_rule

  if @lancamentos_areceber.blank?
  pdf.move_down 180
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20

 dados = @lancamentos_areceber.map do |f|
    
  if f.valor <= f.pagamentos.sum(:valor)
  else
    [data(f.data),
      f.orcamento.conta.nome,
      f.descricao,
      valor(f.valor),
      valor(f.pagamentos.sum(:valor)),
      valor(f.valor - f.pagamentos.sum(:valor)),
      f.data >= Date.today ? "À Vencer" : "Vencida"
       ]
    end

  end.compact

headers = ["Lancamento","Conta","Descrição", "Valor", "Pago", "À Pagar", "Situação"]


 pdf.table([headers]  + (dados), header: true, cell_style: {size: 8 , align: :center}, width: 523)  do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end
  
  pdf.move_down 20
  pdf.text 'Situação:', size: 10, style: :bold, align: :right
  pdf.text "Total Vencidas: #{valor(session[:total_vencidas])}", size: 8, align: :right
  pdf.text "Total À Vencer: #{valor(session[:total_avencer])}", size: 8, align: :right
  pdf.text "Total: #{ valor(session[:total])  }", size: 8, align: :right
  
  #Roda pé
 pdf.number_pages "Gerado por: #{current_user.email} em #{(Time.now).strftime("%d/%m/%y às %H:%M")} - Página <page> de <total>", 
        :start_count_at => 0, 
        :page_filter => :all, 
        :at => [pdf.bounds.left - 0, -5], 
        :align => :center, 
        :size => 8
#pula pagina
  #pdf.start_new_page
end
