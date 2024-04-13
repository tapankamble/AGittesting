CREATE TABLE [dbo].[cdc_states_SystemEventReport]
(
[name] [nvarchar] (256) NOT NULL,
[state] [nvarchar] (256) NOT NULL
)
GO
CREATE UNIQUE NONCLUSTERED INDEX [cdc_states_name] ON [dbo].[cdc_states_SystemEventReport] ([name])
GO
