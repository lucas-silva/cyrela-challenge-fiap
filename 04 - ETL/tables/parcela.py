import csv

def executar(cursor):
  print('Iniciando o ETL para a tabela parcela')

  cursor.execute('select count(0) from parcela')
  (parcela_count,) = cursor.fetchone()
  if parcela_count > 0:
    print('Pulando pois a tabela parcela já está populada')
    return

  with open('02 - Dados contidos nas tabelas/Dados_Tabela_Parcelas.csv') as csv_file:
      csv_reader = csv.reader(csv_file, delimiter=';')
      line_count = 0
      inserts = []
      for row in csv_reader:
        is_header = line_count == 0
        line_count += 1
        
        if is_header:
          continue

        obra = row[0]
        bloco = row[1]
        unidade = row[2]
        id_contrato_vencimento = row[3]
        contrato = row[4]
        datavencimento = row[5]
        valorprestacao = row[6]
        principal = row[7]
        jurostp = row[8]
        variacoes = row[9]
        seguros = row[10]
        descontos = row[11]
        multa = row[12]
        jurosmora = row[13]
        prorataindice = row[14]
        proratacontrato = row[15]
        valorpresente = row[16]
        indicereajuste = row[17]
        situacaoparcela = row[18]
        boletojm = row[19]
        vencimentojm = row[20]
        periodicidade = row[21]
        tipocontrato = row[22]
        tipoemprestimo = row[23]
        tipobloqueio = row[24]
        crm_processamentopendente = row[25]
        crm_operacao = row[26]
        crm_parcelaid = row[27]
        createdon = row[28]
        modifiedon = row[29]
        geradopor = row[30]
        idreneg = row[31]
        datarenegociacao = row[32]
        valorabono = row[33]
        valoracrescimo = row[34]
        vlrabonomulta = row[35]
        vlrabonojuros = row[36]
        vlrabonoprorata = row[37]
        tx_juros = row[38]
        tx_encargos = row[39]
        motivorenegociacao = row[40]        
        
        
      inserts.append(f"""
        insert into parcela (obra,bloco,unidade,id_contrato_vencimento,contrato,datavencimento,valorprestacao,principal,jurostp,variacoes,seguros,descontos,multa,jurosmora,
        prorataindice,proratacontrato,valorpresente,indicereajuste,situacaoparcela,boletojm,vencimentojm,periodicidade,tipocontrato,tipoemprestimo,tipobloqueio,
        crm_processamentopendente,crm_operacao,crm_parcelaid,createdon,modifiedon,geradopor,idreneg,datarenegociacao,valorabono,valoracrescimo,vlrabonomulta,vlrabonojuros,
        vlrabonoprorata,tx_juros,tx_encargos,motivorenegociacao)
        values ('{obra}','{bloco}','{unidade}','{id_contrato_vencimento}','{contrato}','{datavencimento}',{valorprestacao},{principal},{jurostp},{variacoes},{seguros},
        {descontos},{multa},{jurosmora},{prorataindice},{proratacontrato},{valorpresente},'{indicereajuste}','{situacaoparcela}','{boletojm}','{vencimentojm}',
        '{periodicidade}','{tipocontrato}','{tipoemprestimo}','{tipobloqueio}','{crm_processamentopendente}','{crm_operacao}','{crm_parcelaid}','{createdon}','{modifiedon}',
        '{geradopor}',{idreneg},'{datarenegociacao}',{valorabono},{valoracrescimo},{vlrabonomulta},{vlrabonojuros},{vlrabonoprorata},{tx_juros},{tx_encargos},
        '{motivorenegociacao}');
      """)

      cursor.execute(''.join(inserts))
      print(f'Finalizado o ETL para a tabela parcela.')