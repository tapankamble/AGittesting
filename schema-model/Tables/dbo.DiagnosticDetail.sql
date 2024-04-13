CREATE TABLE [dbo].[DiagnosticDetail]
(
[DiagnosticReportId] [bigint] NOT NULL,
[DiagnosticCode] [int] NOT NULL,
[DiagnosticValue] [int] NOT NULL,
[IsOutOfBounds] [bit] NOT NULL,
[DiagnosticString] [nvarchar] (255) NULL
)
GO
