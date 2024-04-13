CREATE TABLE [dbo].[CDC_ZoneVisitation_destination]
(
[AssetId] [int] NOT NULL,
[ExitEventTime] [int] NOT NULL,
[ExitInstanceNumber] [smallint] NOT NULL,
[EntryEventTime] [int] NULL,
[EntryInstanceNumber] [smallint] NULL,
[ZoneRevisionId] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[CDC_ZoneVisitation_destination] ADD CONSTRAINT [PK__CDC_Zone__97D377FB6714B85E] PRIMARY KEY CLUSTERED ([AssetId], [ExitEventTime], [ExitInstanceNumber])
GO
