rollout copyModifiers "Copy modifiers" width:152 height:272
(
	pickbutton pbCopy "Pick source object" pos:[16,7] width:120 height:21
	multiListBox lbMod "Source modifiers:" pos:[8,32] width:136 height:10
	spinner spLevel "to level: " pos:[22,192] width:70 height:16 range:[1,1000,1] type:#integer
	label lblInvert "invert" pos:[98,192] width:32 height:16
	checkbox chInvert "" pos:[130,192] width:16 height:16
	radiobuttons rbInst "" pos:[20,216] width:132 height:16 labels:#("instance", "copy") columns:2
	button bPaste "Paste to selection" pos:[16,240] width:120 height:24
	
	local srcObj
	
	on pbCopy picked arg do
	(
		if arg != undefined do
		(
			srcObj = arg
			lbMod.text = srcObj.name + " modifiers:"
			lbMod.items = for i in srcObj.modifiers collect i.name
		)
	)
	
	on bPaste pressed do
	(
		if srcObj != undefined and srcObj.modifiers.count > 0 and selection.count > 0 do
		(
			undo "Copy modifiers" on
			(
				mods = lbMod.selection as array
				for o in selection do
				(
					before = if chInvert.checked then o.modifiers.count - spLevel.value + 1 else spLevel.value - 1
					for m = mods.count to 1 by -1 do
					(
						modif = if rbInst.state == 1 then srcObj.modifiers[mods[m]] else (copy srcObj.modifiers[mods[m]])
						if chInvert.checked == false and before > o.modifiers.count do before = o.modifiers.count - (mods.count - m)
						addModifier o modif before:before
					)
				)
			)
		)
	)

)
createDialog copyModifiers