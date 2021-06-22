import csv

def executar(cursor):
  print('Iniciando o ETL para a tabela controle_sessao')

  cursor.execute('select count(0) from controle_sessao')
  (controle_sessao_count,) = cursor.fetchone()
  if controle_sessao_count > 0:
    print('Pulando pois a tabela controle_sessao já está populada')
    return

  with open('02 - Dados contidos nas tabelas/Dados_Tabela_Controlesessao.csv') as csv_file:
      csv_reader = csv.reader(csv_file, delimiter=';')
      line_count = 0
      inserts = []
      for row in csv_reader:
        is_header = line_count == 0
        line_count += 1
        
        if is_header:
          continue

        Id = row[0]
        DataAcesso = row[1]
        Hash = row[2]
        DataExpiracao = row[3]
        Cliente = row[4]
        TipoAcesso = row[5]
        LoginAtendente = row[6]
        TipoSessao = row[7]
        Origem = row[8]
        
        inserts.append(f"""
          insert into controle_sessao (Id,DataAcesso,Hash,DataExpiracao,Cliente,TipoAcesso,LoginAtendente,TipoSessao,Origem)
          values ({Id},'{DataAcesso}','{Hash}','{DataExpiracao}','{Cliente}',{TipoAcesso},'{LoginAtendente}',{TipoSessao},{Origem});
        """)

      cursor.execute(''.join(inserts))
      print(f'Finalizado o ETL para a tabela controle_sessao.')