create or replace view vw_parcela
as
select
	vpf.empresa,
	vpf.empreendimento,
	vpf.uf,
	vpf.obra,
	vpf.bloco,
	vpf.unidade,
	vpf.nome,
	vpf.cpf_cnpj,
	p.datavencimento as data_vencimento,
	p.valorprestacao as valor_prestacao,
	p.multa,
	p.jurosmora as juros_mora,
	case 
		when p.situacaoparcela is null then 'Pendente'
		when p.situacaoparcela = 'AM' then 'Amortizado'
		when p.situacaoparcela = 'CM' then 'Com Multa'
		when p.situacaoparcela = 'PA' then 'Pago'
		when p.situacaoparcela = 'VR' then 'Valor Renogociado'
	end as situacao_parcela
from parcela p 
left join vw_posicao_financeira vpf on vpf.bloco = p.bloco and vpf.unidade = p.unidade