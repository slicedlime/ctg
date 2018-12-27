# Increase Tick counter

scoreboard players add Tick _ctg_main 1
scoreboard players operation Tick _ctg_backup = Tick _ctg_main
