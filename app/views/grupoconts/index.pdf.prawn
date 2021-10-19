prawn_document do |pdf|
  
  pdf.text 'Relação de Grupos', size: 16, :style => :bold, :align => :center
  pdf.move_down 10
  
 dados1 = @grupoconts.order(:nome).map do |grupo|
 [grupo.id, grupo.nome, grupo.tipo, situacao_limpa(grupo.ativo)]
 end
 
 headers = ["ID","Nome","Tipo", "Ativo"]
 pdf.table([headers] + dados1, :header => true,  :column_widths => [30, 290, 100,100]) do
 style row(0), :background_color => "DDDDDD", :font_style => :bold, align: :center
end

  #Roda pé
 pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y às %H:%M")} - Página <page> de <total>", 
				:start_count_at => 0, 
				:page_filter => :all, 
				:at => [pdf.bounds.left - 0, -5], 
				:align => :center, 
				:size => 8
  

#pula pagina
  #pdf.start_new_page



end