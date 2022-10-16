# Player state
function ctg:gamemode/creative

scoreboard objectives add _ctg_stick_used minecraft.used:minecraft.debug_stick

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson5/exercise8_l1
function ctg:text/lesson5/exercise8_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 8 if block 52 134 67 redstone_lamp[lit=true] if entity @a[scores={_ctg_stick_used=1}] run scoreboard players set Completed _ctg_scratch 1

scoreboard players reset * _ctg_stick_used
execute unless score Completed _ctg_scratch matches 1 run setblock 52 134 67 minecraft:redstone_lamp[lit=false]

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 9
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
