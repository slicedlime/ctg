# End the intro, move to exercise 1

function ctg:gamemode/adventure

# Only do stuff if we're in the right lesson
execute unless score Lesson _ctg_main matches 3 unless score Exercise _ctg_main matches 0 run function ctg:text/cheater

execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 0 run setblock 40 120 -27 minecraft:oak_wall_sign[facing=west,waterlogged=false]{Text4:'{"text":"start over"}',Text3:'{"clickEvent":{"action":"run_command","value":"/function ctg:restart_exercise"},"text":"Click here to"}',Text2:'{"text":"JochCool!"}',Text1:'{"text":"Island by"}'}

# Continue to exercise 1
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 0 run scoreboard players set Lesson _ctg_scratch 3
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 0 run scoreboard players set Exercise _ctg_scratch 1
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 0 run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 0 run function ctg:store
