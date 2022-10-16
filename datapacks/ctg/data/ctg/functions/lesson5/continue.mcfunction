# Only do stuff if we´re in the right lesson
execute unless score Lesson _ctg_main matches 5 run function ctg:text/cheater
execute unless score Completed _ctg_scratch matches 1 run function ctg:text/cheater

execute if score Lesson _ctg_main matches 5 if score Completed _ctg_scratch matches 1 run function ctg:transition_start

# Continue to lesson 6
execute if score Lesson _ctg_main matches 5 if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Lesson _ctg_main matches 5 if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Lesson _ctg_main matches 5 if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 0
execute if score Lesson _ctg_main matches 5 if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 5 if score Completed _ctg_scratch matches 1 run function ctg:store
