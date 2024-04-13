CREATE TABLE [dbo].[Stg_CDC_ZoneVisitation_destination]
(
[AssetId] [int] NOT NULL,
[ExitEventTime] [int] NOT NULL,
[ExitInstanceNumber] [smallint] NOT NULL,
[EntryEventTime] [int] NULL,
[EntryInstanceNumber] [smallint] NULL,
[ZoneRevisionId] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[Stg_CDC_ZoneVisitation_destination] ADD CONSTRAINT [PK__Stg_CDC___97D377FB00E465D0] PRIMARY KEY CLUSTERED ([AssetId], [ExitEventTime], [ExitInstanceNumber])
GO
