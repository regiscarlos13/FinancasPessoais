@i = 5
for i in 1..@i
	Lancamento.create(tipo: 'Despesa', orcamento_id: 1, descricao: "Conta do Mês Julho", centro_id: 1, fornecedor_id: 1, valor: 1, data: Date.today, parcela: 2, user_id: 1)
end