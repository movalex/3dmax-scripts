try destroyDialog ::MoveKeyTool catch()
rollout MoveKeyTool "Move Key"
(
    group "Settings"
    (
        spinner OffsetBySpn "Offset by" type:#integer range:[-1e3,1e3,10]
        button OffsetFramesBt "Offset Keyframes"        

        on OffsetFramesBt pressed do
        (
            local currentTV = trackViews.current
            if currentTV == undefined do return messageBox "Trackview window has to be open."
            local selCount = currentTV.numSelTracks()

            for i = 1 to selCount
                where (local ctrl = currentTV.getSelected i).keyable do
                    moveKeys ctrl OffsetBySpn.value #selection
        )
    )
)
createdialog MoveKeyTool