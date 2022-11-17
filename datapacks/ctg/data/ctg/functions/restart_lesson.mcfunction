# Restart current lesson

scoreboard players set Tick _ctg_main 0
scoreboard players set Tick _ctg_backup 0
scoreboard players set Exercise _ctg_scratch 0
scoreboard players operation Lesson _ctg_scratch = Lesson _ctg_main
tag @a add _ctg_transition_done

function ctg:store
