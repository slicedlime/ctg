# Player state
execute if score Tick _ctg_main matches 1 run clear @a
execute if score Tick _ctg_main matches 1 run function ctg:lesson3/exercise4_spawn

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson3/exercise4_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson3/exercise4_l2
function ctg:text/lesson3/exercise4_objective

# Track game modes. Only count adventure once player has switched away once
execute as @e[type=marker,tag=_ctg_adventure_pending] if entity @a[gamemode=!adventure] run tag @s add _ctg_adventure
tag @e[type=marker,tag=_ctg_adventure] remove _ctg_adventure_pending

execute if entity @a[gamemode=survival] run kill @e[type=marker,tag=_ctg_survival]
execute if entity @a[gamemode=creative] run kill @e[type=marker,tag=_ctg_creative]
execute if entity @a[gamemode=spectator] run kill @e[type=marker,tag=_ctg_spectator]
execute if entity @a[gamemode=adventure] run kill @e[type=marker,tag=_ctg_adventure]

# Win condition
scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 4 unless entity @e[type=marker,tag=_ctg_l3e4] run scoreboard players set Completed _ctg_scratch 1

execute if score Completed _ctg_scratch matches 1 run function ctg:completed
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 3
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 5
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
