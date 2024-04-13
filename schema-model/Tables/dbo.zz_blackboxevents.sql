CREATE TABLE [dbo].[zz_blackboxevents]
(
[AssetId] [int] NULL,
[EventTime] [int] NULL,
[InstanceNumber] [smallint] NULL,
[EventCode] [smallint] NULL,
[InputIsActive] [smallint] NULL,
[OutputIsActive] [tinyint] NULL,
[IsRoaming] [bit] NULL,
[HighReportRateActive] [bit] NULL,
[ExternalPowerIsConnected] [bit] NULL,
[BatteryIsCharging] [bit] NULL,
[IsTracking] [bit] NULL,
[InTestReady] [bit] NULL,
[GSMIsAvailable] [bit] NULL,
[PositionIsAged] [bit] NULL,
[PositionAge] [smallint] NULL,
[ConfidenceDistance] [tinyint] NULL,
[Latitude] [int] NULL,
[Longitude] [int] NULL,
[Altitude] [smallint] NULL,
[Odometer] [int] NULL,
[Speed] [smallint] NULL,
[Heading] [smallint] NULL,
[InternalBatteryVoltage] [tinyint] NULL,
[ReceivedTime] [int] NULL,
[DriverId] [int] NULL
)
GO
