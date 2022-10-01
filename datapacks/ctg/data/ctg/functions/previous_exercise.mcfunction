scoreboard players set Tick _ctg_scratch 0
scoreboard players operation Exercise _ctg_scratch = Exercise _ctg_main
scoreboard players remove Exercise _ctg_scratch 1
scoreboard players operation Lesson _ctg_scratch = Lesson _ctg_main

function ctg:store