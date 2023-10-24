
-- toggle all views in batch render 
for i=1 to batchRenderMgr.numViews do ( 
	currentView = batchRenderMgr.GetView i
	currentView.enabled = not currentView.enabled
)

-- show batch render
actionMan.executeAction -43434444 "4096" 