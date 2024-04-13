CREATE TABLE [dbo].[TemperatureRecord]
(
[TemperatureRecordId] [bigint] NOT NULL,
[AssetId] [int] NOT NULL,
[EventTime] [int] NOT NULL,
[InstanceNumber] [smallint] NOT NULL,
[EventCode] [smallint] NOT NULL,
[AlertType] [tinyint] NULL,
[TemperatureThreshold] [decimal] (4, 1) NULL
)
GO
