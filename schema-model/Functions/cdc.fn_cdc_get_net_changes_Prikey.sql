SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	create function [cdc].[fn_cdc_get_net_changes_Prikey]
	(	@from_lsn binary(10),
		@to_lsn binary(10),
		@row_filter_option nvarchar(30)
	)
	returns table
	return

	select NULL as __$start_lsn,
		NULL as __$operation,
		NULL as __$update_mask, NULL as [AssetId], NULL as [EventTime], NULL as [InstanceNumber], NULL as [EventCode], NULL as [InputIsActive], NULL as [OutputIsActive], NULL as [IsRoaming], NULL as [HighReportRateActive], NULL as [ExternalPowerIsConnected], NULL as [BatteryIsCharging], NULL as [IsTracking], NULL as [InTestReady], NULL as [GSMIsAvailable], NULL as [PositionIsAged], NULL as [PositionAge], NULL as [ConfidenceDistance], NULL as [Latitude], NULL as [Longitude], NULL as [Altitude], NULL as [Odometer], NULL as [Speed], NULL as [Heading], NULL as [InternalBatteryVoltage], NULL as [ReceivedTime], NULL as [DriverId], NULL as [Final_ID1]
	where ( [sys].[fn_cdc_check_parameters]( N'Prikey', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 1) = 0)

	union all
	
	select __$start_lsn,
	    case __$count_AEC33434
	    when 1 then __$operation
	    else
			case __$min_op_AEC33434 
				when 2 then 2
				when 4 then
				case __$operation
					when 1 then 1
					else 4
					end
				else
				case __$operation
					when 2 then 4
					when 4 then 4
					else 1
					end
			end
		end as __$operation,
		null as __$update_mask , [AssetId], [EventTime], [InstanceNumber], [EventCode], [InputIsActive], [OutputIsActive], [IsRoaming], [HighReportRateActive], [ExternalPowerIsConnected], [BatteryIsCharging], [IsTracking], [InTestReady], [GSMIsAvailable], [PositionIsAged], [PositionAge], [ConfidenceDistance], [Latitude], [Longitude], [Altitude], [Odometer], [Speed], [Heading], [InternalBatteryVoltage], [ReceivedTime], [DriverId], [Final_ID1]
	from
	(
		select t.__$start_lsn as __$start_lsn, __$operation,
		case __$count_AEC33434 
		when 1 then __$operation 
		else
		(	select top 1 c.__$operation
			from [cdc].[Prikey_CT] c with (nolock)   
			where  ( (c.[AssetId] = t.[AssetId]) and (c.[EventTime] = t.[EventTime])  and (c.[InstanceNumber] = t.[InstanceNumber])  )  
			and ((c.__$operation = 2) or (c.__$operation = 4) or (c.__$operation = 1))
			and (c.__$start_lsn <= @to_lsn)
			and (c.__$start_lsn >= @from_lsn)
			order by c.__$start_lsn, c.__$command_id, c.__$seqval) end __$min_op_AEC33434, __$count_AEC33434, t.[AssetId], t.[EventTime], t.[InstanceNumber], t.[EventCode], t.[InputIsActive], t.[OutputIsActive], t.[IsRoaming], t.[HighReportRateActive], t.[ExternalPowerIsConnected], t.[BatteryIsCharging], t.[IsTracking], t.[InTestReady], t.[GSMIsAvailable], t.[PositionIsAged], t.[PositionAge], t.[ConfidenceDistance], t.[Latitude], t.[Longitude], t.[Altitude], t.[Odometer], t.[Speed], t.[Heading], t.[InternalBatteryVoltage], t.[ReceivedTime], t.[DriverId], t.[Final_ID1] 
		from [cdc].[Prikey_CT] t with (nolock) inner join 
		(	select  r.[AssetId], r.[EventTime], r.[InstanceNumber],
		    count(*) as __$count_AEC33434 
			from [cdc].[Prikey_CT] r with (nolock)
			where  (r.__$start_lsn <= @to_lsn)
			and (r.__$start_lsn >= @from_lsn)
			group by   r.[AssetId], r.[EventTime], r.[InstanceNumber]) m
		on t.__$seqval = ( select top 1 c.__$seqval from [cdc].[Prikey_CT] c with (nolock) where  ( (c.[AssetId] = t.[AssetId]) and (c.[EventTime] = t.[EventTime])  and (c.[InstanceNumber] = t.[InstanceNumber])  )  and c.__$start_lsn <= @to_lsn and c.__$start_lsn >= @from_lsn order by c.__$start_lsn desc, c.__$command_id desc, c.__$seqval desc ) and
		    ( (t.[AssetId] = m.[AssetId]) and (t.[EventTime] = m.[EventTime])  and (t.[InstanceNumber] = m.[InstanceNumber])  ) 	
		where lower(rtrim(ltrim(@row_filter_option))) = N'all'
			and ( [sys].[fn_cdc_check_parameters]( N'Prikey', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 1) = 1)
			and (t.__$start_lsn <= @to_lsn)
			and (t.__$start_lsn >= @from_lsn)
			and ((t.__$operation = 2) or (t.__$operation = 4) or 
				 ((t.__$operation = 1) and
				  (2 not in 
				 		(	select top 1 c.__$operation
							from [cdc].[Prikey_CT] c with (nolock) 
							where  ( (c.[AssetId] = t.[AssetId]) and (c.[EventTime] = t.[EventTime])  and (c.[InstanceNumber] = t.[InstanceNumber])  )  
							and ((c.__$operation = 2) or (c.__$operation = 4) or (c.__$operation = 1))
							and (c.__$start_lsn <= @to_lsn)
							and (c.__$start_lsn >= @from_lsn)
							order by c.__$start_lsn, c.__$command_id, c.__$seqval
						 ) 
	 			   )
	 			 )
	 			) 
			and t.__$operation = (
				select
					max(mo.__$operation)
				from
					[cdc].[Prikey_CT] as mo with (nolock)
				where
					mo.__$seqval = t.__$seqval
					and 
					 ( (t.[AssetId] = mo.[AssetId]) and (t.[EventTime] = mo.[EventTime])  and (t.[InstanceNumber] = mo.[InstanceNumber])  ) 
				group by
					mo.__$seqval
			)	
	) Q
	
	union all
	
	select __$start_lsn,
	    case __$count_AEC33434
	    when 1 then __$operation
	    else
			case __$min_op_AEC33434 
				when 2 then 2
				when 4 then
				case __$operation
					when 1 then 1
					else 4
					end
				else
				case __$operation
					when 2 then 4
					when 4 then 4
					else 1
					end
			end
		end as __$operation,
		case __$count_AEC33434
		when 1 then
			case __$operation
			when 4 then __$update_mask
			else null
			end
		else	
			case __$min_op_AEC33434 
			when 2 then null
			else
				case __$operation
				when 1 then null
				else __$update_mask 
				end
			end	
		end as __$update_mask , [AssetId], [EventTime], [InstanceNumber], [EventCode], [InputIsActive], [OutputIsActive], [IsRoaming], [HighReportRateActive], [ExternalPowerIsConnected], [BatteryIsCharging], [IsTracking], [InTestReady], [GSMIsAvailable], [PositionIsAged], [PositionAge], [ConfidenceDistance], [Latitude], [Longitude], [Altitude], [Odometer], [Speed], [Heading], [InternalBatteryVoltage], [ReceivedTime], [DriverId], [Final_ID1]
	from
	(
		select t.__$start_lsn as __$start_lsn, __$operation,
		case __$count_AEC33434 
		when 1 then __$operation 
		else
		(	select top 1 c.__$operation
			from [cdc].[Prikey_CT] c with (nolock)
			where  ( (c.[AssetId] = t.[AssetId]) and (c.[EventTime] = t.[EventTime])  and (c.[InstanceNumber] = t.[InstanceNumber])  )  
			and ((c.__$operation = 2) or (c.__$operation = 4) or (c.__$operation = 1))
			and (c.__$start_lsn <= @to_lsn)
			and (c.__$start_lsn >= @from_lsn)
			order by c.__$start_lsn, c.__$command_id, c.__$seqval) end __$min_op_AEC33434, __$count_AEC33434, 
		m.__$update_mask , t.[AssetId], t.[EventTime], t.[InstanceNumber], t.[EventCode], t.[InputIsActive], t.[OutputIsActive], t.[IsRoaming], t.[HighReportRateActive], t.[ExternalPowerIsConnected], t.[BatteryIsCharging], t.[IsTracking], t.[InTestReady], t.[GSMIsAvailable], t.[PositionIsAged], t.[PositionAge], t.[ConfidenceDistance], t.[Latitude], t.[Longitude], t.[Altitude], t.[Odometer], t.[Speed], t.[Heading], t.[InternalBatteryVoltage], t.[ReceivedTime], t.[DriverId], t.[Final_ID1]
		from [cdc].[Prikey_CT] t with (nolock) inner join 
		(	select  r.[AssetId], r.[EventTime], r.[InstanceNumber],
		    count(*) as __$count_AEC33434, 
		    [sys].[ORMask](r.__$update_mask) as __$update_mask
			from [cdc].[Prikey_CT] r with (nolock)
			where  (r.__$start_lsn <= @to_lsn)
			and (r.__$start_lsn >= @from_lsn)
			group by   r.[AssetId], r.[EventTime], r.[InstanceNumber]) m
		on t.__$seqval = ( select top 1 c.__$seqval from [cdc].[Prikey_CT] c with (nolock) where  ( (c.[AssetId] = t.[AssetId]) and (c.[EventTime] = t.[EventTime])  and (c.[InstanceNumber] = t.[InstanceNumber])  )  and c.__$start_lsn <= @to_lsn and c.__$start_lsn >= @from_lsn order by c.__$start_lsn desc, c.__$command_id desc, c.__$seqval desc ) and
		    ( (t.[AssetId] = m.[AssetId]) and (t.[EventTime] = m.[EventTime])  and (t.[InstanceNumber] = m.[InstanceNumber])  ) 	
		where lower(rtrim(ltrim(@row_filter_option))) = N'all with mask'
			and ( [sys].[fn_cdc_check_parameters]( N'Prikey', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 1) = 1)
			and (t.__$start_lsn <= @to_lsn)
			and (t.__$start_lsn >= @from_lsn)
			and ((t.__$operation = 2) or (t.__$operation = 4) or 
				 ((t.__$operation = 1) and
				  (2 not in 
				 		(	select top 1 c.__$operation
							from [cdc].[Prikey_CT] c with (nolock)
							where  ( (c.[AssetId] = t.[AssetId]) and (c.[EventTime] = t.[EventTime])  and (c.[InstanceNumber] = t.[InstanceNumber])  )  
							and ((c.__$operation = 2) or (c.__$operation = 4) or (c.__$operation = 1))
							and (c.__$start_lsn <= @to_lsn)
							and (c.__$start_lsn >= @from_lsn)
							order by c.__$start_lsn, c.__$command_id, c.__$seqval
						 ) 
	 			   )
	 			 )
	 			) 
			and t.__$operation = (
				select
					max(mo.__$operation)
				from
					[cdc].[Prikey_CT] as mo with (nolock)
				where
					mo.__$seqval = t.__$seqval
					and 
					 ( (t.[AssetId] = mo.[AssetId]) and (t.[EventTime] = mo.[EventTime])  and (t.[InstanceNumber] = mo.[InstanceNumber])  ) 
				group by
					mo.__$seqval
			)	
	) Q
	
	union all
	
		select t.__$start_lsn as __$start_lsn,
		case t.__$operation
			when 1 then 1
			else 5
		end as __$operation,
		null as __$update_mask , t.[AssetId], t.[EventTime], t.[InstanceNumber], t.[EventCode], t.[InputIsActive], t.[OutputIsActive], t.[IsRoaming], t.[HighReportRateActive], t.[ExternalPowerIsConnected], t.[BatteryIsCharging], t.[IsTracking], t.[InTestReady], t.[GSMIsAvailable], t.[PositionIsAged], t.[PositionAge], t.[ConfidenceDistance], t.[Latitude], t.[Longitude], t.[Altitude], t.[Odometer], t.[Speed], t.[Heading], t.[InternalBatteryVoltage], t.[ReceivedTime], t.[DriverId], t.[Final_ID1]
		from [cdc].[Prikey_CT] t  with (nolock)
		where lower(rtrim(ltrim(@row_filter_option))) = N'all with merge'
			and ( [sys].[fn_cdc_check_parameters]( N'Prikey', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 1) = 1)
			and (t.__$start_lsn <= @to_lsn)
			and (t.__$start_lsn >= @from_lsn)
			and (t.__$seqval = ( select top 1 c.__$seqval from [cdc].[Prikey_CT] c with (nolock) where  ( (c.[AssetId] = t.[AssetId]) and (c.[EventTime] = t.[EventTime])  and (c.[InstanceNumber] = t.[InstanceNumber])  )  and c.__$start_lsn <= @to_lsn and c.__$start_lsn >= @from_lsn order by c.__$start_lsn desc, c.__$command_id desc, c.__$seqval desc ))
			and ((t.__$operation = 2) or (t.__$operation = 4) or 
				 ((t.__$operation = 1) and 
				   (2 not in 
				 		(	select top 1 c.__$operation
							from [cdc].[Prikey_CT] c with (nolock)
							where  ( (c.[AssetId] = t.[AssetId]) and (c.[EventTime] = t.[EventTime])  and (c.[InstanceNumber] = t.[InstanceNumber])  )  
							and ((c.__$operation = 2) or (c.__$operation = 4) or (c.__$operation = 1))
							and (c.__$start_lsn <= @to_lsn)
							and (c.__$start_lsn >= @from_lsn)
							order by c.__$start_lsn, c.__$command_id, c.__$seqval
						 ) 
	 				)
	 			 )
	 			)
			and t.__$operation = (
				select
					max(mo.__$operation)
				from
					[cdc].[Prikey_CT] as mo with (nolock)
				where
					mo.__$seqval = t.__$seqval
					and 
					 ( (t.[AssetId] = mo.[AssetId]) and (t.[EventTime] = mo.[EventTime])  and (t.[InstanceNumber] = mo.[InstanceNumber])  ) 
				group by
					mo.__$seqval
			)
	 
GO
GRANT SELECT ON  [cdc].[fn_cdc_get_net_changes_Prikey] TO [cdc_Admin]
GO
