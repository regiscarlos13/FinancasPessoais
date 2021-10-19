prawn_document do |pdf|
  
  @mes = params[:q].to_i
  pdf.text 'Relação de Contas', size: 16, :style => :bold, :align => :center
  pdf.text "#{@meses.keys[(@mes-1)]} / #{@anos_atual[0].ano}", size: 16, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule

  
  pdf.move_down 20
  
 dados1 = @lancamentos.map do |lancamento|
 [lancamento.tipo,
  data(lancamento.data), 
  lancamento.orcamento.conta.nome, 
  lancamento.descricao, 
  lancamento.centro.nome,
  valor(lancamento.valor)
 ]
 end
 
 headers = ["Tipo","Data","Conta", "Descrição", "Centro", "Valor"]
 pdf.table([headers] + dados1, :header => true, cell_style: {size: 8 , align: :center}, width: 523) do
 style row(0), :background_color => "DDDDDD", :font_style => :bold, align: :center
end
  pdf.move_down 20
  pdf.text 'Situação:', size: 10, style: :bold, align: :right
  pdf.text "Receitas: #{valor(@sum_receitas)}", size: 8, align: :right
  pdf.text "Despesas: #{valor(@sum_despesas)}", size: 8, align: :right
  pdf.text "Saldo Final: #{valor(@sum_receitas - @sum_despesas)}", size: 8, align: :right


   #Roda pé
 pdf.number_pages "Gerado por: #{current_user.email} em #{(Time.now).strftime("%d/%m/%y às %H:%M")} - Página <page> de <total>", 
        :start_count_at => 0, 
        :page_filter => :all, 
        :at => [pdf.bounds.left - 0, -5], 
        :align => :center, 
        :size => 8
#
#pula pagina
  #pdf.start_new_page



end