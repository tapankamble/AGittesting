CREATE TABLE [dbo].[Association]
(
[AssociationId] [int] NOT NULL,
[AssocEntityId] [int] NOT NULL,
[AssetId] [int] NOT NULL,
[StartEventTime] [int] NULL,
[StartInstanceNumber] [smallint] NULL,
[EndEventTime] [int] NULL,
[EndInstanceNumber] [smallint] NULL,
[DissociationTypeId] [tinyint] NULL
)
GO
