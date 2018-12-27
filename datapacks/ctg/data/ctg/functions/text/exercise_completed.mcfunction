scoreboard players operation Random _ctg_scratch = Tick _ctg_main
scoreboard players set 2 _ctg_scratch 2
scoreboard players operation Random _ctg_scratch %= 2 _ctg_scratch

execute if score Random _ctg_scratch matches 0 run tellraw @a [{"text":"\n"},{"translate":"Great work!", "color":"gold"}]
execute if score Random _ctg_scratch matches 1 run tellraw @a [{"text":"\n"},{"translate":"Well done!", "color":"gold"}]
