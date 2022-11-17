# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run setblock 99 115 -57 air
fill 1024 10 1024 1034 40 1034 air

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson7/exercise3_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson7/exercise3_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson7/exercise3_l3
function ctg:text/lesson7/exercise3_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 3 if block 99 115 -57 command_block{Command:"kill @a"} run scoreboard players set Completed _ctg_scratch 1
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 3 if block 99 115 -57 command_block{Command:"/kill @a"} run scoreboard players set Completed _ctg_scratch 1

execute positioned 87 91 -63 run fill ~ ~ ~ ~31 ~31 ~31 air replace repeating_command_block

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 7
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 4
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store

execute if score Completed _ctg_scratch matches 1 run setblock 99 114 -57 green_wool
execute if score Completed _ctg_scratch matches 0 run setblock 99 114 -57 emerald_block
