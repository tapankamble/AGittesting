CREATE TABLE [dbo].[TemperatureDetail]
(
[TemperatureDetailId] [int] NOT NULL,
[TemperatureRecordId] [bigint] NOT NULL,
[TagId] [int] NOT NULL,
[AssocEntityId] [int] NULL,
[Temperature] [decimal] (4, 1) NOT NULL
)
GO
