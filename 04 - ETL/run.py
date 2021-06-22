import psycopg2
import env
import tables.controle_sessao as controle_sessao
import tables.log_navegacao as log_navegacao
import tables.posicao_financeira as posicao_financeira
import tables.coobrigado as coobrigado
import tables.parcela as parcela

connection_string = f'host={env.PGHOST} port=5432 dbname={env.PGDATABASE} user={env.PGUSER} password={env.PGPASSWORD}'
connection = psycopg2.connect(connection_string)
cursor = connection.cursor()

print('Iniciando o ETL')

controle_sessao.executar(cursor)
log_navegacao.executar(cursor)
posicao_financeira.executar(cursor)
coobrigado.executar(cursor)
parcela.executar(cursor)

connection.commit()

print('Finalizando o ETL')