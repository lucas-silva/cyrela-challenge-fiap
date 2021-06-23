create or replace view vw_log_navegacao
as
select 
	case when origem = 100000016 then 'App' else 'Site' end as origem,
	dataevento as data_acesso,
  	case 
		when pagina = '1'  then 'Home'
		when pagina = '2'  then 'Dados Cadastrais'
		when pagina = '4'  then 'Conheca Portal'
		when pagina = '5'  then 'Andamento Obra'
		when pagina = '6'  then 'Benefícios Você'
		when pagina = '7'  then 'Documentos'
		when pagina = '8'  then 'Financeiro Extrato Financeiro'
		when pagina = '9'  then 'Financeiro Meus Boletos'
		when pagina = '10' then	'Financeiro Informe Rendimentos'
		when pagina = '11' then	'Financeiro Antecipacao'
		when pagina = '13' then	'Meu Imóvel'
		when pagina = '15' then	'Vistoria'
		when pagina = '16' then	'Fale Conosco'
		when pagina = '17' then	'Dúvidas Frequentes'
		when pagina = '18' then	'Glossário'
		when pagina = '19' then	'Assistência técnica'
	end as pagina,
	case 
		when tipoevento = '1' then 'Criação'
		when tipoevento = '3' then 'Atualização'
		when tipoevento = '4' then 'Exclusão'
		when tipoevento = '2' then 'Visualização'
	end as tipo_evento,
	case 
		when tipoacesso = 1 then 'Cliente'
		when tipoacesso = 2 then 'Central de Atendimento'
		when tipoacesso = 3 then 'T.I'
 	end as perfil,
	logerro as log_erro
from log_navegacao