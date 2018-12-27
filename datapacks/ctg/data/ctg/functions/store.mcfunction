scoreboard players operation Lesson _ctg_main = Lesson _ctg_scratch
scoreboard players operation Exercise _ctg_main = Exercise _ctg_scratch

scoreboard players operation Lesson _ctg_backup = Lesson _ctg_scratch
scoreboard players operation Exercise _ctg_backup = Exercise _ctg_scratch

execute store result entity @e[type=minecraft:area_effect_cloud,tag=_ctg_backup,limit=1] DurationOnUse int 1 run scoreboard players get Lesson _ctg_scratch
execute store result entity @e[type=minecraft:area_effect_cloud,tag=_ctg_backup,limit=1] WaitTime int 1 run scoreboard players get Exercise _ctg_scratch

execute store result block 1024 0 1024 ExitPortal.X int 1 run scoreboard players get Lesson _ctg_scratch
execute store result block 1024 0 1024 ExitPortal.Z int 1 run scoreboard players get Exercise _ctg_scratch

execute if score Tick _ctg_scratch matches -1.. run scoreboard players operation Tick _ctg_main = Tick _ctg_scratch
execute if score Tick _ctg_scratch matches -1.. run scoreboard players operation Tick _ctg_backup = Tick _ctg_scratch
