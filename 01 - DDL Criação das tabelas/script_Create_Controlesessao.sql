USE [PortalCliente]
GO

/****** Object:  Table [dbo].[ControleSessao]    Script Date: 25/05/2021 14:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[ControleSessao](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DataAcesso] [datetime] NOT NULL,
	[Hash] [nvarchar](256) NOT NULL,
	[DataExpiracao] [datetime] NOT NULL,
	[Cliente] [varchar](18) NOT NULL,
	[TipoAcesso] [int] NOT NULL,
	[LoginAtendente] [varchar](100) NULL,
	[TipoSessao] [int] NULL,
	[Origem] [int] NULL,
 CONSTRAINT [Portal_PKControleSessao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ControleSessao] ADD  DEFAULT (getdate()) FOR [DataAcesso]
GO


