import csv

def format_string(value):
  return 'NULL' if value == 'NULL' else f"'{value}'"

def executar(cursor):
  print('Iniciando o ETL para a tabela posicao_financeira')

  cursor.execute('select count(0) from posicao_financeira')
  (posicao_financeira_count,) = cursor.fetchone()
  if posicao_financeira_count > 0:
    print('Pulando pois a tabela posicao_financeira já está populada')
    return

  with open('02 - Dados contidos nas tabelas/Dados_Tabela_PosicaoFinanceira.csv') as csv_file:
      csv_reader = csv.reader(csv_file, delimiter=';')
      line_count = 0
      inserts = []
      for row in csv_reader:
        is_header = line_count == 0
        line_count += 1
        
        if is_header:
          continue

        Obra = row[0]
        Bloco = row[1]
        Unidade = row[2]
        Empresa = row[3]
        SituacaoUnidade = row[4]
        DataVenda = row[5]
        ValorVenda = row[6]
        DataLiberacaoChaves = row[7]
        FormaPagamento = row[8]
        FaseIncorporacao = row[9]
        DataCessao = row[10]
        DataDesembolso = row[11]
        DataEntregaInicial = row[12]
        DataHabiteSe = row[13]
        StatusDistrato = row[14]
        DataChaves = row[15]
        IndicePreChaves = row[16]
        IndicePosChaves = row[17]
        DebitoAutomatico = row[18]
        SaldoDevedor = row[19]
        DiasAtraso = row[20]
        ValorAtraso = row[21]
        TotalAtraso = row[22]
        CRM_ProcessamentoPendente = row[23]
        CRM_Operacao = row[24]
        CRM_PosicaoFinanceiraId = row[25]
        CreatedOn = row[26]
        ModifiedOn = row[27]
        DataPrevisaoEntrega = row[28]
        ValorPago = row[29]
        ValorPagoAtualizado = row[30]
        TipoPagamento = row[31]
        DataQuitacao = row[32]
        ValorQuitacao = row[33]
        LR_TipoContrato = row[34]
        LR_Saldo = row[35]
        LR_DataVencimento = row[36]
        LR_Codigo = row[37]
        LR_DataRenegociacao = row[38]
        PCVF_SaldoDevedor = row[39]
        PCVF_TotalAtraso = row[40]
        PCVU_SaldoDevedor = row[41]
        PCVU_TotalAtraso = row[42]
        PCVP_SaldoDevedor = row[43]
        PCVP_TotalAtraso = row[44]
        DEC_SaldoDevedor = row[45]
        DEC_TotalAtraso = row[46]
        MOD_SaldoDevedor = row[47]
        MOD_TotalAtraso = row[48]
        LIG_SaldoDevedor = row[49]
        LIG_TotalAtraso = row[50]
        TCS_SaldoDevedor = row[51]
        TCS_TotalAtraso = row[52]
        LOT_SaldoDevedor = row[53]
        LOT_TotalAtraso = row[54]
        CRM_ProcessamentoPendenteRepasse = row[55]
        ValorTotalReceberObras = row[56]
        ValorParcelaChaves = row[57]
        ValorTotalPosObra = row[58]
        DataUltimaPrestacaoPaga = row[59]
        DataUltimaAlteracao = row[60]

        inserts.append(f"""
          insert into posicao_financeira (Obra,Bloco,Unidade,Empresa,SituacaoUnidade,DataVenda,ValorVenda,DataLiberacaoChaves,FormaPagamento,FaseIncorporacao,DataCessao,DataDesembolso,DataEntregaInicial,DataHabiteSe,StatusDistrato,DataChaves,IndicePreChaves,IndicePosChaves,DebitoAutomatico,SaldoDevedor,DiasAtraso,ValorAtraso,TotalAtraso,CRM_ProcessamentoPendente,CRM_Operacao,CRM_PosicaoFinanceiraId,CreatedOn,ModifiedOn,DataPrevisaoEntrega,ValorPago,ValorPagoAtualizado,TipoPagamento,DataQuitacao,ValorQuitacao,LR_TipoContrato,LR_Saldo,LR_DataVencimento,LR_Codigo,LR_DataRenegociacao,PCVF_SaldoDevedor,PCVF_TotalAtraso,PCVU_SaldoDevedor,PCVU_TotalAtraso,PCVP_SaldoDevedor,PCVP_TotalAtraso,DEC_SaldoDevedor,DEC_TotalAtraso,MOD_SaldoDevedor,MOD_TotalAtraso,LIG_SaldoDevedor,LIG_TotalAtraso,TCS_SaldoDevedor,TCS_TotalAtraso,LOT_SaldoDevedor,LOT_TotalAtraso,CRM_ProcessamentoPendenteRepasse,ValorTotalReceberObras,ValorParcelaChaves,ValorTotalPosObra,DataUltimaPrestacaoPaga,DataUltimaAlteracao)
          values ({format_string(Obra)},
                  {format_string(Bloco)},
                  {format_string(Unidade)},
                  {format_string(Empresa)},
                  {format_string(SituacaoUnidade)},
                  {format_string(DataVenda)},
                  {ValorVenda},
                  {format_string(DataLiberacaoChaves)},
                  {FormaPagamento},
                  {format_string(FaseIncorporacao)},
                  {format_string(DataCessao)},
                  {format_string(DataDesembolso)},
                  {format_string(DataEntregaInicial)},
                  {format_string(DataHabiteSe)},
                  {format_string(StatusDistrato)},
                  {format_string(DataChaves)},
                  {format_string(IndicePreChaves)},
                  {format_string(IndicePosChaves)},
                  {format_string(DebitoAutomatico)},
                  {SaldoDevedor},
                  {DiasAtraso},
                  {ValorAtraso},
                  {TotalAtraso},
                  {format_string(CRM_ProcessamentoPendente)},
                  {format_string(CRM_Operacao)},
                  {format_string(CRM_PosicaoFinanceiraId)},
                  {format_string(CreatedOn)},
                  {format_string(ModifiedOn)},
                  {format_string(DataPrevisaoEntrega)},
                  {format_string(ValorPago)},
                  {format_string(ValorPagoAtualizado)},
                  {format_string(TipoPagamento)},
                  {format_string(DataQuitacao)},
                  {format_string(ValorQuitacao)},
                  {format_string(LR_TipoContrato)},
                  {format_string(LR_Saldo)},
                  {format_string(LR_DataVencimento)},
                  {format_string(LR_Codigo)},
                  {format_string(LR_DataRenegociacao)},
                  {PCVF_SaldoDevedor},
                  {PCVF_TotalAtraso},
                  {PCVU_SaldoDevedor},
                  {PCVU_TotalAtraso},
                  {PCVP_SaldoDevedor},
                  {PCVP_TotalAtraso},
                  {DEC_SaldoDevedor},
                  {DEC_TotalAtraso},
                  {MOD_SaldoDevedor},
                  {MOD_TotalAtraso},
                  {LIG_SaldoDevedor},
                  {LIG_TotalAtraso},
                  {TCS_SaldoDevedor},
                  {TCS_TotalAtraso},
                  {LOT_SaldoDevedor},
                  {LOT_TotalAtraso},
                  {format_string(CRM_ProcessamentoPendenteRepasse)},
                  {ValorTotalReceberObras},
                  {ValorParcelaChaves},
                  {ValorTotalPosObra},
                  {format_string(DataUltimaPrestacaoPaga)},
                  {format_string(DataUltimaAlteracao)});""")

      cursor.execute(''.join(inserts))
      print(f'Finalizado o ETL para a tabela posicao_financeira.')