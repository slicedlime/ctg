# End the intro, move to exercise 1

# Only do stuff if we're in the right lesson
execute unless score Lesson _ctg_main matches 4 unless score Exercise _ctg_main matches 0 run function ctg:text/cheater

execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 0 run setblock -15 114 31 minecraft:mangrove_wall_sign[facing=south,waterlogged=false]{Text4:'{"text":"start over"}',Text3:'{"clickEvent":{"action":"run_command","value":"/function ctg:restart_exercise"},"text":"Click here to"}',Text2:'{"text":"JochCool!"}',Text1:'{"text":"Island by"}'}

execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 0 run kill @e[type=armor_stand,tag=_ctg_view]

# Continue to exercise 1
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 0 run scoreboard players set Lesson _ctg_scratch 4
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 0 run scoreboard players set Exercise _ctg_scratch 1
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 0 run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 0 run function ctg:store

