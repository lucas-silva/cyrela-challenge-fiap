create or replace view vw_controle_sessao
as
select 
	case when origem = 100000016 then 'App' else 'Site' end as origem,
	case 
		when tipoacesso = 1 then 'Cliente'
		when tipoacesso = 2 then 'Central de Atendimento'
		when tipoacesso = 3 then 'T.I'
 	end as perfil,
 	dataexpiracao - dataacesso as tempo_sessao,
 	dataacesso as data_acesso
from controle_sessao