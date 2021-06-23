CREATE TABLE controle_sessao (
	Id serial NOT NULL,
	DataAcesso timestamptz NOT NULL,
	Hash text NOT NULL,
	DataExpiracao timestamptz NOT NULL,
	Cliente text NOT NULL,
	TipoAcesso int NOT NULL,
	LoginAtendente text NULL,
	TipoSessao int NULL,
	Origem int NULL,
  CONSTRAINT controle_sessao_pkey PRIMARY KEY (Id)
)

CREATE TABLE log_navegacao (
	Id serial NOT NULL,
	DocumentoCliente text NOT NULL,
	DataEvento timestamptz NOT NULL,
	TipoEvento int NOT NULL,
	TipoAcesso int NOT NULL,
	IdAtendente uuid NULL,
	Pagina text NOT NULL,
	Atividade text NOT NULL,
	LogErro text NULL,
	Origem int NULL,
	CONSTRAINT log_navegacao_pkey PRIMARY KEY (Id)
)

CREATE TABLE posicao_financeira (
	Obra char(4) NOT NULL,
	Bloco char(2) NOT NULL,
	Unidade char(6) NOT NULL,
	Empresa char(4) NOT NULL,
	SituacaoUnidade char(2) NOT NULL,
	DataVenda timestamptz NULL,
	ValorVenda decimal(15, 2) NULL,
	DataLiberacaoChaves timestamptz NULL,
	FormaPagamento int NULL,
	FaseIncorporacao char(3) NULL,
	DataCessao timestamptz NULL,
	DataDesembolso timestamptz NULL,
	DataEntregaInicial timestamptz NULL,
	DataHabiteSe timestamptz NULL,
	StatusDistrato char(1) NULL,
	DataChaves timestamptz NULL,
	IndicePreChaves nchar(10) NULL,
	IndicePosChaves nchar(10) NULL,
	DebitoAutomatico char(1) NULL,
	SaldoDevedor decimal(18, 2) NOT NULL,
	DiasAtraso int NOT NULL,
	ValorAtraso decimal(18, 2) NOT NULL,
	TotalAtraso decimal(18, 2) NOT NULL,
	CRM_ProcessamentoPendente bit NOT NULL,
	CRM_Operacao char(1) NOT NULL,
	CRM_PosicaoFinanceiraId uuid NULL,
	CreatedOn timestamptz NOT NULL,
	ModifiedOn timestamptz NOT NULL,
	DataPrevisaoEntrega timestamptz NULL,
	ValorPago decimal(13, 2) NULL,
	ValorPagoAtualizado decimal(13, 2) NULL,
	TipoPagamento char(3) NULL,
	DataQuitacao timestamptz NULL,
	ValorQuitacao decimal(13, 2) NULL,
	LR_TipoContrato char(3) NULL,
	LR_Saldo decimal(13, 2) NULL,
	LR_DataVencimento timestamptz NULL,
	LR_Codigo text NULL,
	LR_DataRenegociacao timestamptz NULL,
	PCVF_SaldoDevedor decimal(13, 2) NULL,
	PCVF_TotalAtraso decimal(13, 2) NULL,
	PCVU_SaldoDevedor decimal(13, 2) NULL,
	PCVU_TotalAtraso decimal(13, 2) NULL,
	PCVP_SaldoDevedor decimal(13, 2) NULL,
	PCVP_TotalAtraso decimal(13, 2) NULL,
	DEC_SaldoDevedor decimal(13, 2) NULL,
	DEC_TotalAtraso decimal(13, 2) NULL,
	MOD_SaldoDevedor decimal(13, 2) NULL,
	MOD_TotalAtraso decimal(13, 2) NULL,
	LIG_SaldoDevedor decimal(13, 2) NULL,
	LIG_TotalAtraso decimal(13, 2) NULL,
	TCS_SaldoDevedor decimal(13, 2) NULL,
	TCS_TotalAtraso decimal(13, 2) NULL,
	LOT_SaldoDevedor decimal(13, 2) NULL,
	LOT_TotalAtraso decimal(13, 2) NULL,
	CRM_ProcessamentoPendenteRepasse bit NOT NULL,
	ValorTotalReceberobra decimal(15, 2) NULL,
	ValorParcelaChaves decimal(15, 2) NULL,
	ValorTotalPosObra decimal(15, 2) NULL,
	DataUltimaPrestacaoPaga timestamptz NULL,
	DataUltimaAlteracao timestamptz NULL,
	CONSTRAINT posicao_financeira_pkey PRIMARY KEY (Obra, Bloco, Unidade)
)

CREATE TABLE coobrigado (
	Id serial NOT NULL,
	Obra char(4) NOT NULL,
	Bloco char(2) NOT NULL,
	Unidade char(6) NOT NULL,
	Nome text NOT NULL,
	CPF_CNPJ text NOT NULL,
	PercentualParticipacao decimal(5, 2) NOT NULL,
	Principal bit NOT NULL,
	CreatedOn timestamptz NULL,
	ModifiedOn timestamptz NULL,
	Ativo bit NULL,
	CodClienteSap text NULL,
  	CONSTRAINT log_coobrigado_pkey PRIMARY KEY (Id)
)

CREATE TABLE parcela (
	Obra char(4) NOT NULL,
	Bloco char(2) NOT NULL,
	Unidade char(6) NOT NULL,
	Id_Contrato_Vencimento text NOT NULL,
	Contrato text NOT NULL,
	DataVencimento timestamptz NOT NULL,
	ValorPrestacao decimal(18, 2) NOT NULL,
	Principal decimal(18, 2) NULL,
	JurosTP decimal(18, 2) NULL,
	Variacoes decimal(18, 2) NULL,
	Seguros decimal(18, 2) NULL,
	Descontos decimal(18, 2) NULL,
	Multa decimal(18, 2) NULL,
	JurosMora decimal(18, 2) NULL,
	ProRataIndice decimal(18, 2) NULL,
	ProRataContrato decimal(18, 2) NULL,
	ValorPresente decimal(18, 2) NULL,
	IndiceReajuste nchar(10) NULL,
	SituacaoParcela nchar(10) NULL,
	BoletoJM char(1) NULL,
	VencimentoJM timestamptz NULL,
	Periodicidade text NULL,
	TipoContrato char(3) NULL,
	TipoEmprestimo char(3) NULL,
	TipoBloqueio char(6) NULL,
	CRM_ProcessamentoPendente bit NOT NULL,
	CRM_Operacao char(1) NOT NULL,
	CRM_ParcelaId uuid NULL,
	CreatedOn timestamptz NOT NULL,
	ModifiedOn timestamptz NOT NULL,
	GeradoPor text NULL,
	IDRENEG int NULL,
	DataRenegociacao timestamptz NULL,
	ValorAbono decimal(18, 2) NULL,
	ValorAcrescimo decimal(18, 2) NULL,
	VLRABONOMULTA decimal(18, 2) NULL,
	VLRABONOJUROS decimal(18, 2) NULL,
	VLRABONOPRORATA decimal(18, 2) NULL,
	TX_JUROS decimal(18, 2) NULL,
	TX_ENCARGOS decimal(18, 2) NULL,
	MotivoRenegociacao text NULL
)

create table obra (
	obra char(4),
	empreendimento text,
	uf char(2),
	empresa text
)

insert into obra (obra, empreendimento, uf, empresa) values ('6',   'SKY LIFE', 'GO', 'CYRELA');
insert into obra (obra, empreendimento, uf, empresa) values ('12',  'CAIOBAS', 'ES', 'CYRELA');
insert into obra (obra, empreendimento, uf, empresa) values ('22',  'SALVADOR SHOPPING BUSINESS', 'BA', 'CYRELA');
insert into obra (obra, empreendimento, uf, empresa) values ('57',  'TORRE NORTE SHOPPING', 'BH', 'CYRELA');
insert into obra (obra, empreendimento, uf, empresa) values ('67',  'SPLENDORE FAMILY CLUB', 'MG', 'CYRELA');
insert into obra (obra, empreendimento, uf, empresa) values ('76',  'CYRELA FOR YOU', 'SP', 'LIVING');
insert into obra (obra, empreendimento, uf, empresa) values ('91',  'YOU CLUBE RESIDENCIAL', 'SP', 'LIVING');
insert into obra (obra, empreendimento, uf, empresa) values ('95',  'ESSENCIAL ESCRITÓRIOS', 'ES', 'LIVING');
insert into obra (obra, empreendimento, uf, empresa) values ('135', 'MIRAI OFFICES - BELÉM', 'PA', 'LIVING');
insert into obra (obra, empreendimento, uf, empresa) values ('151', 'LIVE BANDEIRANTES ALL SUITES', 'RJ', 'LIVING');
insert into obra (obra, empreendimento, uf, empresa) values ('153', 'VITAMARE NEOVILLE FLORIANÓPOLIS', 'SC', 'LIVING');
insert into obra (obra, empreendimento, uf, empresa) values ('174', 'LE PARC BOA VIAGEM' , 'PE', 'VIVAZ');
insert into obra (obra, empreendimento, uf, empresa) values ('175', 'LIBER RESIDENCIAL CLUB', 'RJ', 'VIVAZ');
insert into obra (obra, empreendimento, uf, empresa) values ('176', 'MEDPLEX BELO HORIZONTE', 'BH', 'VIVAZ');
insert into obra (obra, empreendimento, uf, empresa) values ('177', 'LIVING EXCLUSIVE TUCURUVI', 'SP', 'VIVAZ'); 