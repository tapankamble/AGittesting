CREATE TABLE [dbo].[audit_log]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[PackageName] [varchar] (200) NULL,
[TableName] [varchar] (200) NULL,
[RecordsInserted] [int] NULL,
[RecordsUpdated] [int] NULL,
[Dated] [datetime] NULL
)
GO
