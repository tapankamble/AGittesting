CREATE TABLE [dbo].[config_table]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[TableName] [varchar] (200) NULL,
[LastUpdatedColumn] [varchar] (100) NULL,
[eventtime] [int] NULL
)
GO
