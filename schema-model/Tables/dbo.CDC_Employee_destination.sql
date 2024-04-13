CREATE TABLE [dbo].[CDC_Employee_destination]
(
[BusinessEntityID] [int] NOT NULL,
[NationalIDNumber] [nvarchar] (15) NOT NULL,
[LoginID] [nvarchar] (256) NOT NULL,
[OrganizationNode] [sys].[hierarchyid] NULL,
[OrganizationLevel] AS ([OrganizationNode].[GetLevel]()),
[JobTitle] [nvarchar] (50) NOT NULL,
[BirthDate] [date] NOT NULL,
[MaritalStatus] [nchar] (1) NOT NULL,
[Gender] [nchar] (1) NOT NULL,
[HireDate] [date] NOT NULL,
[SalariedFlag] [dbo].[Flag] NOT NULL,
[VacationHours] [smallint] NOT NULL,
[SickLeaveHours] [smallint] NOT NULL,
[CurrentFlag] [dbo].[Flag] NOT NULL,
[rowguid] [uniqueidentifier] NOT NULL ROWGUIDCOL,
[ModifiedDate] [datetime] NOT NULL
)
GO
ALTER TABLE [dbo].[CDC_Employee_destination] ADD CONSTRAINT [PK_Employee_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID])
GO
