# Player removed forceload - get them to enable it again
execute unless score ErrorMode _ctg_main matches 0.. run function ctg:text/forceload_error

scoreboard players operation Reminder _ctg_scratch = ErrorMode _ctg_main
scoreboard players set 600 _ctg_scratch 600
scoreboard players operation Reminder _ctg_scratch %= 600 _ctg_scratch

execute if score Reminder _ctg_scratch matches 0 run function ctg:text/fix_forceload_error
scoreboard players add ErrorMode _ctg_main 1
