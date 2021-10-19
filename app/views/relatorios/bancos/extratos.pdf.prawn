prawn_document(page_layout: :portrait)  do |pdf|

@saldo_old = @saldo_anterior

# Dados a serem corrigos para melhor segurança
@total_receita = session[:total_receita].to_i
@total_despesa = session[:total_despesa].to_i
# Dados a serem corrigos para melhor segurança

  pdf.text "Extrato #{@pagamentos.last.banco.nome}", size: 10, style: :bold, align: :center 
  pdf.text "", size: 10, style: :bold, align: :center 
  pdf.text "#{@meses.keys[(@mes)-1]} / #{@anos_atual[0].ano}", size: 10, style: :bold, align: :center 
  pdf.stroke_horizontal_rule

  if @pagamentos.blank?
  pdf.move_down 180
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20

pdf.text "Saldo Anterior: #{valor(@saldo_anterior)}", size: 10


 dados = @pagamentos.map do |f|
[ 
  f.tipo == 'Receita' ? 'C' : 'D',
  data(f.data),
  f.lancamento.blank? ? f.transferencia.obs : f.lancamento.descricao,
  f.tipo == 'Despesa' ? valor(f.total) : '-',
  f.tipo == 'Receita' ? valor(f.total) : '-',
  f.tipo == 'Receita' ? valor(@saldo_anterior += f.total) : valor(@saldo_anterior -= f.total)
   
                                                                      ]
 end
 
headers = ["Tipo","Data","Descrição", "Debito", "Credito", "Saldo"]



 pdf.table([headers]  + (dados), header: true, cell_style: {size: 8 , align: :center}, width: 523)  do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end
  pdf.move_down 20
  pdf.text 'Situação:', size: 10, style: :bold
  pdf.text "Saldo Anterior: #{valor(@saldo_old)}", size: 8
  pdf.text "Receitas: #{valor(@total_receita)}", size: 8
  pdf.text "Despesas: #{valor(@total_despesa)}", size: 8
  pdf.text "Saldo Final: #{valor((@saldo_old + @total_receita) - @total_despesa)}", size: 8

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