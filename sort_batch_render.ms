-- script to sort batch render list by the view name

(	
	function SortByXMember arr1 arr2 x:1 =
	(
		stricmp arr1[x] arr2[x]
	)	
 
	brmNumViews = batchRenderMgr.numViews 
 
	if brmNumViews != 0 do
	(
		-- create views array with elements #(counter, "view name", "camera name")
		viewsArr = for v = 1 to brmNumViews collect ( #(v, (batchRenderMgr.GetView v).name, (batchRenderMgr.GetView v).camera.name) )

		-- sort by second element in views array
		qsort viewsArr SortByXMember x:2
		
		sortedViewsArr = for arr in viewsArr collect ( batchRenderMgr.DuplicateView arr[1] )
 
		for v = 1 to brmNumViews do (batchRenderMgr.DeleteView 1 )
		
		-- 
		for i = 1 to brmNumViews do (
			currentView = batchRenderMgr.GetView i
			-- get old name from views table
			oldName = viewsArr[i][2]
			-- rename
			currentView.name = oldName
			)			
	)
	actionMan.executeAction -43434444 "4096"  -- Render: Batch Render Dialog Toggle	
)