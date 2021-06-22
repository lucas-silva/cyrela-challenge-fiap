import csv

def format_string(value):
  return 'NULL' if value == 'NULL' else f"'{value}'"

def executar(cursor):
  print('Iniciando o ETL para a tabela coobrigado')

  cursor.execute('select count(0) from coobrigado')
  (coobrigado_count,) = cursor.fetchone()
  if coobrigado_count > 0:
    print('Pulando pois a tabela coobrigado já está populada')
    return

  with open('02 - Dados contidos nas tabelas/Dados_Tabela_Clientes.csv') as csv_file:
      csv_reader = csv.reader(csv_file, delimiter=';')
      line_count = 0
      inserts = []
      for row in csv_reader:
        is_header = line_count == 0
        line_count += 1
        
        if is_header:
          continue

        Id = row[0]
        Obra = row[1]
        Bloco = row[2]
        Unidade = row[3]
        Nome = row[4]
        CPF_CNPJ = row[5]
        PercentualParticipacao = row[6]
        Principal = row[7]
        CreatedOn = row[8]
        ModifiedOn = row[9]
        Ativo = row[10]
        CodClienteSap = row[11]

        inserts.append(f"""
          insert into coobrigado (Id,Obra,Bloco,Unidade,Nome,CPF_CNPJ,PercentualParticipacao,Principal,CreatedOn,ModifiedOn,Ativo,CodClienteSap)
          values (
            {format_string(Id)},
            {format_string(Obra)},
            {format_string(Bloco)},
            {format_string(Unidade)},
            {format_string(Nome)},
            {format_string(CPF_CNPJ)},
            {PercentualParticipacao},
            {format_string(Principal)},
            {format_string(CreatedOn)},
            {format_string(ModifiedOn)},
            {format_string(Ativo)},
            {format_string(CodClienteSap)}
          );
        """)

      cursor.execute(''.join(inserts))
      print(f'Finalizado o ETL para a tabela coobrigado.')