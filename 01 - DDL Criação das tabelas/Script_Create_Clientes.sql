USE [Interface]
GO

/****** Object:  Table [dbo].[Coobrigado]    Script Date: 24/05/2021 14:34:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Coobrigado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Obra] [char](4) NOT NULL,
	[Bloco] [char](2) NOT NULL,
	[Unidade] [char](6) NOT NULL,
	[Nome] [varchar](150) NOT NULL,
	[CPF_CNPJ] [varchar](20) NOT NULL,
	[PercentualParticipacao] [decimal](5, 2) NOT NULL,
	[Principal] [bit] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[Ativo] [bit] NULL,
	[CodClienteSap] [varchar](10) NULL,
 CONSTRAINT [PK_Coobrigado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Coobrigado]  WITH CHECK ADD  CONSTRAINT [FK_Coobrigado_PosicaoFinanceira] FOREIGN KEY([Obra], [Bloco], [Unidade])
REFERENCES [dbo].[PosicaoFinanceira] ([Obra], [Bloco], [Unidade])
GO

ALTER TABLE [dbo].[Coobrigado] CHECK CONSTRAINT [FK_Coobrigado_PosicaoFinanceira]
GO

