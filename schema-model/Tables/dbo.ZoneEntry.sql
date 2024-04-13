CREATE TABLE [dbo].[ZoneEntry]
(
[AssetId] [int] NOT NULL,
[EventTime] [int] NOT NULL,
[InstanceNumber] [smallint] NOT NULL,
[ZoneRevisionId] [int] NOT NULL,
[EventCode] [smallint] NULL,
[MaxSpeed] [smallint] NULL,
[SpeedLimit] [smallint] NULL,
[Duration] [int] NULL
)
GO
