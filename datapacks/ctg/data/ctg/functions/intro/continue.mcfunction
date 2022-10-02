# Only do stuff if we´re in the right lesson
execute unless score Lesson _ctg_main matches 0 run function ctg:text/cheater

execute if score Lesson _ctg_main matches 0 run function ctg:transition_start

# Continue to lesson 1
execute if score Lesson _ctg_main matches 0 run scoreboard players set Lesson _ctg_scratch 1
execute if score Lesson _ctg_main matches 0 run scoreboard players set Exercise _ctg_scratch 0
execute if score Lesson _ctg_main matches 0 run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 0 run function ctg:store

function ctg:completed
