SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	create function [cdc].[fn_cdc_get_net_changes_ZoneVisitation]
	(	@from_lsn binary(10),
		@to_lsn binary(10),
		@row_filter_option nvarchar(30)
	)
	returns table
	return

	select NULL as __$start_lsn,
		NULL as __$operation,
		NULL as __$update_mask, NULL as [AssetId], NULL as [ExitEventTime], NULL as [ExitInstanceNumber], NULL as [EntryEventTime], NULL as [EntryInstanceNumber], NULL as [ZoneRevisionId]
	where ( [sys].[fn_cdc_check_parameters]( N'ZoneVisitation', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 1) = 0)

	union all
	
	select __$start_lsn,
	    case __$count_41B5ADFE
	    when 1 then __$operation
	    else
			case __$min_op_41B5ADFE 
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
		null as __$update_mask , [AssetId], [ExitEventTime], [ExitInstanceNumber], [EntryEventTime], [EntryInstanceNumber], [ZoneRevisionId]
	from
	(
		select t.__$start_lsn as __$start_lsn, __$operation,
		case __$count_41B5ADFE 
		when 1 then __$operation 
		else
		(	select top 1 c.__$operation
			from [cdc].[ZoneVisitation_CT] c with (nolock)   
			where  ( (c.[AssetId] = t.[AssetId]) and (c.[ExitEventTime] = t.[ExitEventTime])  and (c.[ExitInstanceNumber] = t.[ExitInstanceNumber])  )  
			and ((c.__$operation = 2) or (c.__$operation = 4) or (c.__$operation = 1))
			and (c.__$start_lsn <= @to_lsn)
			and (c.__$start_lsn >= @from_lsn)
			order by c.__$start_lsn, c.__$command_id, c.__$seqval) end __$min_op_41B5ADFE, __$count_41B5ADFE, t.[AssetId], t.[ExitEventTime], t.[ExitInstanceNumber], t.[EntryEventTime], t.[EntryInstanceNumber], t.[ZoneRevisionId] 
		from [cdc].[ZoneVisitation_CT] t with (nolock) inner join 
		(	select  r.[AssetId], r.[ExitEventTime], r.[ExitInstanceNumber],
		    count(*) as __$count_41B5ADFE 
			from [cdc].[ZoneVisitation_CT] r with (nolock)
			where  (r.__$start_lsn <= @to_lsn)
			and (r.__$start_lsn >= @from_lsn)
			group by   r.[AssetId], r.[ExitEventTime], r.[ExitInstanceNumber]) m
		on t.__$seqval = ( select top 1 c.__$seqval from [cdc].[ZoneVisitation_CT] c with (nolock) where  ( (c.[AssetId] = t.[AssetId]) and (c.[ExitEventTime] = t.[ExitEventTime])  and (c.[ExitInstanceNumber] = t.[ExitInstanceNumber])  )  and c.__$start_lsn <= @to_lsn and c.__$start_lsn >= @from_lsn order by c.__$start_lsn desc, c.__$command_id desc, c.__$seqval desc ) and
		    ( (t.[AssetId] = m.[AssetId]) and (t.[ExitEventTime] = m.[ExitEventTime])  and (t.[ExitInstanceNumber] = m.[ExitInstanceNumber])  ) 	
		where lower(rtrim(ltrim(@row_filter_option))) = N'all'
			and ( [sys].[fn_cdc_check_parameters]( N'ZoneVisitation', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 1) = 1)
			and (t.__$start_lsn <= @to_lsn)
			and (t.__$start_lsn >= @from_lsn)
			and ((t.__$operation = 2) or (t.__$operation = 4) or 
				 ((t.__$operation = 1) and
				  (2 not in 
				 		(	select top 1 c.__$operation
							from [cdc].[ZoneVisitation_CT] c with (nolock) 
							where  ( (c.[AssetId] = t.[AssetId]) and (c.[ExitEventTime] = t.[ExitEventTime])  and (c.[ExitInstanceNumber] = t.[ExitInstanceNumber])  )  
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
					[cdc].[ZoneVisitation_CT] as mo with (nolock)
				where
					mo.__$seqval = t.__$seqval
					and 
					 ( (t.[AssetId] = mo.[AssetId]) and (t.[ExitEventTime] = mo.[ExitEventTime])  and (t.[ExitInstanceNumber] = mo.[ExitInstanceNumber])  ) 
				group by
					mo.__$seqval
			)	
	) Q
	
	union all
	
	select __$start_lsn,
	    case __$count_41B5ADFE
	    when 1 then __$operation
	    else
			case __$min_op_41B5ADFE 
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
		case __$count_41B5ADFE
		when 1 then
			case __$operation
			when 4 then __$update_mask
			else null
			end
		else	
			case __$min_op_41B5ADFE 
			when 2 then null
			else
				case __$operation
				when 1 then null
				else __$update_mask 
				end
			end	
		end as __$update_mask , [AssetId], [ExitEventTime], [ExitInstanceNumber], [EntryEventTime], [EntryInstanceNumber], [ZoneRevisionId]
	from
	(
		select t.__$start_lsn as __$start_lsn, __$operation,
		case __$count_41B5ADFE 
		when 1 then __$operation 
		else
		(	select top 1 c.__$operation
			from [cdc].[ZoneVisitation_CT] c with (nolock)
			where  ( (c.[AssetId] = t.[AssetId]) and (c.[ExitEventTime] = t.[ExitEventTime])  and (c.[ExitInstanceNumber] = t.[ExitInstanceNumber])  )  
			and ((c.__$operation = 2) or (c.__$operation = 4) or (c.__$operation = 1))
			and (c.__$start_lsn <= @to_lsn)
			and (c.__$start_lsn >= @from_lsn)
			order by c.__$start_lsn, c.__$command_id, c.__$seqval) end __$min_op_41B5ADFE, __$count_41B5ADFE, 
		m.__$update_mask , t.[AssetId], t.[ExitEventTime], t.[ExitInstanceNumber], t.[EntryEventTime], t.[EntryInstanceNumber], t.[ZoneRevisionId]
		from [cdc].[ZoneVisitation_CT] t with (nolock) inner join 
		(	select  r.[AssetId], r.[ExitEventTime], r.[ExitInstanceNumber],
		    count(*) as __$count_41B5ADFE, 
		    [sys].[ORMask](r.__$update_mask) as __$update_mask
			from [cdc].[ZoneVisitation_CT] r with (nolock)
			where  (r.__$start_lsn <= @to_lsn)
			and (r.__$start_lsn >= @from_lsn)
			group by   r.[AssetId], r.[ExitEventTime], r.[ExitInstanceNumber]) m
		on t.__$seqval = ( select top 1 c.__$seqval from [cdc].[ZoneVisitation_CT] c with (nolock) where  ( (c.[AssetId] = t.[AssetId]) and (c.[ExitEventTime] = t.[ExitEventTime])  and (c.[ExitInstanceNumber] = t.[ExitInstanceNumber])  )  and c.__$start_lsn <= @to_lsn and c.__$start_lsn >= @from_lsn order by c.__$start_lsn desc, c.__$command_id desc, c.__$seqval desc ) and
		    ( (t.[AssetId] = m.[AssetId]) and (t.[ExitEventTime] = m.[ExitEventTime])  and (t.[ExitInstanceNumber] = m.[ExitInstanceNumber])  ) 	
		where lower(rtrim(ltrim(@row_filter_option))) = N'all with mask'
			and ( [sys].[fn_cdc_check_parameters]( N'ZoneVisitation', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 1) = 1)
			and (t.__$start_lsn <= @to_lsn)
			and (t.__$start_lsn >= @from_lsn)
			and ((t.__$operation = 2) or (t.__$operation = 4) or 
				 ((t.__$operation = 1) and
				  (2 not in 
				 		(	select top 1 c.__$operation
							from [cdc].[ZoneVisitation_CT] c with (nolock)
							where  ( (c.[AssetId] = t.[AssetId]) and (c.[ExitEventTime] = t.[ExitEventTime])  and (c.[ExitInstanceNumber] = t.[ExitInstanceNumber])  )  
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
					[cdc].[ZoneVisitation_CT] as mo with (nolock)
				where
					mo.__$seqval = t.__$seqval
					and 
					 ( (t.[AssetId] = mo.[AssetId]) and (t.[ExitEventTime] = mo.[ExitEventTime])  and (t.[ExitInstanceNumber] = mo.[ExitInstanceNumber])  ) 
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
		null as __$update_mask , t.[AssetId], t.[ExitEventTime], t.[ExitInstanceNumber], t.[EntryEventTime], t.[EntryInstanceNumber], t.[ZoneRevisionId]
		from [cdc].[ZoneVisitation_CT] t  with (nolock)
		where lower(rtrim(ltrim(@row_filter_option))) = N'all with merge'
			and ( [sys].[fn_cdc_check_parameters]( N'ZoneVisitation', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 1) = 1)
			and (t.__$start_lsn <= @to_lsn)
			and (t.__$start_lsn >= @from_lsn)
			and (t.__$seqval = ( select top 1 c.__$seqval from [cdc].[ZoneVisitation_CT] c with (nolock) where  ( (c.[AssetId] = t.[AssetId]) and (c.[ExitEventTime] = t.[ExitEventTime])  and (c.[ExitInstanceNumber] = t.[ExitInstanceNumber])  )  and c.__$start_lsn <= @to_lsn and c.__$start_lsn >= @from_lsn order by c.__$start_lsn desc, c.__$command_id desc, c.__$seqval desc ))
			and ((t.__$operation = 2) or (t.__$operation = 4) or 
				 ((t.__$operation = 1) and 
				   (2 not in 
				 		(	select top 1 c.__$operation
							from [cdc].[ZoneVisitation_CT] c with (nolock)
							where  ( (c.[AssetId] = t.[AssetId]) and (c.[ExitEventTime] = t.[ExitEventTime])  and (c.[ExitInstanceNumber] = t.[ExitInstanceNumber])  )  
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
					[cdc].[ZoneVisitation_CT] as mo with (nolock)
				where
					mo.__$seqval = t.__$seqval
					and 
					 ( (t.[AssetId] = mo.[AssetId]) and (t.[ExitEventTime] = mo.[ExitEventTime])  and (t.[ExitInstanceNumber] = mo.[ExitInstanceNumber])  ) 
				group by
					mo.__$seqval
			)
	 
GO
GRANT SELECT ON  [cdc].[fn_cdc_get_net_changes_ZoneVisitation] TO [cdc_Admin]
GO
