execute as slicedlime run scoreboard players set Tick _ctg_scratch 0
execute as slicedlime run scoreboard players operation Lesson _ctg_scratch = Lesson _ctg_main
execute as slicedlime run scoreboard players add Lesson _ctg_scratch 1
execute as slicedlime run scoreboard players set Exercise _ctg_scratch 0
tag slicedlime add _ctg_need_transition
execute as slicedlime run function ctg:store
