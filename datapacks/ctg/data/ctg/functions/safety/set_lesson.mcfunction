# Since any amount of tampering or mistakes could've happened,
# guess lesson number based on several sources

scoreboard players set MainLesson _ctg_scratch 0
scoreboard players set MainExercise _ctg_scratch 0
scoreboard players operation MainLesson _ctg_scratch = Lesson _ctg_main
scoreboard players operation MainExercise _ctg_scratch = Exercise _ctg_main

scoreboard players set BackupLesson _ctg_scratch 0
scoreboard players set BackupExercise _ctg_scratch 0
scoreboard players operation BackupLesson _ctg_scratch = Lesson _ctg_backup
scoreboard players operation BackupExercise _ctg_scratch = Exercise _ctg_backup

scoreboard players set EntityLesson _ctg_scratch 0
scoreboard players set EntityExercise _ctg_scratch 0
execute store result score EntityLesson _ctg_scratch run data get entity @e[type=minecraft:area_effect_cloud,tag=_ctg_backup,limit=1] DurationOnUse
execute store result score EntityExercise _ctg_scratch run data get entity @e[type=minecraft:area_effect_cloud,tag=_ctg_backup,limit=1] WaitTime

scoreboard players set BlockLesson _ctg_scratch 0
scoreboard players set BlockExercise _ctg_scratch 0
execute store result score BlockLesson _ctg_scratch run data get block 1024 0 1024 ExitPortal.X
execute store result score BlockLesson _ctg_scratch run data get block 1024 0 1024 ExitPortal.Z

# Okay, now we have 4 sources of the lesson and exercise values.
# Pick whichever is lowest but positive

scoreboard players set Lesson _ctg_scratch 2147483647
execute if score MainLesson _ctg_scratch matches 1.. run scoreboard players operation Lesson _ctg_scratch < MainLesson _ctg_scratch
execute if score BackupLesson _ctg_scratch matches 1.. run scoreboard players operation Lesson _ctg_scratch < BackupLesson _ctg_scratch
execute if score EntityLesson _ctg_scratch matches 1.. run scoreboard players operation Lesson _ctg_scratch < EntityLesson _ctg_scratch
execute if score BlockLesson _ctg_scratch matches 1.. run scoreboard players operation Lesson _ctg_scratch < BlockLesson _ctg_scratch
execute if score Lesson _ctg_scratch matches 2147483647 run scoreboard players set Lesson _ctg_scratch 0

scoreboard players set Exercise _ctg_scratch 2147483647
execute if score MainExercise _ctg_scratch matches 1.. run scoreboard players operation Exercise _ctg_scratch < MainExercise _ctg_scratch
execute if score BackupExercise _ctg_scratch matches 1.. run scoreboard players operation Exercise _ctg_scratch < BackupExercise _ctg_scratch
execute if score EntityExercise _ctg_scratch matches 1.. run scoreboard players operation Exercise _ctg_scratch < EntityExercise _ctg_scratch
execute if score BlockExercise _ctg_scratch matches 1.. run scoreboard players operation Exercise _ctg_scratch < BlockExercise _ctg_scratch
execute if score Exercise _ctg_scratch matches 2147483647 run scoreboard players set Exercise _ctg_scratch 0

# Okay, got numbers. Store them back everywhere

function ctg:store
