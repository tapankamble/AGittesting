CREATE TABLE [dbo].[EventNotification]
(
[AssetId] [int] NOT NULL,
[EventTime] [int] NOT NULL,
[InstanceNumber] [smallint] NOT NULL,
[AssetName] [nvarchar] (50) NOT NULL,
[AssetGroupName] [nvarchar] (50) NOT NULL,
[FleetId] [int] NOT NULL,
[EventCode] [smallint] NOT NULL,
[Severity] [tinyint] NOT NULL,
[Latitude] [int] NULL,
[Longitude] [int] NULL,
[InputIsActive] [smallint] NULL,
[HighReportRateActive] [bit] NULL,
[IsTracking] [bit] NULL,
[Speed] [smallint] NULL,
[Heading] [smallint] NULL,
[Odometer] [int] NULL,
[UserId] [int] NULL,
[UserName] [nvarchar] (50) NULL,
[IsClaimed] [bit] NOT NULL,
[IsResolved] [bit] NOT NULL,
[Comments] [nvarchar] (255) NULL,
[CreationTime] [smalldatetime] NOT NULL,
[ModificationTime] [smalldatetime] NOT NULL,
[AssocEntityName] [nvarchar] (50) NULL
)
GO
