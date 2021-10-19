prawn_document(page_layout: :portrait)  do |pdf|


#Relatorio do Mes de Janeiro
  pdf.text 'Orçamento de Janeiro', size: 14, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 14, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule
  if @orcamento_list.blank?
  pdf.move_down 220
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20
 dados = @orcamento_list.map do |f|
[ 
 
  f.conta.nome, 
  f.conta.tipo == 'Receita' ? valor(f.janeiro) : '-',
  f.conta.tipo == 'Despesa' ? valor(f.janeiro) : '-',
]
 end

totalreceita = "#{valor(@receitasgrupos.sum(:janeiro))}" 
totaldespesa = "#{valor(@despesasgrupos.sum(:janeiro))}"

headers = ["Conta","Receita","Despesa"]
headers_rodape = ["Total ==>",
            totalreceita,
            totaldespesa
              ]
 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 525, row_colors: ["FFFFFF","FFFFCC"]) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end
  pdf.move_down 25
pdf.text "RECEITAS - DESPESAS: #{saldo(:janeiro)}", size: 10, :style => :bold
pdf.move_down 10
pdf.text "RECEITAS: " + totalreceita, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (ROF): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:janeiro))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (ROV): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:janeiro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (RNOF):#{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:janeiro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (RNOV): #{valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:janeiro))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:janeiro))}", size: 10
pdf.move_down 15
pdf.text "DESPESAS: " + totaldespesa, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (DOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:janeiro))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (DOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:janeiro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (DNOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:janeiro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (DNOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:janeiro))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:janeiro))}", size: 10
pdf.move_down 5

#pula pagina

pdf.start_new_page
#Fim Relatorio do Mes de Janeiro
#Relatorio do Mes de Fevereiro
  pdf.text 'Orçamento de Fevereiro', size: 14, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 14, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule
  if @orcamento_list.blank?
  pdf.move_down 220
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20
 dados = @orcamento_list.map do |f|
[ 
  f.conta.nome, 
  f.conta.tipo == 'Receita' ? valor(f.fevereiro) : '-',
  f.conta.tipo == 'Despesa' ? valor(f.fevereiro) : '-',
]
 end

totalreceita = "#{valor(@receitasgrupos.sum(:fevereiro))}" 
totaldespesa = "#{valor(@despesasgrupos.sum(:fevereiro))}"


headers = ["Conta","Receita","Despesa"]
headers_rodape = ["Total ==>",
            "#{valor(@receitasgrupos.sum(:fevereiro))}",
            "#{valor(@despesasgrupos.sum(:fevereiro))}"
              ]
 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 525, row_colors: ["FFFFFF","FFFFCC"]) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end

 pdf.move_down 25
pdf.text "RECEITAS - DESPESAS: #{saldo(:fevereiro)}", size: 10, :style => :bold
pdf.move_down 10
pdf.text "RECEITAS: " + totalreceita, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (ROF): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:fevereiro))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (ROV): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:fevereiro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (RNOF):#{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:fevereiro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (RNOV): #{valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:fevereiro))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:fevereiro))}", size: 10
pdf.move_down 15
pdf.text "DESPESAS: " + totaldespesa, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (DOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:fevereiro))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (DOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:fevereiro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (DNOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:fevereiro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (DNOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:fevereiro))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:fevereiro))}", size: 10
pdf.move_down 5





#pula pagina
pdf.start_new_page
#Fim Relatorio do Mes de Fevereiro
#Relatorio do Mes de marco
 pdf.text 'Orçamento de Março', size: 14, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 14, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule
  if @orcamento_list.blank?
  pdf.move_down 220
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20
 dados = @orcamento_list.map do |f|
[ 
  f.conta.nome, 
  f.conta.tipo == 'Receita' ? valor(f.marco) : '-',
  f.conta.tipo == 'Despesa' ? valor(f.marco) : '-',

]
 end
totalreceita = "#{valor(@receitasgrupos.sum(:marco))}" 
totaldespesa = "#{valor(@despesasgrupos.sum(:marco))}"


headers = ["Conta","Receita","Despesa"]
headers_rodape = ["Total ==>",
            "#{valor(@receitasgrupos.sum(:marco))}",
            "#{valor(@despesasgrupos.sum(:marco))}"
              ]
 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 525, row_colors: ["FFFFFF","FFFFCC"]) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end

 pdf.move_down 25
pdf.text "RECEITAS - DESPESAS: #{saldo(:marco)}", size: 10, :style => :bold
pdf.move_down 10
pdf.text "RECEITAS: " + totalreceita, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (ROF): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:marco))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (ROV): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:marco))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (RNOF):#{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:marco))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (RNOV): #{valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:marco))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:marco))}", size: 10
pdf.move_down 15
pdf.text "DESPESAS: " + totaldespesa, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (DOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:marco))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (DOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:marco))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (DNOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:marco))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (DNOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:marco))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:marco))}", size: 10
pdf.move_down 5


pdf.start_new_page

#Fim Relatorio do Mes de marco
#Relatorio do Mes de abril

pdf.text 'Orçamento de Abril', size: 14, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 14, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule
  if @orcamento_list.blank?
  pdf.move_down 220
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20
 dados = @orcamento_list.map do |f|
[ 
  f.conta.nome, 
  f.conta.tipo == 'Receita' ? valor(f.abril) : '-',
  f.conta.tipo == 'Despesa' ? valor(f.abril) : '-',

]
 end
totalreceita = "#{valor(@receitasgrupos.sum(:abril))}" 
totaldespesa = "#{valor(@despesasgrupos.sum(:abril))}"

headers = ["Conta","Receita","Despesa"]
headers_rodape = ["Total ==>",
            "#{valor(@receitasgrupos.sum(:abril))}",
            "#{valor(@despesasgrupos.sum(:abril))}"
              ]
 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 525, row_colors: ["FFFFFF","FFFFCC"]) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end

pdf.move_down 25
pdf.text "RECEITAS - DESPESAS: #{saldo(:abril)}", size: 10, :style => :bold
pdf.move_down 10
pdf.text "RECEITAS: " + totalreceita, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (ROF): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:abril))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (ROV): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:abril))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (RNOF):#{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:abril))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (RNOV): #{valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:abril))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:abril))}", size: 10
pdf.move_down 15
pdf.text "DESPESAS: " + totaldespesa, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (DOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:abril))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (DOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:abril))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (DNOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:abril))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (DNOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:abril))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:abril))}", size: 10
pdf.move_down 5


pdf.start_new_page

#Fim Relatorio do Mes de abril
#Relatorio do Mes de maio

pdf.text 'Orçamento de Maio', size: 14, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 14, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule
  if @orcamento_list.blank?
  pdf.move_down 220
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20
 dados = @orcamento_list.map do |f|
[ 
  f.conta.nome, 
  f.conta.tipo == 'Receita' ? valor(f.maio) : '-',
  f.conta.tipo == 'Despesa' ? valor(f.maio) : '-',
]
 end
totalreceita = "#{valor(@receitasgrupos.sum(:maio))}" 
totaldespesa = "#{valor(@despesasgrupos.sum(:maio))}"

headers = ["Conta","Receita","Despesa"]
headers_rodape = ["Total ==>",
            "#{valor(@receitasgrupos.sum(:maio))}",
            "#{valor(@despesasgrupos.sum(:maio))}"
              ]
 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 525, row_colors: ["FFFFFF","FFFFCC"]) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end

pdf.move_down 25
pdf.text "RECEITAS - DESPESAS: #{saldo(:maio)}", size: 10, :style => :bold
pdf.move_down 10
pdf.text "RECEITAS: " + totalreceita, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (ROF): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:maio))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (ROV): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:maio))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (RNOF):#{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:maio))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (RNOV): #{valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:maio))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:maio))}", size: 10
pdf.move_down 15
pdf.text "DESPESAS: " + totaldespesa, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (DOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:maio))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (DOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:maio))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (DNOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:maio))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (DNOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:maio))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:maio))}", size: 10
pdf.move_down 5


pdf.start_new_page

#Fim Relatorio do Mes de maio
#Relatorio do Mes de junho

pdf.text 'Orçamento de Junho', size: 14, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 14, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule
  if @orcamento_list.blank?
  pdf.move_down 220
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20
 dados = @orcamento_list.map do |f|
[ 
  f.conta.nome, 
  f.conta.tipo == 'Receita' ? valor(f.junho) : '-',
  f.conta.tipo == 'Despesa' ? valor(f.junho) : '-',
]
 end
totalreceita = "#{valor(@receitasgrupos.sum(:junho))}" 
totaldespesa = "#{valor(@despesasgrupos.sum(:junho))}"

headers = ["Conta","Receita","Despesa"]
headers_rodape = ["Total ==>",
            "#{valor(@receitasgrupos.sum(:junho))}",
            "#{valor(@despesasgrupos.sum(:junho))}"
              ]
 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 525, row_colors: ["FFFFFF","FFFFCC"]) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end

pdf.move_down 25
pdf.text "RECEITAS - DESPESAS: #{saldo(:junho)}", size: 10, :style => :bold
pdf.move_down 10
pdf.text "RECEITAS: " + totalreceita, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (ROF): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:junho))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (ROV): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:junho))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (RNOF):#{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:junho))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (RNOV): #{valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:junho))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:junho))}", size: 10
pdf.move_down 15
pdf.text "DESPESAS: " + totaldespesa, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS VARIÁVEIS (DOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:junho))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (DNOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:junho))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (DNOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:junho))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:junho))}", size: 10
pdf.move_down 5
 
pdf.start_new_page

#Fim Relatorio do Mes de junho
#Relatorio do Mes de julho

pdf.text 'Orçamento de Julho', size: 14, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 14, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule
  if @orcamento_list.blank?
  pdf.move_down 220
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20
 dados = @orcamento_list.map do |f|
[ 
  f.conta.nome, 
  f.conta.tipo == 'Receita' ? valor(f.julho) : '-',
  f.conta.tipo == 'Despesa' ? valor(f.julho) : '-',
]
 end
totalreceita = "#{valor(@receitasgrupos.sum(:julho))}" 
totaldespesa = "#{valor(@despesasgrupos.sum(:julho))}"

headers = ["Conta","Receita","Despesa"]
headers_rodape = ["Total ==>",
            "#{valor(@receitasgrupos.sum(:julho))}",
            "#{valor(@despesasgrupos.sum(:julho))}"
              ]
 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 525, row_colors: ["FFFFFF","FFFFCC"]) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end

pdf.move_down 25
pdf.text "RECEITAS - DESPESAS: #{saldo(:julho)}", size: 10, :style => :bold
pdf.move_down 10
pdf.text "RECEITAS: " + totalreceita, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (ROF): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:julho))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (ROV): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:julho))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (RNOF):#{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:julho))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (RNOV): #{valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:julho))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:julho))}", size: 10
pdf.move_down 15
pdf.text "OBRIGATÓRIAS FIXAS (DOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:julho))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (DOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:julho))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (DNOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:julho))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (DNOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:julho))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:julho))}", size: 10
pdf.move_down 5

pdf.start_new_page

#Fim Relatorio do Mes de julho
#Relatorio do Mes de agosto

pdf.text 'Orçamento de Agosto', size: 14, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 14, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule
  if @orcamento_list.blank?
  pdf.move_down 220
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20
 dados = @orcamento_list.map do |f|
[ 
  f.conta.nome, 
  f.conta.tipo == 'Receita' ? valor(f.agosto) : '-',
  f.conta.tipo == 'Despesa' ? valor(f.agosto) : '-',
]
 end
totalreceita = "#{valor(@receitasgrupos.sum(:agosto))}" 
totaldespesa = "#{valor(@despesasgrupos.sum(:agosto))}"

headers = ["Conta","Receita","Despesa"]
headers_rodape = ["Total ==>",
            "#{valor(@receitasgrupos.sum(:agosto))}",
            "#{valor(@despesasgrupos.sum(:agosto))}"
              ]
 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 525, row_colors: ["FFFFFF","FFFFCC"]) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end

pdf.move_down 25
pdf.text "RECEITAS - DESPESAS: #{saldo(:agosto)}", size: 10, :style => :bold
pdf.move_down 10
pdf.text "RECEITAS: " + totalreceita, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (ROF): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:agosto))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (ROV): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:agosto))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (RNOF):#{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:agosto))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (RNOV): #{valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:agosto))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:agosto))}", size: 10
pdf.move_down 15
pdf.text "DESPESAS: " + totaldespesa, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (DOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:agosto))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (DOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:agosto))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (DNOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:agosto))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (DNOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:agosto))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:agosto))}", size: 10
pdf.move_down 5

pdf.start_new_page

#Fim Relatorio do Mes de agosto
#Relatorio do Mes de setembro

pdf.text 'Orçamento de Setembro', size: 14, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 14, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule
  if @orcamento_list.blank?
  pdf.move_down 220
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20
 dados = @orcamento_list.map do |f|
[ 
  f.conta.nome, 
  f.conta.tipo == 'Receita' ? valor(f.setembro) : '-',
  f.conta.tipo == 'Despesa' ? valor(f.setembro) : '-',
]
 end
totalreceita = "#{valor(@receitasgrupos.sum(:setembro))}" 
totaldespesa = "#{valor(@despesasgrupos.sum(:setembro))}"

headers = ["Conta","Receita","Despesa"]
headers_rodape = ["Total ==>",
            "#{valor(@receitasgrupos.sum(:setembro))}",
            "#{valor(@despesasgrupos.sum(:setembro))}"
              ]
 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 525, row_colors: ["FFFFFF","FFFFCC"]) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end

pdf.move_down 25
pdf.text "RECEITAS - DESPESAS: #{saldo(:setembro)}", size: 10, :style => :bold
pdf.move_down 10
pdf.text "RECEITAS: " + totalreceita, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (ROF): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:setembro))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (ROV): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:setembro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (RNOF):#{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:setembro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (RNOV): #{valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:setembro))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:setembro))}", size: 10
pdf.move_down 15
pdf.text "DESPESAS: " + totaldespesa, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (DOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:setembro))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (DOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:setembro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (DNOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:setembro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (DNOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:setembro))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:setembro))}", size: 10
pdf.move_down 5

pdf.start_new_page

#Fim Relatorio do Mes de setembo
#Relatorio do Mes de outubro

pdf.text 'Orçamento de Outubro', size: 14, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 14, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule
  if @orcamento_list.blank?
  pdf.move_down 220
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20
 dados = @orcamento_list.map do |f|
[ 
  f.conta.nome, 
  f.conta.tipo == 'Receita' ? valor(f.outubro) : '-',
  f.conta.tipo == 'Despesa' ? valor(f.outubro) : '-',
]
 end
totalreceita = "#{valor(@receitasgrupos.sum(:outubro))}" 
totaldespesa = "#{valor(@despesasgrupos.sum(:outubro))}"

headers = ["Conta","Receita","Despesa"]
headers_rodape = ["Total ==>",
            "#{valor(@receitasgrupos.sum(:outubro))}",
            "#{valor(@despesasgrupos.sum(:outubro))}"
              ]
 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 525, row_colors: ["FFFFFF","FFFFCC"]) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end

pdf.move_down 25
pdf.text "RECEITAS - DESPESAS: #{saldo(:outubro)}", size: 10, :style => :bold
pdf.move_down 10
pdf.text "RECEITAS: " + totalreceita, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (ROF): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:outubro))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (ROV): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:outubro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (RNOF):#{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:outubro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (RNOV): #{valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:outubro))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:outubro))}", size: 10
pdf.move_down 15
pdf.text "DESPESAS: " + totaldespesa, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (DOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:outubro))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (DOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:outubro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (DNOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:outubro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (DNOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:outubro))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:outubro))}", size: 10
pdf.move_down 5


pdf.start_new_page

#Fim Relatorio do Mes de outubro
#Relatorio do Mes de novembro

pdf.text 'Orçamento de Novembro', size: 14, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 14, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule
  if @orcamento_list.blank?
  pdf.move_down 220
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20
 dados = @orcamento_list.map do |f|
[ 
  f.conta.nome, 
  f.conta.tipo == 'Receita' ? valor(f.novembro) : '-',
  f.conta.tipo == 'Despesa' ? valor(f.novembro) : '-',
]
 end
totalreceita = "#{valor(@receitasgrupos.sum(:novembro))}" 
totaldespesa = "#{valor(@despesasgrupos.sum(:novembro))}"

headers = ["Conta","Receita","Despesa"]
headers_rodape = ["Total ==>",
            "#{valor(@receitasgrupos.sum(:novembro))}",
            "#{valor(@despesasgrupos.sum(:novembro))}"
              ]
 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 525, row_colors: ["FFFFFF","FFFFCC"]) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end

pdf.move_down 25
pdf.text "RECEITAS - DESPESAS: #{saldo(:novembro)}", size: 10, :style => :bold
pdf.move_down 10
pdf.text "RECEITAS: " + totalreceita, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (ROF): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:novembro))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (ROV): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:novembro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (RNOF):#{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:novembro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (RNOV): #{valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:novembro))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:novembro))}", size: 10
pdf.move_down 15
pdf.text "DESPESAS: " + totaldespesa, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (DOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:novembro))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (DOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:novembro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (DNOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:novembro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (DNOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:novembro))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:novembro))}", size: 10
pdf.move_down 5

pdf.start_new_page

#Fim Relatorio do Mes de novembro
#Relatorio do Mes de dezembro

pdf.text 'Orçamento de Dezembro', size: 14, :style => :bold, :align => :center 
  pdf.text "#{@anos_atual[0].ano}", size: 14, :style => :bold, :align => :center
  pdf.stroke_horizontal_rule
  if @orcamento_list.blank?
  pdf.move_down 220
  pdf.text 'SEM REGISTROS', size: 30, :style => :bold, :align => :center 
  else
  pdf.move_down 20
 dados = @orcamento_list.map do |f|
[ 
  f.conta.nome, 
  f.conta.tipo == 'Receita' ? valor(f.dezembro) : '-',
  f.conta.tipo == 'Despesa' ? valor(f.dezembro) : '-',
]
 end
totalreceita = "#{valor(@receitasgrupos.sum(:dezembro))}" 
totaldespesa = "#{valor(@despesasgrupos.sum(:dezembro))}"

headers = ["Conta","Receita","Despesa"]
headers_rodape = ["Total ==>",
            "#{valor(@receitasgrupos.sum(:dezembro))}",
            "#{valor(@despesasgrupos.sum(:dezembro))}"
              ]
 pdf.table([headers] + (dados)+ [headers_rodape], header: true, cell_style: {size: 10 , align: :center}, width: 525, row_colors: ["FFFFFF","FFFFCC"]) do
 style row(0), background_color: "DDDDDD", font_style: :bold, align: :center, size: 8
end
  end

pdf.move_down 25
pdf.text "RECEITAS - DESPESAS: #{saldo(:dezembro)}", size: 10, :style => :bold
pdf.move_down 10
pdf.text "RECEITAS: " + totalreceita, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (ROF): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:dezembro))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (ROV): #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:dezembro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (RNOF):#{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:dezembro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (RNOV): #{valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:dezembro))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@receitasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:dezembro))}", size: 10
pdf.move_down 15
pdf.text "DESPESAS: " + totaldespesa, :style => :bold
pdf.move_down 3
pdf.text "OBRIGATÓRIAS FIXAS (DOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [0]}).sum(:dezembro))}", size: 10
pdf.move_down 2
pdf.text "OBRIGATÓRIAS VARIÁVEIS (DOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [1]}).sum(:dezembro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS FIXAS (DNOF): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [2]}).sum(:dezembro))}", size: 10
pdf.move_down 2
pdf.text "NÃO OBRIGATÓRIAS VARIÁVEIS (DNOV): #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [3]}).sum(:dezembro))}", size: 10
pdf.move_down 2
pdf.text "EXTRAS: #{ valor(@despesasgrupos.joins(:conta).where(contas: {ctipo: [4]}).sum(:dezembro))}", size: 10
pdf.move_down 5

  #Roda pé
 pdf.number_pages "Gerado por: #{current_user.email} em #{(Time.now).strftime("%d/%m/%y às %H:%M")} - Página <page> de <total> ", 
        :start_count_at => 0, 
        :page_filter => :all, 
        :at => [pdf.bounds.left - 0, -5], 
        :align => :center, 
        :size => 8
end