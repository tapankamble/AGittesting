SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	create function [cdc].[fn_cdc_get_all_changes_Association]
	(	@from_lsn binary(10),
		@to_lsn binary(10),
		@row_filter_option nvarchar(30)
	)
	returns table
	return
	
	select NULL as __$start_lsn,
		NULL as __$seqval,
		NULL as __$operation,
		NULL as __$update_mask, NULL as [AssociationId], NULL as [AssocEntityId], NULL as [AssetId], NULL as [StartEventTime], NULL as [StartInstanceNumber], NULL as [EndEventTime], NULL as [EndInstanceNumber], NULL as [DissociationTypeId]
	where ( [sys].[fn_cdc_check_parameters]( N'Association', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 0) = 0)

	union all
	
	select t.__$start_lsn as __$start_lsn,
		t.__$seqval as __$seqval,
		t.__$operation as __$operation,
		t.__$update_mask as __$update_mask, t.[AssociationId], t.[AssocEntityId], t.[AssetId], t.[StartEventTime], t.[StartInstanceNumber], t.[EndEventTime], t.[EndInstanceNumber], t.[DissociationTypeId]
	from [cdc].[Association_CT] t with (nolock)    
	where (lower(rtrim(ltrim(@row_filter_option))) = 'all')
	    and ( [sys].[fn_cdc_check_parameters]( N'Association', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 0) = 1)
		and (t.__$operation = 1 or t.__$operation = 2 or t.__$operation = 4)
		and (t.__$start_lsn <= @to_lsn)
		and (t.__$start_lsn >= @from_lsn)
		
	union all	
		
	select t.__$start_lsn as __$start_lsn,
		t.__$seqval as __$seqval,
		t.__$operation as __$operation,
		t.__$update_mask as __$update_mask, t.[AssociationId], t.[AssocEntityId], t.[AssetId], t.[StartEventTime], t.[StartInstanceNumber], t.[EndEventTime], t.[EndInstanceNumber], t.[DissociationTypeId]
	from [cdc].[Association_CT] t with (nolock)     
	where (lower(rtrim(ltrim(@row_filter_option))) = 'all update old')
	    and ( [sys].[fn_cdc_check_parameters]( N'Association', @from_lsn, @to_lsn, lower(rtrim(ltrim(@row_filter_option))), 0) = 1)
		and (t.__$operation = 1 or t.__$operation = 2 or t.__$operation = 4 or
		     t.__$operation = 3 )
		and (t.__$start_lsn <= @to_lsn)
		and (t.__$start_lsn >= @from_lsn)
	
GO
GRANT SELECT ON  [cdc].[fn_cdc_get_all_changes_Association] TO [cdc_Admin]
GO
