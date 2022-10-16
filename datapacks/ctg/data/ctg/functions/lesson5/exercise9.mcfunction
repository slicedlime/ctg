# Player state
function ctg:gamemode/creative

scoreboard objectives add _ctg_stick_used minecraft.used:minecraft.debug_stick

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson5/exercise9_l1

execute if score DisplayCooldown _ctg_main matches 2.. run scoreboard players remove DisplayCooldown _ctg_main 1
execute if score DisplayCooldown _ctg_main matches 1 run scoreboard players reset DisplayCooldown _ctg_main
execute as @a[scores={_ctg_stick_used=1}] run scoreboard players set DisplayCooldown _ctg_main 60
scoreboard players operation ShowObjective _ctg_scratch = Tick _ctg_main
scoreboard players set 40 _ctg_scratch 40
scoreboard players operation ShowObjective _ctg_scratch %= 40 _ctg_scratch
execute unless score DisplayCooldown _ctg_main matches 1.. if score ShowObjective _ctg_scratch matches 0 run function ctg:text/lesson5/exercise9_objective

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 9 if block 51 133 70 sea_pickle[pickles=4,waterlogged=true] if entity @a[scores={_ctg_stick_used=1}] run scoreboard players set Completed _ctg_scratch 1

scoreboard players reset * _ctg_stick_used
execute unless block 51 133 70 sea_pickle run setblock 51 133 70 sea_pickle[waterlogged=false]

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 10
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
