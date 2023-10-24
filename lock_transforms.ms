try(closeRolloutFloater MainFloater) catch()

------------------------------------  Rollout 01 ----------------------------------------------------------------------------------------------------------------------------


rollout menu01 "--- Lock All Transform For Selection ---"
	(
		label type01 "PLEASE SELECT OBJECT"
		
		
		button b1 "LOCK"  pos:[5,30] width:130 height:50
		on b1 pressed do
			(
				for obj in selection do if superClassOf obj == camera then
				( 
					setTransformLockFlags obj #all
					setTransformLockFlags obj.target #all
				)
				
				else
				(
					setTransformLockFlags selection #all
				)
			)
			
		button b2 "UNLOCK" pos:[150,30] width:130 height:50
		on b2 pressed do
			(
				for obj in selection do if superClassOf obj == camera then
				( 
					setTransformLockFlags obj #none
					setTransformLockFlags obj.target #none
				)
				
				else
				(
					setTransformLockFlags selection #none
				)
			)
	)
	
------------------------------------  END of Rollout 01 -------------------------------------------------------------------------------------------------------------------

	
------------------------------------  Rollout 02 ----------------------------------------------------------------------------------------------------------------------------	
	
	
rollout menu02 "--- Separated Transforms ---"	
	(
-------------------------------    TRANSFORM    -------------------------------	
		
		
		label type01 "--- TRANSFORM ---"
		
		button b3 "LOCK" pos:[40,30] width: 80
		on b3 pressed do
			(
				for obj in selection do if superClassOf obj == camera then
				( 
					setTransformLockFlags obj (getTransformLockFlags obj + #{1..3})
					setTransformLockFlags obj.target (getTransformLockFlags obj.target + #{1..3})
				)
				else
				(
					setTransformLockFlags obj (getTransformLockFlags obj + #{1..3})
				)
			)
		
		button b4 "UNLOCK" pos:[160,30] width: 80
		on b4 pressed do
			(
				for obj in selection do if superClassOf obj == camera then
				( 
					setTransformLockFlags obj (getTransformLockFlags obj - #{1..3})
					setTransformLockFlags obj.target (getTransformLockFlags obj.target -  #{1..3})
				)
				else
				(
					setTransformLockFlags obj (getTransformLockFlags obj - #{1..3})
				)
			)
			
			
-------------------------------    ROTATION    -------------------------------	

			
		label type02 "--- ROTATION ---"
		
		button b5 "LOCK" pos:[40,80] width: 80
		on b5 pressed do
			(
				for obj in selection do if superClassOf obj == camera then
				( 
					setTransformLockFlags obj (getTransformLockFlags obj + #{4..6})
					setTransformLockFlags obj.target (getTransformLockFlags obj.target + #{4..6})
				)
				else
				(
					setTransformLockFlags obj (getTransformLockFlags obj + #{4..6})
				)
			)
		
		button b6 "UNLOCK" pos:[160,80] width: 80
		on b6 pressed do
			(
				for obj in selection do if superClassOf obj == camera then
				( 
					setTransformLockFlags obj (getTransformLockFlags obj - #{4..6})
					setTransformLockFlags obj.target (getTransformLockFlags obj.target - #{4..6})
				)
				else
				(
					setTransformLockFlags obj (getTransformLockFlags obj - #{4..6})
				)
			)
			
			
-------------------------------    SCALE    -------------------------------

			
		label type03 "--- SCALE ---"
		
		button b7 "LOCK" pos:[40,130] width: 80
		on b7 pressed do
			(
				for obj in selection do if superClassOf obj == camera then
				( 
					setTransformLockFlags obj (getTransformLockFlags obj + #{7..9})
					setTransformLockFlags obj.target (getTransformLockFlags obj.target + #{7..9})
				)
				else
				(
					setTransformLockFlags obj (getTransformLockFlags obj + #{7..9})
				)
			)
		
		button b8 "UNLOCK" pos:[160,130] width: 80
		on b8 pressed do
			(
				for obj in selection do if superClassOf obj == camera then
				( 
					setTransformLockFlags obj (getTransformLockFlags obj - #{7..9})
					setTransformLockFlags obj.target (getTransformLockFlags obj.target - #{7..9})
				)
				else
				(
					setTransformLockFlags obj (getTransformLockFlags obj - #{7..9})
				)
			)	
	)

	
------------------------------------  END of Rollout 01 -------------------------------------------------------------------------------------------------------------------
	
	
rollout menu03 "Cameras In Scene"
	
(
	
	label type01 "--- Lock All Cameras In the Scene ---"
	
	button b9 "LOCK ALL CAMERAS" pos:[5,30] width:130 height:50
	on b9 pressed do 
	(
		mySelection = getCurrentSelection()
		select cameras
		for selCams in selection do
			
		(
			setTransformLockFlags selection #all
			clearselection()
			select mySelection
		)
	)
	
	button b10 "UNLOCK ALL CAMERAS" pos:[150,30] width:130 height:50
	on b10 pressed do 
	(
		mySelection = getCurrentSelection()
		select cameras
		for selCams in selection do
			
		(
			setTransformLockFlags selection #none
			clearselection()
			select mySelection
		)
	)
	
	
)

	
-------------------------------    END    -------------------------------

MainFloater = newRolloutFloater "Lock Transform v0.2" 300 398
addRollout menu01 MainFloater 
addRollout menu02 mainFloater
addRollout menu03 mainFloater