CREATE TABLE [dbo].[OverSpeeding]
(
[AssetId] [int] NOT NULL,
[EventTime] [int] NOT NULL,
[InstanceNumber] [smallint] NOT NULL,
[EventCode] [smallint] NULL,
[MaxSpeed] [smallint] NULL,
[SpeedLimit] [smallint] NULL,
[Duration] [int] NULL
)
GO
