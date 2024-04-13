CREATE TABLE [dbo].[CDC_BlackBoxEvent_SSIS_destination]
(
[AssetId] [int] NOT NULL,
[EventTime] [int] NOT NULL,
[InstanceNumber] [smallint] NOT NULL,
[EventCode] [smallint] NOT NULL,
[InputIsActive] [smallint] NOT NULL,
[OutputIsActive] [tinyint] NOT NULL,
[IsRoaming] [bit] NOT NULL,
[HighReportRateActive] [bit] NOT NULL,
[ExternalPowerIsConnected] [bit] NOT NULL,
[BatteryIsCharging] [bit] NOT NULL,
[IsTracking] [bit] NOT NULL,
[InTestReady] [bit] NOT NULL,
[GSMIsAvailable] [bit] NOT NULL,
[PositionIsAged] [bit] NOT NULL,
[PositionAge] [smallint] NOT NULL,
[ConfidenceDistance] [tinyint] NOT NULL,
[Latitude] [int] NOT NULL,
[Longitude] [int] NOT NULL,
[Altitude] [smallint] NOT NULL,
[Odometer] [int] NOT NULL,
[Speed] [smallint] NOT NULL,
[Heading] [smallint] NOT NULL,
[InternalBatteryVoltage] [tinyint] NOT NULL,
[ReceivedTime] [int] NOT NULL,
[DriverId] [int] NULL,
[Final_ID1] [nvarchar] (50) NOT NULL
)
GO
ALTER TABLE [dbo].[CDC_BlackBoxEvent_SSIS_destination] ADD CONSTRAINT [Final_ID1_CDC_pk] PRIMARY KEY CLUSTERED ([Final_ID1])
GO
