create or replace view vw_posicao_financeira
as
select
	o.empresa,
	o.empreendimento,
	o.uf,
	pf.obra,
	pf.bloco,
	pf.unidade,
  c.nome,
  c.cpf_cnpj,
	case
		when pf.situacaounidade = 'Q' then 'Quitada'
		when pf.situacaounidade = 'VD' then 'Vendida'
	end as situacao,
	pf.datavenda as data_venda,
	pf.datachaves as data_pegou_chaves,
	pf.dataquitacao as data_quitacao,
	pf.dataquitacao - pf.datavenda as tempo_ate_quitar,
	pf.valorvenda as valor,	
	case
		when pf.formapagamento = 0 then 'Quitação a Vista'
		when pf.formapagamento = 1 then 'Financiamento Bancário'
		when pf.formapagamento = 2 then 'Alienação Fiduciária'
		when pf.formapagamento = 3 then 'Securitização'
	end as forma_pagamento
from posicao_financeira pf 
inner join obra o on o.obra = pf.obra
left join coobrigado c on c.obra = pf.obra 
                          and c.bloco = pf.bloco 
                          and c.unidade = pf.unidade