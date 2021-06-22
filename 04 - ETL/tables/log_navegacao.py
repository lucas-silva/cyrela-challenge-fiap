import csv

def executar(cursor):
  print('Iniciando o ETL para a tabela log_navegacao')

  cursor.execute('select count(0) from log_navegacao')
  (log_navegacao_count,) = cursor.fetchone()
  if log_navegacao_count > 0:
    print('Pulando pois a tabela log_navegacao já está populada')
    return

  with open('02 - Dados contidos nas tabelas/Dados_Tabela_LogNavegacao.csv') as csv_file:
      csv_reader = csv.reader(csv_file, delimiter=';')
      line_count = 0
      inserts = []
      for row in csv_reader:
        is_header = line_count == 0
        line_count += 1
        
        if is_header:
          continue

        Id = row[0]
        Documentocliente = row[1]
        Dataevento = row[2]
        Tipoevento = row[3]
        Tipoacesso = row[4]
        Idatendente = row[5]
        Pagina = row[6]
        Atividade = row[7]
        Logerro = row[8]
        Origem = row[9]

        inserts.append(f"""
           insert into log_navegacao (Id,Documentocliente,Dataevento,Tipoevento,Tipoacesso,Idatendente,Pagina,Atividade,Logerro,Origem)
           values ({Id},'{Documentocliente}','{Dataevento}',{Tipoevento},{Tipoacesso},'{Idatendente}','{Pagina}','{Atividade}','{Logerro}',{Origem});
         """)

      cursor.execute(''.join(inserts))
      print(f'Finalizado o ETL para a tabela log_navegacao.')