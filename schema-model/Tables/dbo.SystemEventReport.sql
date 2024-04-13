CREATE TABLE [dbo].[SystemEventReport]
(
[SystemEventReportId] [int] NOT NULL,
[EventTime] [smalldatetime] NOT NULL,
[AssetId] [int] NULL,
[EventCode] [smallint] NOT NULL,
[SystemEventXml] [xml] NOT NULL,
[DriverId] [int] NULL,
[TagValue] [nvarchar] (30) NULL
)
GO
