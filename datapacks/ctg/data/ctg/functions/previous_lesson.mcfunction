scoreboard players set Tick _ctg_scratch 0
scoreboard players set Exercise _ctg_scratch 0
scoreboard players operation Lesson _ctg_scratch = Lesson _ctg_main
scoreboard players remove Lesson _ctg_scratch 1
tag @a add _ctg_transition_done

function ctg:store