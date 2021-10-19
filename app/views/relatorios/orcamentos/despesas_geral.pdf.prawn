prawn_document(page_layout: :landscape)  do |pdf|

  pdf.text 'Previsão das Despesas', size: 16, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 16, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule

  if @despesasgrupos.blank?
  pdf.move_down 180
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20

 dados = @despesasgrupos.map do |f|
[ 
  f.conta.nome, 
  f.janeiro== 0 ? "-" : number_to_currency(f.janeiro, format: "%n"),
  f.fevereiro== 0 ? "-" : number_to_currency(f.fevereiro, format: "%n"),
  f.marco== 0 ? "-" : number_to_currency(f.marco, format: "%n"),
  f.abril== 0 ? "-" : number_to_currency(f.abril, format: "%n"),
  f.maio== 0 ? "-" : number_to_currency(f.maio, format: "%n"),
  f.junho== 0 ? "-" : number_to_currency(f.junho, format: "%n"),
  f.julho== 0 ? "-" : number_to_currency(f.julho, format: "%n"),
  f.agosto== 0 ? "-" : number_to_currency(f.agosto, format: "%n"),
  f.setembro== 0 ? "-" : number_to_currency(f.setembro, format: "%n"),
  f.outubro== 0 ? "-" : number_to_currency(f.outubro, format: "%n"),
  f.novembro== 0 ? "-" : number_to_currency(f.novembro, format: "%n"),
  f.dezembro== 0 ? "-" : number_to_currency(f.dezembro, format: "%n")
                                                                      ]
 end
 
headers = ["Conta","Janeiro","Fevereiro","Março","Abril", "Maio", "Junho", "Julho",
 	      		"Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]

headers_rodape = ["Total ==>",
            "#{@despesasgrupos.sum(:janeiro)== 0 ? '-' : number_to_currency(@despesasgrupos.sum(:janeiro), format: "%n")}",
            "#{@despesasgrupos.sum(:fevereiro)== 0 ? '-' : number_to_currency(@despesasgrupos.sum(:fevereiro), format: "%n")}",
            "#{@despesasgrupos.sum(:marco)== 0 ? '-' : number_to_currency(@despesasgrupos.sum(:marco), format: "%n")}",
            "#{@despesasgrupos.sum(:abril)== 0 ? '-' : number_to_currency(@despesasgrupos.sum(:abril), format: "%n")}",
            "#{@despesasgrupos.sum(:maio)== 0 ? '-' : number_to_currency(@despesasgrupos.sum(:maio), format: "%n")}",
            "#{@despesasgrupos.sum(:junho)== 0 ? '-' : number_to_currency(@despesasgrupos.sum(:junho), format: "%n")}",
            "#{@despesasgrupos.sum(:julho)== 0 ? '-' : number_to_currency(@despesasgrupos.sum(:julho), format: "%n")}",
            "#{@despesasgrupos.sum(:agosto)== 0 ? '-' : number_to_currency(@despesasgrupos.sum(:agosto), format: "%n")}",
            "#{@despesasgrupos.sum(:setembro)== 0 ? '-' : number_to_currency(@despesasgrupos.sum(:setembro), format: "%n")}",
            "#{@despesasgrupos.sum(:outubro)== 0 ? '-' : number_to_currency(@despesasgrupos.sum(:outubro), format: "%n")}",
            "#{@despesasgrupos.sum(:novembro)== 0 ? '-' : number_to_currency(@despesasgrupos.sum(:novembro), format: "%n")}",
            "#{@despesasgrupos.sum(:dezembro)== 0 ? '-' : number_to_currency(@despesasgrupos.sum(:dezembro), format: "%n")}"
              ]


 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 774) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end

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