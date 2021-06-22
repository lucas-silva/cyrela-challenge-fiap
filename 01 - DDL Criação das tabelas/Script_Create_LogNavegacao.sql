USE [PortalCliente]
GO

/****** Object:  Table [dbo].[log_navegacao]    Script Date: 24/05/2021 15:16:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[log_navegacao](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentoCliente] [varchar](18) NOT NULL,
	[DataEvento] [datetime2](7) NOT NULL,
	[TipoEvento] [int] NOT NULL,
	[TipoAcesso] [int] NOT NULL,
	[IdAtendente] [uniqueidentifier] NULL,
	[Pagina] [varchar](50) NOT NULL,
	[Atividade] [varchar](255) NOT NULL,
	[LogErro] [varchar](500) NULL,
	[Origem] [int] NULL
) ON [PRIMARY]
GO

