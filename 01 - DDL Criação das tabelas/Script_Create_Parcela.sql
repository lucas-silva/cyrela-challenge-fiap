USE [Interface]
GO

/****** Object:  Table [dbo].[Parcela]    Script Date: 24/05/2021 15:12:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Parcela](
	[Obra] [char](4) NOT NULL,
	[Bloco] [char](2) NOT NULL,
	[Unidade] [char](6) NOT NULL,
	[Id_Contrato_Vencimento] [varchar](50) NOT NULL,
	[Contrato] [varchar](20) NOT NULL,
	[DataVencimento] [datetime] NOT NULL,
	[ValorPrestacao] [decimal](18, 2) NOT NULL,
	[Principal] [decimal](18, 2) NULL,
	[JurosTP] [decimal](18, 2) NULL,
	[Variacoes] [decimal](18, 2) NULL,
	[Seguros] [decimal](18, 2) NULL,
	[Descontos] [decimal](18, 2) NULL,
	[Multa] [decimal](18, 2) NULL,
	[JurosMora] [decimal](18, 2) NULL,
	[ProRataIndice] [decimal](18, 2) NULL,
	[ProRataContrato] [decimal](18, 2) NULL,
	[ValorPresente] [decimal](18, 2) NULL,
	[IndiceReajuste] [nchar](10) NULL,
	[SituacaoParcela] [nchar](10) NULL,
	[BoletoJM] [char](1) NULL,
	[VencimentoJM] [datetime] NULL,
	[Periodicidade] [nvarchar](50) NULL,
	[TipoContrato] [char](3) NULL,
	[TipoEmprestimo] [char](3) NULL,
	[TipoBloqueio] [char](6) NULL,
	[CRM_ProcessamentoPendente] [bit] NOT NULL,
	[CRM_Operacao] [char](1) NOT NULL,
	[CRM_ParcelaId] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[GeradoPor] [varchar](80) NULL,
	[IDRENEG] [int] NULL,
	[DataRenegociacao] [datetime] NULL,
	[ValorAbono] [decimal](18, 2) NULL,
	[ValorAcrescimo] [decimal](18, 2) NULL,
	[VLRABONOMULTA] [decimal](18, 2) NULL,
	[VLRABONOJUROS] [decimal](18, 2) NULL,
	[VLRABONOPRORATA] [decimal](18, 2) NULL,
	[TX_JUROS] [decimal](18, 2) NULL,
	[TX_ENCARGOS] [decimal](18, 2) NULL,
	[MotivoRenegociacao] [varchar](200) NULL,
 CONSTRAINT [PK_Parcela] PRIMARY KEY CLUSTERED 
(
	[Id_Contrato_Vencimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Parcela]  WITH CHECK ADD  CONSTRAINT [FK_Parcela_PosicaoFinanceira] FOREIGN KEY([Obra], [Bloco], [Unidade])
REFERENCES [dbo].[PosicaoFinanceira] ([Obra], [Bloco], [Unidade])
GO

ALTER TABLE [dbo].[Parcela] CHECK CONSTRAINT [FK_Parcela_PosicaoFinanceira]
GO

