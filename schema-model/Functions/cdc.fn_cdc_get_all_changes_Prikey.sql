SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	create function [cdc].[fn_cdc_get_all_changes_Prikey]
	(	@from_lsn binary(10),
		@to_lsn binary(10),
		@row_filter_option nvarchar(30)
	)
	returns table
	return
	
	select NULL as __$start_lsn,
		NULL as __$seqval,
		NULL as __$operation,
		NULL as __$update_mask, NULL as [AssetId], NULL as [EventTime], NULL as [InstanceNumber], NULL as [EventCode], NULL as [InputIsActive], NULL as [OutputIsActive], NULL as [IsRoaming], NULL as [HighReportRateActive], NULL as [ExternalPowerIsConnected], NULL as [BatteryIsCharging], NULL as [IsTracking], NULL as [InTestReady], NULL as [GSMIsAvailable], NULL as [PositionIsAged], NULL as [PositionAge], NULL as [ConfidenceDistance], NULL as [Latitude], NULL as [Longitude], NULL as [Altitude], NULL as [Odometer], NULL as [Speed], NULL as [Heading], NULL as [InternalBatteryVoltage], NULL as [ReceivedTime], NULL as [DriverId], NULL as [Final_ID1]
	where ( [sys].[fn_cdc_check_parameters]( N'Prikey', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 0) = 0)

	union all
	
	select t.__$start_lsn as __$start_lsn,
		t.__$seqval as __$seqval,
		t.__$operation as __$operation,
		t.__$update_mask as __$update_mask, t.[AssetId], t.[EventTime], t.[InstanceNumber], t.[EventCode], t.[InputIsActive], t.[OutputIsActive], t.[IsRoaming], t.[HighReportRateActive], t.[ExternalPowerIsConnected], t.[BatteryIsCharging], t.[IsTracking], t.[InTestReady], t.[GSMIsAvailable], t.[PositionIsAged], t.[PositionAge], t.[ConfidenceDistance], t.[Latitude], t.[Longitude], t.[Altitude], t.[Odometer], t.[Speed], t.[Heading], t.[InternalBatteryVoltage], t.[ReceivedTime], t.[DriverId], t.[Final_ID1]
	from [cdc].[Prikey_CT] t with (nolock)    
	where (lower(rtrim(ltrim(@row_filter_option))) = 'all')
	    and ( [sys].[fn_cdc_check_parameters]( N'Prikey', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 0) = 1)
		and (t.__$operation = 1 or t.__$operation = 2 or t.__$operation = 4)
		and (t.__$start_lsn <= @to_lsn)
		and (t.__$start_lsn >= @from_lsn)
		
	union all	
		
	select t.__$start_lsn as __$start_lsn,
		t.__$seqval as __$seqval,
		t.__$operation as __$operation,
		t.__$update_mask as __$update_mask, t.[AssetId], t.[EventTime], t.[InstanceNumber], t.[EventCode], t.[InputIsActive], t.[OutputIsActive], t.[IsRoaming], t.[HighReportRateActive], t.[ExternalPowerIsConnected], t.[BatteryIsCharging], t.[IsTracking], t.[InTestReady], t.[GSMIsAvailable], t.[PositionIsAged], t.[PositionAge], t.[ConfidenceDistance], t.[Latitude], t.[Longitude], t.[Altitude], t.[Odometer], t.[Speed], t.[Heading], t.[InternalBatteryVoltage], t.[ReceivedTime], t.[DriverId], t.[Final_ID1]
	from [cdc].[Prikey_CT] t with (nolock)     
	where (lower(rtrim(ltrim(@row_filter_option))) = 'all update old')
	    and ( [sys].[fn_cdc_check_parameters]( N'Prikey', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 0) = 1)
		and (t.__$operation = 1 or t.__$operation = 2 or t.__$operation = 4 or
		     t.__$operation = 3 )
		and (t.__$start_lsn <= @to_lsn)
		and (t.__$start_lsn >= @from_lsn)
	
GO
GRANT SELECT ON  [cdc].[fn_cdc_get_all_changes_Prikey] TO [cdc_Admin]
GO
