# Switch to next transition node

kill @e[tag=_ctg_target,scores={_ctg_main=1}]
scoreboard players remove @e[tag=_ctg_target,scores={_ctg_main=1..}] _ctg_main 1

execute unless entity @e[tag=_ctg_target,scores={_ctg_main=1}] run kill @e[tag=_ctg_spline]
execute unless entity @e[tag=_ctg_target,scores={_ctg_main=1}] run kill @e[tag=_ctg_eyes]
