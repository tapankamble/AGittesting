CREATE TABLE [dbo].[ZoneVisitation]
(
[AssetId] [int] NOT NULL,
[ExitEventTime] [int] NOT NULL,
[ExitInstanceNumber] [smallint] NOT NULL,
[EntryEventTime] [int] NULL,
[EntryInstanceNumber] [smallint] NULL,
[ZoneRevisionId] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ZoneVisitation] ADD CONSTRAINT [PK__ZoneVisi__97D377FB696B3755] PRIMARY KEY CLUSTERED ([AssetId], [ExitEventTime], [ExitInstanceNumber])
GO
