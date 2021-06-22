USE [Interface]
GO

/****** Object:  Table [dbo].[PosicaoFinanceira]    Script Date: 25/05/2021 14:03:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PosicaoFinanceira](
	[Obra] [char](4) NOT NULL,
	[Bloco] [char](2) NOT NULL,
	[Unidade] [char](6) NOT NULL,
	[Empresa] [char](4) NOT NULL,
	[SituacaoUnidade] [char](2) NOT NULL,
	[DataVenda] [datetime] NULL,
	[ValorVenda] [decimal](15, 2) NULL,
	[DataLiberacaoChaves] [datetime] NULL,
	[FormaPagamento] [int] NULL,
	[FaseIncorporacao] [char](3) NULL,
	[DataCessao] [datetime] NULL,
	[DataDesembolso] [datetime] NULL,
	[DataEntregaInicial] [datetime] NULL,
	[DataHabiteSe] [datetime] NULL,
	[StatusDistrato] [char](1) NULL,
	[DataChaves] [datetime] NULL,
	[IndicePreChaves] [nchar](10) NULL,
	[IndicePosChaves] [nchar](10) NULL,
	[DebitoAutomatico] [char](1) NULL,
	[SaldoDevedor] [decimal](18, 2) NOT NULL,
	[DiasAtraso] [int] NOT NULL,
	[ValorAtraso] [decimal](18, 2) NOT NULL,
	[TotalAtraso] [decimal](18, 2) NOT NULL,
	[CRM_ProcessamentoPendente] [bit] NOT NULL,
	[CRM_Operacao] [char](1) NOT NULL,
	[CRM_PosicaoFinanceiraId] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[DataPrevisaoEntrega] [datetime] NULL,
	[ValorPago] [decimal](13, 2) NULL,
	[ValorPagoAtualizado] [decimal](13, 2) NULL,
	[TipoPagamento] [char](3) NULL,
	[DataQuitacao] [datetime] NULL,
	[ValorQuitacao] [decimal](13, 2) NULL,
	[LR_TipoContrato] [char](3) NULL,
	[LR_Saldo] [decimal](13, 2) NULL,
	[LR_DataVencimento] [datetime] NULL,
	[LR_Codigo] [varchar](20) NULL,
	[LR_DataRenegociacao] [datetime] NULL,
	[PCVF_SaldoDevedor] [decimal](13, 2) NULL,
	[PCVF_TotalAtraso] [decimal](13, 2) NULL,
	[PCVU_SaldoDevedor] [decimal](13, 2) NULL,
	[PCVU_TotalAtraso] [decimal](13, 2) NULL,
	[PCVP_SaldoDevedor] [decimal](13, 2) NULL,
	[PCVP_TotalAtraso] [decimal](13, 2) NULL,
	[DEC_SaldoDevedor] [decimal](13, 2) NULL,
	[DEC_TotalAtraso] [decimal](13, 2) NULL,
	[MOD_SaldoDevedor] [decimal](13, 2) NULL,
	[MOD_TotalAtraso] [decimal](13, 2) NULL,
	[LIG_SaldoDevedor] [decimal](13, 2) NULL,
	[LIG_TotalAtraso] [decimal](13, 2) NULL,
	[TCS_SaldoDevedor] [decimal](13, 2) NULL,
	[TCS_TotalAtraso] [decimal](13, 2) NULL,
	[LOT_SaldoDevedor] [decimal](13, 2) NULL,
	[LOT_TotalAtraso] [decimal](13, 2) NULL,
	[CRM_ProcessamentoPendenteRepasse] [bit] NOT NULL,
	[ValorTotalReceberObras] [decimal](15, 2) NULL,
	[ValorParcelaChaves] [decimal](15, 2) NULL,
	[ValorTotalPosObra] [decimal](15, 2) NULL,
	[DataUltimaPrestacaoPaga] [datetime] NULL,
	[DataUltimaAlteracao] [datetime] NULL,
 CONSTRAINT [PK_PosicaoFinanceira] PRIMARY KEY CLUSTERED 
(
	[Obra] ASC,
	[Bloco] ASC,
	[Unidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PosicaoFinanceira] ADD  DEFAULT ((0)) FOR [CRM_ProcessamentoPendenteRepasse]
GO


