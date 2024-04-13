CREATE TABLE [dbo].[DurationViolation]
(
[AssetId] [int] NOT NULL,
[EventTime] [int] NOT NULL,
[InstanceNumber] [smallint] NOT NULL,
[EventCode] [smallint] NOT NULL,
[TagType] [tinyint] NULL,
[TagValue] [nchar] (30) NULL,
[Duration] [int] NOT NULL,
[MinDuration] [int] NULL,
[DurationThreshold] [tinyint] NULL
)
GO
