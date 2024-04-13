CREATE TABLE [dbo].[DeviceDiagnosticReport]
(
[DiagnosticReportId] [bigint] NOT NULL,
[AssetId] [int] NULL,
[TrackId] [int] NOT NULL,
[EventTime] [int] NOT NULL,
[InstanceNumber] [smallint] NOT NULL
)
GO
